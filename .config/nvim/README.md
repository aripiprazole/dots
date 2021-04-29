## Neovim config

Basic neovim configuration

### Main key mappings

| Mapping     | Function                                   | Modes          | Where      |
|-------------|--------------------------------------------|----------------|------------|
| <Tab>       | Complete expression in the menu            | Select, Insert | Expression |
| <S-Tab>     | Go to the previous expression in the menu  | Select, Insert | Expression |
| <C-Space>   | Complete expression                        | Normal, Insert | *          |
| <leader>ff  | Opens the file finder                      | Normal         | *          |
| <leader>fg  | Opens the finder's live grep               | Normal         | *          |
| <leader>fb  | Opens the buffer finder                    | Normal         | *          |
| <leader>fh  | Opens the help finder                      | Normal         | *          |
| <leader>so  | Opens the symbols' outline table           | Normal         | *          |
| <leader>ltt | Opens the trouble tracker                  | Normal         | *          |
| gd          | Go to declaration of the element           | Normal         | *          |
| gD          | Go to declaration of the element           | Normal         | *          |
| gr          | Show references on the element             | Normal         | *          |
| gi          | Go to implementation of the element        | Normal         | *          |
| K           | Shows the documentation of the element     | Normal         | *          |
| <C-k>       | Shows help for the element                 | Normal, Insert | *          |
| <C-n>       | Go to previous value in the diagnostic     | Normal, Insert | *          |
| <C-p>       | Go to next value in the diagnostic         | Normal, Insert | *          |
| <leader>rn  | Renames the current element                | Normal         | *          |
| ca          | Shows the code actions available           | Normal         | *          |
| <leader>lf  | Formats the document with lsp if available | Normal         | *          |
| <leader>ft  | Formats the document a formatter           | Normal         | *          |
| <leader>ftl | Formats lines with a formatter             | Normal         | *          |
| <leader>n   | Toggle tree                                | Normal         | *          |
| <leader>r   | Refresh tree                               | Normal         | *          |
| [b          | Go to the next tab                         | Normal         | *          |
| b]          | Go to the previous tab                     | Normal         | *          |
| <leader>be  | Sort tabs by extension                     | Normal         | *          |
| <leader>bd  | Sort tabs by directory                     | Normal         | *          |
| H           | Toggle dotfiles on tree                    | Normal         | Tree       |
| I           | Toggle ignored  on tree                    | Normal         | Tree       |
| R           | Refresh tree                               | Normal         | Tree       |
| a           | Create file/directory                      | Normal         | Tree       |
| d           | Remove file/directory                      | Normal         | Tree       |
| r           | Rename file/directory                      | Normal         | Tree       |
| <C-r>       | Full rename file/directory                 | Normal         | Tree       |
| x           | Cut file/directory                         | Normal         | Tree       |
| c           | Copy file/directory                        | Normal         | Tree       |
| p           | Paste file/directory                       | Normal         | Tree       |
| [c          | Go to previous versioned item              | Normal         | Tree       |
| c]          | Go to next versioned item                  | Normal         | Tree       |
| -           | Dir up                                     | Normal         | Tree       |
| q           | Close tree                                 | Normal         | Tree       |
| <C-]>       | Cd in directory                            | Normal         | Tree       |
| <C-x>       | Open splitting horizontally                | Normal         | Tree       |
| <C-v>       | Open splitting vertically                  | Normal         | Tree       |
| <C-t>       | Open in a new tab                          | Normal         | Tree       |
| <           | Go to previous sibilling in tree           | Normal         | Tree       |
| o           | Edit file in tree                          | Normal         | Tree       |
| <Tab>       | Preview file in tree                       | Normal         | Tree       |
| <BS>        | Close node in tree                         | Normal         | Tree       |
| <S-CR>      | Close node in tree                         | Normal         | Tree       |
