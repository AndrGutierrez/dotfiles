# My Dotfiles
This is my dotfiles config for my Debian setup


> *Note that since I have a lot of dependencies or plugins that I don't even remember some of these configurations won't work*

## Prerequisites
This repo contains configuration for:
- neovim
- picom ([fdev31's fork](https://github.com/fdev31/picom))
- zsh
- oh-my-zsh
- neofetch
- dunst
- starship prompt ([here](https://starship.rs/))
- cava ([here](https://github.com/karlstav/cava))
- polybar
- rofi
- ##### and most importantly in bspwm

(if there is not a link it is because probably it is in your distribution's repositories)
## Installation
Run in your home directory
```
git clone https://github.com/AndrGutierrez/dotfiles.git
if [ !  -d ".config" ]; then
  mkdir .config
fi
cp dotfiles/.Xresources ~/
cp dotfiles/.zshrc ~/
cp dotfiles/.config/* .config/
```
### Neovim
I use a specific neovim fork: neovim-nightly
so if you are an arch user just do:

`yay -S neovim-nightly-bin`

then open neovim and do:
```
:source %`
:PlugInstall
```
(this is in my case, you can use your favorit neovim plugin manager)
### Polybar
to change the polybar theme, go to `bspwmrc` and edit this line:
```
MONITOR=$m sh ~/.config/polybar/launch.sh --forest &
```
the important thing here is the `--forest` argument, replace it by any of the other options:

--blocks    --colorblocks    --cuts      --docky
--forest    --grayblocks     --hack      --material
--panels    --pwidgets       --shades    --shapes
    --default   --float
	
(I got most of the themes from [here](https://github.com/adi1090x/polybar-themes) and [here](https://github.com/ngynLk/polybar-themes))
### Rofi
My rofi themes and configuration for them is [here](https://github.com/adi1090x/rofi)
## Troubleshooting
### Neovim
if your plugin manager doesn't work with some plugins, like it is in my case,
go to `~/.config/nvim/plugged` and clone plugin's github repository in there
