# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ##### FILL THIS OUT #####
  networking.hostName = "INSERT_HOSTNAME_HERE"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Set your time zone.
  ##### FILL THIS OUT #####
  time.timeZone = "TIMEZONE HERE";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.

  ##### FILL THIS OUT #####

  users.users.NAME_HERE= {
    isNormalUser = true;
    description = "";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "docker" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.fonts = with pkgs; [
    nerdfonts
  ];

  ##### FILL THIS OUT #####
  services.getty.autologinUser = "USERNAME";

  services.gvfs.enable = true;

  programs.firefox.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
    	thunar-archive-plugin
	thunar-volman
    ];
  }; 
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Web Browsers
    firefox
    google-chrome

    # Useful terminal applications
    vim     			# Basic text editor to fall back on
    wget
    git
    yazi			# TUI file browser
    zsh				# Shell
    zsh-completions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    htop			# Process manager
    neofetch
    nitch			# Basically neofetch
    tree
    p7zip			# 7zip
    ripgrep
    lazygit			# TUI git manager
    unzip
    grimblast			# Screenshot tool
    wl-clipboard
    fzf				# Fuzzy finder
    fd				# Find
    spotify-player

    # Terminal
    alacritty
    alacritty-theme

    # Desktop
    waybar			# Status bar
    rofi-wayland		# Application launcher
    hyprland			# Tiling window manager
    hyprsunset			# Blue light filter
    hyprlock			# Lock screen
    hyprpaper			# Wallpaper manager
    nwg-dock-hyprland		# Hyprland dock
    ffmpegthumbnailer
    brightnessctl		# Handle laptop screen brightness

    # GUI file browser
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler

    # Desktop applications
    spotify
    vscode
    vesktop			# Discord application
    zathura			# PDF reader
    dolphin-emu			# Emulator
    obsidian			# Note taking application
    obs-studio			# Screen capture tool
    vlc				# Media tool


    # Programming/Dev tools
    neovim
    python3
    go
    rustup
    nodejs_23
    gcc
    libgcc
    docker
    docker-compose

    # Fonts
    nerdfonts

    # Misc
    lxappearance		# GTK themes and icons
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
