_: {
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    alsa.support32Bit = true;
    jack.enable = true;
  };
}
