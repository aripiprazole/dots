;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       ;;chinese
       ;;japanese
       ;;layout          ; auie,ctsrnm is the superior home row

       :completion
       company           ; the ultimate code completion backend
       vertico           ; the search engine of the future
       ;;helm            ; the *other* search engine for love and life
       ;;ido             ; the other *other* search engine...
       ;;ivy             ; a search engine for love and life

       :ui
       (popup +defaults) ; tame sudden yet inevitable temporary windows
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       modeline          ; snazzy, Atom-inspired modeline, plus API
       neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       tabs              ; a tab bar for Emacs
       unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces
       indent-guides     ; highlighted indent columns
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;doom-quit       ; DOOM quit-message prompts when you quit Emacs
       ;;(emoji +unicode); 🙂
       ;;hydra
       ;;(ligatures +extra +fira) ; ligatures and symbols to make your code pretty again
       ;;minimap         ; show a map of the code on the side
       ;;nav-flash       ; blink cursor line after big motions
       ;;treemacs        ; a project drawer, like neotree but cooler
       ;;window-select   ; visually switch windows
       ;;zen             ; distraction-free coding or writing

       :editor
       (format +onsave)  ; automated prettiness
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       multiple-cursors  ; editing in many places at once
       parinfer          ; turn lisp into python, sort of
       snippets          ; my elves. They type so I don't have to
       ;;god             ; run Emacs commands without modifier keys
       ;;lispy           ; vim for lisp, for people who don't like vim
       ;;objed           ; text object editing for the innocent
       ;;rotate-text     ; cycle region at point between text candidates
       ;;word-wrap       ; soft wrapping with language-aware indent

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree
       ;;ibuffer         ; interactive buffer management

       :term
       vterm               ; the best terminal emulation in Emacs
       ;;eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       grammar             ; tasing grammar mistake every you make
       ;;(spell +flyspell) ; tasing you for misspelling mispelling

       :tools
       (debugger +lsp)     ; FIXME stepping through code, to help you add bugs
       (eval +overlay)     ; run code, run (also, repls)
       editorconfig        ; let someone else argue about tabs vs spaces
       lookup              ; navigate your code and its documentation
       lsp                 ; M-x vscode
       magit               ; a git porcelain for Emacs
       rgb                 ; creating color strings
       tree-sitter
       ;;ansible
       ;;biblio            ; Writes a PhD for you (citation needed)
       ;;direnv
       ;;docker
       ;;ein               ; tame Jupyter notebooks with emacs
       ;;gist              ; interacting with github gists
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       ;;taskrunner        ; taskrunner for all your projects
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       ;;tty               ; improve the terminal Emacs experience

       :lang
       (haskell +lsp +tree-sitter)    ; a language that's lazier than I am
       (kotlin +lsp +tree-sitter)     ; a better, slicker Java(Script)
       (javascript +lsp +tree-sitter) ; all(hope(abandon(ye(who(enter(here))))))
       (cc +lsp)           ; C > C++ == 1
       (idris +lsp)        ; a language you can depend on
       (java +lsp)         ; the poster child for carpal tunnel syndrome
       (fstar +lsp)        ; (dependent) types and (monadic) effects and Z3
       (nix +lsp)          ; I hereby declare "nix geht mehr!"
       (ocaml +lsp)        ; an objective camel
       (php +lsp)          ; perl's insecure younger brother
       (purescript +lsp)   ; javascript, but functional
       (rust +lsp)         ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (scala +lsp)        ; java, but good
       (scheme +guile)     ; a fully conniving family of lisps
       (yaml +lsp)         ; JSON, but readable
       (json +lsp)         ; At least it ain't XML
       agda                ; types of types of types of types...
       coq                 ; proofs-as-programs
       emacs-lisp          ; drown in parentheses
       latex               ; writing papers in Emacs has never been so fun
       lua                 ; one-based indices? one-based indices
       markdown            ; writing docs for people to ignore
       org                 ; organize your plain life in plain text
       solidity            ; do you need a blockchain? No.
       sh                  ; she sells {ba,z,fi}sh shells on the C xor
       ;;lean              ; for folks with too much to prove
       ;;beancount         ; mind the GAAP
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       ;;data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       ;;dhall
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;factor
       ;;2faust            ; dsp, but you get to keep your soul
       ;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;gdscript          ; the language you waited for
       ;;(go +lsp)         ; the hipster dialect
       ;;hy                ; readability of scheme w/ speed of python
       ;;julia             ; a better, faster MATLAB
       ;;ledger            ; be audit you can be
       ;;nim               ; python + lisp at the speed of c
       ;;plantuml          ; diagrams for confusing people more
       ;;python            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;sml
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       ;;web               ; the tubes
       ;;zig               ; C, but simpler

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       ;;literate
       (default +bindings +smartparens))
