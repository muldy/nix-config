# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
      ./configuration.nix
     (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["quiet"];

  boot.plymouth.enable = true;

  boot.initrd.luks.devices."luks-ed5c62de-00df-4048-8a7d-9ebe3310e497".device = "/dev/disk/by-uuid/ed5c62de-00df-4048-8a7d-9ebe3310e497";
  networking.hostName = "ThinkPad-t14"; # Define your hostname.
  
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];

  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [
    "kvm-amd"
    "v4l2loopback"
    ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/d7befe0d-65ab-40b9-b0c5-5e80c215be76";
      fsType = "ext4";
      options = [
		"noatime"
		"nodiratime"
		"discard"
	];
    };
  boot.kernel.sysctl = { "vm.swappiness" = 0;};

  boot.initrd.luks.devices."luks-01f3a758-1747-4aa2-9a81-e2846f25e694".device = "/dev/disk/by-uuid/01f3a758-1747-4aa2-9a81-e2846f25e694";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D837-7A08";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/00b0f00b-0c59-4507-921a-8af9e3f39945"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp102s0f4u1u1.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0f0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
