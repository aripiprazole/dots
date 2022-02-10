(local nvim (require :aniseed.nvim))

(require :plugins)

(require :config.icons)
(require :config.lsp)
(require :config.tab)
(require :config.editor)
(require :config.ui)
(require :config.scroll)
(require :config.completion)
(require :config.formatting)
(require :config.terminal)
(require :config.tree)
(require :config.debug)
(require :config.which-key)

(require :languages.rust)

(nvim.fn.glaive#Install)