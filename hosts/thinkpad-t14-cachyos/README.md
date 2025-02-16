
```shell
sh <(curl -L httpis://nixos.org/nix/install) --daemon


nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

home-manager build -f ~/nix-config/wsl-home/home.nix

home-manager switch -f ~/nix-config/wsl-home/home.nix -b bck

sudo apt install zsh
chsh /nix/store/lw3whxwhfj8qy0dyyqwxl12m7dp6xjh8-home-manager-path/bin/zsh
home-manager switch -f ~/nix-config/hosts/cachyos-ryzen/home.nix

```
ix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault   # or replace `nixGLDefault` with your desired wrapper