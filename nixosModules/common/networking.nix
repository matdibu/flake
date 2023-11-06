{ config, lib, ... }: {
  # Enable systemd-networkd instead of NixOS scripts
  networking = {
    useDHCP = lib.mkForce false;
    useNetworkd = lib.mkForce true;
  };

  # Enable DHCP on all physical ethernet interfaces
  systemd.network.networks."10-eth-dhcp" = lib.mkIf (!config.services.cloud-init.network.enable) {
    # Match every ether type
    matchConfig.Type = "ether";
    # These are usually managed by VPNs, Hypervisors etc.
    matchConfig.Driver = "!tun";
    matchConfig.Name = "!veth* !vnet*";
    # Enable DHCP and routing
    networkConfig = {
      DHCP = "yes";
      IPForward = "yes";
      IPv6PrivacyExtensions = "kernel";
    };
  };

  # Desktop networking
  networking.networkmanager = {
    enable = config.services.xserver.enable;
    extraConfig = ''
      [connection]
      ipv6.ip6-privacy=2
    '';
  };
  environment.persistence."/persist".directories = lib.mkIf (config.networking.networkmanager.enable && config.ephemereal) [ "/etc/NetworkManager/system-connections" ];
  hardware.usb-modeswitch.enable = config.networking.networkmanager.enable;

  # mDNS
  services.avahi = {
    enable = config.services.xserver.enable;
    publish = {
      enable = true;
      userServices = true;
    };
  };

  # DNS
  services.resolved = {
    enable = true;
    llmnr = "false";
    fallbackDns = [
      "1.0.0.1#cloudflare-dns.com"
      "1.1.1.1#cloudflare-dns.com"
      "2606:4700:4700::1001#cloudflare-dns.com"
      "2606:4700:4700::1111#cloudflare-dns.com"
      "8.8.4.4#dns.google"
      "8.8.8.8#dns.google"
      "2001:4860:4860::8844#dns.google"
      "2001:4860:4860::8888#dns.google"
      "9.9.9.11#dns11.quad9.net"
      "149.112.112.11#dns11.quad9.net"
      "2620:fe::11#dns11.quad9.net"
      "2620:fe::fe:11#dns11.quad9.net"
    ];
    extraConfig = ''
      [Resolve]
      MulticastDNS=false
      DNSOverTLS=opportunistic
    '';
  };

  # Tailscale
  networking.firewall.trustedInterfaces = [ config.services.tailscale.interfaceName ];
  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "both";
  };

  # kernel tuning
  boot.kernelModules = [ "tcp_bbr" ];
  boot.kernel.sysctl = {
    # BBR (v1 or v3 depends on if we use stock or something fancier like xanmod)
    "net.ipv4.tcp_congestion_control" = lib.mkForce "bbr";
    "net.core.default_qdisc" = lib.mkForce "cake";

    "net.core.netdev_max_backlog" = 16384;
    "net.core.somaxconn" = 8192;

    "net.core.rmem_default" = 1048576;
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_default" = 1048576;
    "net.core.wmem_max" = 16777216;
    "net.core.optmem_max" = 65536;
    "net.ipv4.tcp_rmem" = "4096 1048576 2097152";
    "net.ipv4.tcp_wmem" = "4096 65536 16777216";

    "net.ipv4.udp_rmem_min" = 8192;
    "net.ipv4.udp_wmem_min" = 8192;

    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_max_syn_backlog" = 8192;
    "net.ipv4.tcp_max_tw_buckets" = 2000000;
    "net.ipv4.tcp_tw_reuse" = 1;
    "net.ipv4.tcp_fin_timeout" = 10;
    "net.ipv4.tcp_slow_start_after_idle" = 0;

    "net.ipv4.tcp_keepalive_time" = 60;
    "net.ipv4.tcp_keepalive_intvl" = 10;
    "net.ipv4.tcp_keepalive_probes" = 6;

    "net.ipv4.tcp_mtu_probing" = 1;
  };
}
