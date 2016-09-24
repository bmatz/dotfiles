install:
	@./setup.sh

copyback:
	@cp ~/.gitconfig ~/.dotfiles/
	@cp ~/.tmux.conf ~/.dotfiles/
	@cp ~/.zshrc ~/.dotfiles/

updaterepo:
	@git status
	@git add --all
	@git commit -m "autoupdate repo"
	@git push

update: copyback updaterepo
