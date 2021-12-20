(local nvim-web-devicons (require :nvim-web-devicons))

(nvim-web-devicons.setup {
  :override {
    :css {
      :icon ""
      :color "#563d7c"
      :name "css"
    }
    :js {
      :icon ""
      :color "#cbcb41"
      :name "js"
    }
    :ts {
      :icon "ﯤ"
      :color "#519aba"
      :name "ts"
    }
  }
})