install-all: install install-node install-docker install-docker-compose

install:
	@./setup.sh

install-node:
	@./setup-node.sh

install-docker:
	@./setup-docker.sh

install-docker-compose:
	@sudo ./setup-docker-compose.sh

copyback:
	@cp ~/.gitconfig ~/.dotfiles/
	@cp ~/.tmux.conf ~/.dotfiles/
	@cp ~/.zshrc ~/.dotfiles/

updaterepo:
	@git add --all
	@git commit -m "autoupdate repo"
	@git push

update: copyback updaterepo
