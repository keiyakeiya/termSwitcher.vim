# termSwitcher.vim

Quickly open and close neovim built-in terminal.  
![both_tterm_vtterm_trimed](https://github.com/keiyakeiya/termSwitcher.vim/assets/75249966/dad10bf6-f15f-47b6-85c6-b6be7e587b89)

## Feature

- Open or close the terminal window down or right.
- This plugin uses only one terminal buffer.

## Install

You can install this plugin using your favorite package manager.  
For example, if you use dein, execute `call dein#add('keiyakeiya/termSwitcher.vim')`

## Usage

Open/Close bottom terminal window  
`:Tterm`
![tterm_trimed](https://github.com/keiyakeiya/termSwitcher.vim/assets/75249966/e1da9167-2029-4203-a929-04eab345eb0d)

Open/Close right terminal window  
`:VTterm`
![vtterm_trimed](https://github.com/keiyakeiya/termSwitcher.vim/assets/75249966/82658e20-fe34-46de-81de-6fbde44192f8)

### Key mapping example

It's convenient to assign a keymap to a command.
The following example assigns `Tterm` to <c-[> in normal mode.

```:vimscript
nnoremap <C-[> :Tterm<CR>
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

