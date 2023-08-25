_: {
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "40762f1f";

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=2G" "mode=755" ];
  };

  fileSystems."/nix" = {
    device = "djungelskog/NixOS/nix";
    fsType = "zfs";
  };

  fileSystems."/persist" = {
    device = "djungelskog/NixOS/persist";
    fsType = "zfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/64D5-A612";
    fsType = "vfat";
  };
}
