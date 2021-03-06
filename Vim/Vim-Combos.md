# A Guide to Vim Command Combinations
Please, please do not memorize these. Just use them to learn Vim's grammar so you can create your own combos.

## Navigation
| Combo | Action |
| ----- | ------ |

## Editing Text
| Combo | Action |
| ----- | ------ |
| cw | delete the current word and start insert |
| cW | delete the current word and start insert (ignore symbols) |
| c0 | delete from the cursor position to the beginning of the line and start insert |
| c$ | delete from the cursor position to the end of the line and start insert |
| cc | delete the entire line and start insert | 
| dw | delete the current word |
| dW | delete the current word (ignore symbols) |
| db | delete the word before the cursor |
| dB | delete the word before the cursor (ignore symbols) |
| ddp | swap the current line with the line below |
| ddP | swap the current line with the line above | 

## Manipulating Text
| Combo | Action |
| ----- | ------ |
| u | undo last command |
| ctrl + r | redo last command |
| 5yy | copy 5 lines |
| ve~ | change the case from the cursor position to the end of the word |
| ggVGU | capitalize the entire document |

## Miscellaneous 
| Combo | Action |
| ----- | ------ |
| ggVG | highlight the entire document |
|  |  |
