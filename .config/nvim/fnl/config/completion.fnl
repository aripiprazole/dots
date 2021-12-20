(local nvim (require :aniseed.nvim))

(local compe (require :compe))
(local nvim-treesitter (require :nvim-treesitter.configs))

;; Setup treesitter
(nvim-treesitter.setup {
  :ensure_installed all
  :highlight {:enable true}
})

;; Setup compe
(compe.setup {
  :enabled true
  :autocomplete true
  :debug false
  :min_length 1
  :preselect "enable"
  :throttle_time 80
  :source_timeout 200
  :incomplete_delay 400
  :max_abbr_width 100
  :max_kind_width 600
  :max_menu_width 1000
  :max_menu_height 400
  :documentation true

  :source {
    :tabnine true
    :path false
    :calc false
    :vsnip true
    :nvim_lsp true
    :nvim_lua false
    :spell true
    :tags false
    :snippets_nvim false
    :treesitter false
    :buffer false
  }
})

(fn t [string] (vim.api.nvim_replace_termcodes string true true true))

(fn check-backspace [ ]  
  (let [col (- (vim.fn.col "." ) 1)]
    (if (= col 0)
      true
      (let [l (vim.fn.getline ".")
            s (l:sub col col)]
        (~= (s:match "%s") nil)))))

;; Use tab/s-tab to:
;; move to prev/next item in completion menuone
;; jump to prev/next snippet's placeholder
(set _G.tab_complete (fn [ ]
  (if (= (vim.fn.pumvisible) 1)
        (t "<C-n>")
      (= (vim.fn.vsnip#available 1) 1)
        (t "<Plug>(vsnip-expand-or-jump)")
      (check-backspace)
        (t "<Tab>")
      (vim.fn.compe#complete))))

(set _G.s_tab_complete (fn [ ]
  (if (= (vim.fn.pumvisible) 1)
        (t "<C-p>")
      (= (vim.fn.vsnip#jumpable -1 ) 1)
        (t "<Plug>(vsnip-jump-prev)")
      (t "<S-Tab>"))))


(vim.api.nvim_set_keymap "i" "<C-Space>" "compe#complete()"              {:noremap true :expr true :silent true})
(vim.api.nvim_set_keymap "i" "<CR>"      "compe#confirm('<CR>')"         {:noremap true :expr true :silent true})
(vim.api.nvim_set_keymap "i" "<C-e>"     "compe#close('<C-e>')"          {:noremap true :expr true :silent true})
(vim.api.nvim_set_keymap "i" "<C-f>"     "compe#scroll({ 'delta': +4 })" {:noremap true :expr true :silent true})
(vim.api.nvim_set_keymap "i" "<C-d>"     "compe#scroll({ 'delta': -4 })" {:noremap true :expr true :silent true})

(vim.api.nvim_set_keymap "i" "<Tab>"     "v:lua.tab_complete()"          {:expr true})
(vim.api.nvim_set_keymap "s" "<Tab>"     "v:lua.tab_complete()"          {:expr true})
(vim.api.nvim_set_keymap "i" "<S-Tab>"   "v:lua.s_tab_complete()"        {:expr true})
(vim.api.nvim_set_keymap "s" "<S-Tab>"   "v:lua.s_tab_complete()"        {:expr true})
