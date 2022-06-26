all:
	ln -s -f .dir_colors $$HOME
	ln -s -f .gitignore_global $$HOME
	ln -s -f .ideavimrc $$HOME
	ln -s -f .tmux.conf $$HOME
	ln -s -f .zshrc $$HOME

	ln -s -f .tmux $$HOME
	ln -s -f .zsh-syntax-highlighting $$HOME

	ln -s -f .asdf $$HOME
	ln -s -f .doom.d $$HOME
	ln -s -f .emacs.d $$HOME

	ln -s -f .local/share/nautilus-python $$HOME/.local/share

	ln -s -f .config/kitty $$HOME/.config
	ln -s -f .config/nvim $$HOME/.config
	ln -s -f .config/neofetch $$HOME/.config
