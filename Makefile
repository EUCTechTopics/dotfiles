.PHONY: install

SHELL := /bin/zsh -c
REMOVE := sudo rm -rf
LINK := sudo ln -sfvh
COPY := sudo cp -r

install:

	@$(SHELL) 'source macos/set_defaults.sh'
	@$(SHELL) 'source macos/dock_setup.sh'
	@$(SHELL) 'source macos/install_rosetta.sh'
	@$(SHELL) 'source homebrew/install.sh'
	@$(SHELL) 'source homebrew/install_homebrew_packages.sh'

	@$(REMOVE) /Library/Application\ Support/dll_225x225.png
	@$(COPY) ~/.dotfiles/support-app/dll_225x225.png /Library/Application\ Support/dll_225x225.png

	@$(REMOVE) ~/.gitconfig
	@$(LINK) ~/.dotfiles/git/gitconfig ~/.gitconfig
	@$(REMOVE) ~/.gitignore_global
	@$(LINK) ~/.dotfiles/git/global_ignore ~/.gitignore_global

	@$(REMOVE) ~/.zprofile
	@$(LINK) ~/.dotfiles/zsh/zprofile ~/.zprofile

	@$(REMOVE) ~/Library/Application\ Support/Code/User/settings.json
	@$(LINK) ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
