{ inputs, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Debloat
  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-console
      gnome-photos
      gnome-tour
      gnome-user-docs
      orca
    ])
    ++ (with pkgs.gnome; [
      baobab
      cheese
      epiphany
      evince
      gnome-clocks
      gnome-disk-utility
      gnome-logs
      gnome-maps
      gnome-music
      gnome-shell-extensions
      gnome-software
      gnome-system-monitor
      gnome-themes-extra
      totem
      yelp
    ]);

  # Other software
  environment.systemPackages = with pkgs; [
    # GNOME
    blackbox-terminal
    gnomeExtensions.appindicator
    gnomeExtensions.auto-move-windows
    gnomeExtensions.caffeine
    gnomeExtensions.user-themes
    gnome.gnome-session
    gnome.gnome-tweaks

    # Theming
    adw-gtk3
    papirus-icon-theme

    # Tool to fix Mesa 23.0+ trolls
    inputs.self.packages.${pkgs.system}.gpucache

    # Fetch gravatar and install as ~/.face
    inputs.self.packages.${pkgs.system}.gnome-gravatar

    # The way Weather works in GNOME is terrible :(
    inputs.self.packages.${pkgs.system}.gnome-weather-set

    # show dconf nicely
    (pkgs.writeScriptBin "dconf-dump" ''exec dconf dump / | bat -l toml'')
  ];

  fonts = {
    fontconfig.defaultFonts = {
      monospace = [ "Cascadia Code PL" ];
      sansSerif = [ "IBM Plex Sans" ];
      serif = [ "IBM Plex Serif" ];
    };
    packages = with pkgs; [
      cascadia-code
      ibm-plex
    ];
  };

  services.power-profiles-daemon.enable = false;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  programs.gamemode.enable = true;

  # QT GNOME styling
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
