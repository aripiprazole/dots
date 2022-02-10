(local dapui (require :dapui))
(local dap (require :dap))

(dapui.setup {
  :sidebar {
    :size 10
    :position "bottom"
    :elements [
      {:id "repl" :size 0.6}
      {:id "watches" :size 0.13}
      {:id "stacks" :size 0.13}
      {:id "scopes" :size 0.13}
    ]
  }
})

(vim.fn.sign_define "DapBreakpoint" {:text "🛑" :texthl "" :linehl "" :numhl ""})

(vim.api.nvim_set_keymap "n" "<F5>"       ":lua require'dap'.continue()<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<F7>"       ":lua require'dapui'.toggle()<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<F9>"       ":lua require'dap'.terminate()<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<F10>"      ":lua require'dap'.step_over()<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<F11>"      ":lua require'dap'.step_into()<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<F12>"      ":lua require'dap'.step_out()<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>b"  ":lua require'dap'.toggle_breakpoint()<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>B"  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>lp" ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>dr" ":lua require'dap'.repl.open()<CR>" {:noremap true})
(vim.api.nvim_set_keymap "n" "<leader>dl" ":lua require'dap'.run_last()<CR>" {:noremap true})
