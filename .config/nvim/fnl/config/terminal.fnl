(local toggleterm (require :toggleterm))

(toggleterm.setup {
  :size (fn [term]
    (if (= term.direction "horizontal")
          15
        (= term.direction "vertical")
          (* vim.o.columns 0.4)))
  :open_mapping "<C-\\>"
  :hide_numbers true
  :shade_filetypes {}
  :shade_terminals true
  :shading_factor "<number>" 
  :start_in_insert true
  :insert_mappings true 
  :persist_size true
  :direction "horizontal"
  :close_on_exit true
  :shell vim.o.shell 
})
