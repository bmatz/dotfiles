install-all: install install-node install-docker install-docker-compose

install:
	@./setup.sh

install-node:
	@./setup-node.sh

install-docker:
	@./setup-docker.sh

install-docker-compose:
	@sudo ./setup-docker-compose.sh

copytorepobasics:
	@cp ~/.gitconfig .
	@cp ~/.tmux.conf .
	@cp ~/.vimrc ./vim/
	@cp -r ~/.vim/startup ./vim/.vim

coptytorepobash:
	@cp ~/.zshrc .

copytorepocygwins:
	@cp ~/.minttyrc .
	@cp ~/.dir_colors .
	@cp ~/.zshrc ./.zshrc.cygwin
	@cp ~/.bashrc ./.bashrc.cygwin

updaterepo:
	@git add --all
	@git commit -m "autoupdate repo"
	@git push

push-bash: copytorepobasics coptytorepobash updaterepo
push-cygwin: copytorepobasics copytorepocygwins updaterepo

pullrepo:
	@git pull

copyhomebasics: 
	@mkdir -p ~/.vim/colors
	@mkdir ~/.vim/autload
	@mkdir ~/.vim/starup
	@mkdir ~/.vim/budle
	@cp ./vim/.vimrc ~/
	@cp -r ./vim/.vim/startup ~/.vim
	@cp -r ./vim/.vim/bundle ~/.vim 
	@cp -r ./vim/.vim/autoload ~/.vim
	@cp ./vim/.vim/colors/monokai.git/colors/monokai.vim ~/.vim/colors/monokai.vim
	@cp ./.gitconfig ~/
	@cp ./.tmux.conf ~/

copyhomebash:
	@cp ./.zshrc ~/

copyhomecygwins:
	@cp ./.zshrc.cygwin ~/.zshrc
	@cp ./.bashrc.cygwin ~/.bashrc
	@cp ./.dir_colors ~/
	@cp ./.minttyrc ~/

pull-bash: pullrepo copyhomebasics copyhomebash
pull-cygwin: pullrepo copyhomebasics copyhomecygwins

