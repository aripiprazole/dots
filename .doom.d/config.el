;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Gabrielle Guimarães de Oliveira"
      user-mail-address "gabrielle1guim@gmail.com")

(require 'dap-cpptools)

(dap-cpptools-setup

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
 (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15 :weight 'semi-light)
       doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 15)))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;;
(map! :leader
    :desc "Toggle vterm"
    "\\" #'vterm-toggle)

(map! :leader
      :desc "Toggle file tree"
      "n" #'treemacs)

(map! :leader
      :desc "Toggle breakpoint in the current line"
      "d" #'dap-breakpoint-toggle)

(map! :leader :desc "Deletes the current buffer"
      "r" #'kill-current-buffer)

;; DAP Mode configuration
;; Use tooltips for mouse hover
;; If it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)
;; Displays floating panel with debug buttons
(dap-ui-controls-mode 1)

;; Disable centaur-tabs in dap ui buffers
(defun set-dap-ui-local-mode ()
  (when (and (stringp (buffer-name))
             (string-match "\\*dap-ui-\\(\\w\\)" (buffer-name))
             (bound-and-true-p centaur-tabs-mode))
    (centaur-tabs-local-mode)))

;; Disable centaur-tabs in run buffers
(defun set-run-bufs-local-mode ()
  (when (and (stringp (buffer-name))
             (string-match "\\*run \\(\\w\\)" (buffer-name))
             (bound-and-true-p centaur-tabs-mode))
    (centaur-tabs-local-mode)))

(add-hook 'buffer-list-update-hook #'set-dap-ui-local-mode)
(add-hook 'buffer-list-update-hook #'set-run-bufs-local-mode)
(add-hook 'vterm-mode-hook 'centaur-tabs-local-mode)
(add-hook 'dired-mode-hook 'centaur-tabs-local-mode)
(add-hook 'doom-scratch-buffer-hook 'centaur-tabs-local-mode)

;; Rust configuration
(setq lsp-rust-analyzer-server-display-inlay-hints t)

;; Treemacs
(treemacs-indent-guide-mode)

(setq doom-themes-treemacs-theme "doom-colors")

(with-eval-after-load 'treemacs
  (defun treemacs-ignore-gitignore (file _)
    (string= file ".gitignore"))

  (push #'treemacs-ignore-gitignore treemacs-ignored-file-predicates))
