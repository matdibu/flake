{ config, lib, pkgs, ... }:
let
  hasEfi = (config.fileSystems."/boot".fsType or "") == "vfat";
in
{
  # Kernel
  boot = {
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    kernelParams = [
      "amd_iommu=on"
      "efi=disable_early_pci_dma"
      "intel_iommu=on"
      "iommu=pt"
    ];
  };

  # Bootloader
  boot.loader = {
    # The number of seconds for user intervention before the default boot option is selected.
    timeout = lib.mkDefault 3;
    efi.canTouchEfiVariables = hasEfi;
    grub = {
      enable = lib.mkDefault (!hasEfi);
      efiSupport = lib.mkDefault false;
      device = "nodev";
      fsIdentifier = "label";
    };
    systemd-boot = {
      enable = lib.mkDefault hasEfi;
      # The resolution of the console. A higher resolution displays more entries.
      consoleMode = "max";
    };
  };
}
