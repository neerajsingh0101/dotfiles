If you are looking for laptop script to setup your laptop then you can find that [here](https://github.com/neerajsingh0101/laptop).

## Neovim

### Commenting

Commenting is handled by [Comment.nvim](https://github.com/numToStr/Comment.nvim) with the default mappings enabled.

#### Comment out a single line

- `gcc` — toggle comment on the current line (Normal mode). Press it again to uncomment.

#### Other handy ones

| Keys | What it does |
|------|--------------|
| `gcc` | Toggle comment on current line |
| `gc` + motion | Toggle comment over a motion, e.g. `gc3j` (3 lines down), `gcip` (paragraph) |
| `gc` (Visual mode) | Toggle comment on the selected lines — select with `V`, then `gc` |
| `gbc` | Toggle a *block* comment on the current line |
| `gb` (Visual) | Block-comment the selection |

#### Extra mappings

| Keys | What it does |
|------|--------------|
| `gco` | Add comment on the line **below** and enter insert mode |
| `gcO` | Add comment on the line **above** and enter insert mode |
| `gcA` | Add comment at the **end** of the current line |

Quick answer: put your cursor on the line and press `gcc`.
