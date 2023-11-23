# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "io/bassi/Amberol" = {
      background-play = false;
      replay-gain = "track";
    };

    "com/raggesilver/BlackBox" = {
      context-aware-header-bar = false;
      floating-controls = false;
      font = "Cascadia Code PL 11";
      headerbar-drag-area = true;
      pretty = true;
      show-headerbar = true;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "" ];
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "pl" ]) ];
    };

    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      document-font-name = "IBM Plex Serif 11";
      font-name = "IBM Plex Sans 11";
      gtk-theme = "Graphite-pink-Dark";
      icon-theme = "Papirus";
      monospace-font-name = "IBM Plex Mono 11";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/media-handling" = {
      autorun-never = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      disable-while-typing = false;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 300;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "suspend";
    };

    "org/gnome/desktop/wm/preferences" = {
      resize-with-right-button = true;
      titlebar-font = "IBM Plex Sans Bold 11";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      mic-mute = [ "<Control>m" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>r";
      command = "blackbox";
      name = "Start terminal";
    };

    "org/gnome/shell" = {
      app-picker-layout = [ "" ];
      disable-extension-version-validation = true;
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "com.raggesilver.BlackBox.desktop" "google-chrome.desktop" "google-chrome-beta.desktop" "google-chrome-unstable.desktop" "org.telegram.desktop.desktop" "discord.desktop" "discord-canary.desktop" "armcord.desktop" "slack.desktop" "timedoctor-desktop.desktop" "org.gnome.Geary.desktop" "org.gnome.Lollypop.desktop" "io.bassi.Amberol.desktop" "code.desktop" "org.gabmus.gfeeds.desktop" "org.prismlauncher.PrismLauncher.desktop" "lunar-client.desktop" "steam.desktop" "pavucontrol.desktop" "com.github.wwmm.easyeffects.desktop" "virt-manager.desktop" "transmission-gtk.desktop" "org.qbittorrent.qBittorrent.desktop" "ledger-live-desktop.desktop" "bitwarden.desktop" ];
    };

    "org/gnome/shell/extensions/appindicator" = {
      icon-saturation = 1.0;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Graphite-pink-Dark";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/virt-manager/virt-manager" = {
      xmleditor-enabled = true;
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" "lxc:///" ];
      uris = [ "lxc:///" "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/console" = {
      auto-redirect = false;
      resize-guest = 1;
    };

    "org/virt-manager/virt-manager/new-vm" = {
      cpu-default = "host-passthrough";
      graphics-type = "system";
    };

  };
}