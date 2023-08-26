{ config, pkgs, lib, ... }:
# Other useful settings come from srvos's zfs module
{
  config = lib.mkIf config.boot.zfs.enabled {
    environment.systemPackages = [
      pkgs.zfs-prune-snapshots
    ];

    boot.kernelPackages = (pkgs.zfsUnstable.override {
      removeLinuxDRM = pkgs.hostPlatform.isAarch64;
    }).latestCompatibleLinuxPackages;

    boot.zfs = {
      removeLinuxDRM = lib.mkDefault pkgs.hostPlatform.isAarch64;
      enableUnstable = true;
    };
  };
}
