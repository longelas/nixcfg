{
  config,
  pkgs,
  inputs,
  ...
}: {
  
  programs.zsh.enable = true;
  users.users.longee = {
    initialHashedPassword = "$y$j9T$yfrJBk8yMn1GMkJNqHCGA/$YpsLrkSClbtDy.O9uSvJQXr8G3xbDm9weH3zg9cr7T5";
    isNormalUser = true;
    description = "longee";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsUQTVZR2GONHiHZEKH2bsomxbcpnzF9+oj9Qk/TXJ+ mt.hrvth@gmail.com"];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.longee =
    import ../../../home/longee/${config.networking.hostName}.nix;
}