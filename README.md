# Add and update nixos-hardware channel:

```
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware 
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
```

# Flakes:
```
sudo nix flake init --template github:vimjoyer/flake-starter-config
$ sudo nixos-rebuild switch --flake /etc/nixos/#default
```

# Update configuration
```
sudo nixos-rebuild switch
```
# Clear boot entries
```
sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system 5d
```
