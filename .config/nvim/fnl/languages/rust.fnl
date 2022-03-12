(local crates (require :crates))
(local rust-tools (require :rust-tools))
(local executors (require :rust-tools/executors))
(local dap (require :rust-tools/dap))

(local home (os.getenv "HOME"))

(local extensions-path (.. home "/.vscode/extensions/"))

(local opts {
  :tools {
    :autoSetHints true
    :hover_with_actions true
    :executor executors.termopen
    :runnables {:use_telescope true}
    :debuggables {:use_telescope true}
    :inlay_hints {
      :show_parameter_hints true
      :show_variable_name false
      :parameter_hints_prefix ": "
      :other_hints_prefix ": "
    }
    :hover_actions {
      :border [
        ["╭" "FloatBorder"] ["─" "FloatBorder"]
        ["╮" "FloatBorder"] ["│" "FloatBorder"]
        ["╯" "FloatBorder"] ["─" "FloatBorder"]
        ["╰" "FloatBorder"] ["│" "FloatBorder"]
      ]
      :auto_focus true
    }
  }
  :dap {}
})

(fn split [ str sep ]
  (let [list []] 
    (each [_ v (string.gmatch str (.. "([^" sep "]+)"))]
      (table.insert list v))
    list))

(fn scandir [ dir ]
  (let [handle (assert (io.popen (.. "ls -1v " dir)))
        files (assert (handle:lines))]
    files))

(icollect [f _ (scandir extensions-path)]
  (when (string.match f "^vadimcn\\.vscode-lldb")
    (set opts.dap.adapter
      (let [code-lldb (.. extensions-path f)]
        (dap.get_code_lldb_adapter 
          (.. code-lldb "/adapter/codelldb")
          (.. code-lldb "/lldb/lib/liblldb.so"))))))

(crates.setup {})
(rust-tools.setup opts)

(vim.api.nvim_set_keymap "n" "<leader>run" "<cmd>RustRunnables<CR>" {:noremap true}) ;; Open runnables
(vim.api.nvim_set_keymap "n" "<leader>dbg" "<cmd>RustDebuggables<CR>" {:noremap true}) ;; Open debuggables
(vim.api.nvim_set_keymap "n" "<leader>rk"  "<cmd>RustHoverActions<CR>" {:noremap true}) ;; Rust hover actions
(vim.api.nvim_set_keymap "n" "<leader>rem" "<cmd>RustExpandMacro<CR>" {:noremap true}) ;; Expand rust macro
(vim.api.nvim_set_keymap "n" "<leader>rrl" "<cmd>RustReloadWorkspace<CR>" {:noremap true}) ;; Reload rust workspace
(vim.api.nvim_set_keymap "n" "<leader>rcrg" "<cmd>RustReloadWorkspace<CR>" {:noremap true}) ;; Open cargo
