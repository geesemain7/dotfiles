Dotfiles and stuff for my "rice" ^^\
Now organized to be usable with GNU stow

## Screenshots

<img width="500" alt="fastfetch" src="https://github.com/user-attachments/assets/c4b33d18-adbd-4a6c-9591-4915695ea0bf" />

<img width="500" alt="helix" src="https://github.com/user-attachments/assets/601c5d27-8fa1-4dcd-a44f-30b25025246f" />

<img width="500" alt="nautilus" src="https://github.com/user-attachments/assets/e1c0f52c-2d99-4ae1-bcec-c9f47e765ee0" />

## Setup
### Desktop
- WM: [Hyprland](https://hypr.land)
- Desktop shell: [Noctalia](https://noctalia.dev)
- Shell: [fish](https://fishshell.com)
- Terminal: [kitty](https://sw.kovidgoyal.net/kitty)
- Text editor: [Helix](https://helix-editor.com)
### Theming
- Theme: [Osaka-GTK](https://github.com/Fausto-Korpsvart/Osaka-GTK-Theme)
- Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono)
- Icons: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- Cursor: [Bibata_Cursor](https://github.com/ful1e5/Bibata_Cursor)

## Installation
Install [stow](https://www.gnu.org/software/stow) for ease of use
    
    $ git clone https://github.com/geesemain7/dotfiles && cd dotfiles
    $ stow .

or
    
    $ git clone https://github.com/geesemain7/dotfiles && cd dotfiles
    $ rsync -a .config ~/.config
    $ rsync -a .icons ~/.icons
