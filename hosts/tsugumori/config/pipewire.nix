{
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    alsa.support32Bit = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
    enable = true;
  };
}
