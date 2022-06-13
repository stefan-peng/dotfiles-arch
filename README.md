# dotfiles-arch

My dotfiles, mainly intended for Arch.

0. Install ssh keys

1. Install `yay` [https://github.com/Jguer/yay](https://github.com/Jguer/yay)

```
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

2. Install `yadm` [https://github.com/TheLocehiliosan/yadm](https://github.com/TheLocehiliosan/yadm)

```
yay -S yadm
```

3. Clone dotfiles

```
yadm clone git@github.com:stefan-peng/dotfiles-arch.git
```

4. Install other needed packages

```
yay -S --needed - < pkgs
```
