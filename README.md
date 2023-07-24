# termSwitcher.vim

Quickly open and close Nvim_terminal_emulator.  

![both2](https://github.com/keiyakeiya/termSwitcher.vim/assets/75249966/13a444c9-389a-434b-91a2-3cab3509d466)

## Feature

- Open or close the terminal window down or right.
- This plugin uses only one terminal buffer.

## Installation

You can install this plugin using your favorite package manager.  
For example, if you use dein, execute

```:vim
call dein#add('keiyakeiya/termSwitcher.vim')
```

## Usage

Open/Close bottom terminal window  

```:vim
:Tterm
```

![tterm2](https://github.com/keiyakeiya/termSwitcher.vim/assets/75249966/845a3210-6c43-4c78-bb82-4be28ba854ab)

<br>
Open/Close right terminal window  

```:vim
:Vtterm
```

![vtterm2](https://github.com/keiyakeiya/termSwitcher.vim/assets/75249966/d8802b90-12fc-4cd2-9114-88b232e0f2cb)

### Key mapping example

It's convenient to assign a keymap to a command.
The following example assigns `Tterm` to `<c-t>` in normal mode.

```:vimscript
nnoremap <C-t> :Tterm<CR>
```

## Configuration

The default values for terminal window height and width are 10 and 65 respectively.  
If you want to change them, set the variables `g:termSwitcherHeight` and `g:termSwitcherWidth` like below.

```:vimscript
let g:termSwitcherHeight = 15
" set terminal window height to 15

let g:termSwitcherWidth = 50
" set terminal window width to 50
```

