all:
	ln -s -f $(CURDIR)/.dir_colors $$HOME
	ln -s -f $(CURDIR)/.gitignore_global $$HOME
	ln -s -f $(CURDIR)/.ideavimrc $$HOME
	ln -s -f $(CURDIR)/.tmux.conf $$HOME
	ln -s -f $(CURDIR)/.zshrc $$HOME

	ln -s -f $(CURDIR)/.tmux $$HOME
	ln -s -f $(CURDIR)/.zsh-syntax-highlighting $$HOME

	ln -s -f $(CURDIR)/.asdf $$HOME
	ln -s -f $(CURDIR)/.doom.d $$HOME
	ln -s -f $(CURDIR)/.emacs.d $$HOME

	ln -s -f $(CURDIR)/.local/share/nautilus-python $$HOME/.local/share

	ln -s -f $(CURDIR)/.config/kitty $$HOME/.config
	ln -s -f $(CURDIR)/.config/nvim $$HOME/.config
	ln -s -f $(CURDIR)/.config/neofetch $$HOME/.config

	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"