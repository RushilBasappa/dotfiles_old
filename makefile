.DEFAULT_GOAL := help

help:
	@echo ""
	@echo "Available tasks:"
	@echo "    install"
	@echo "    brew"
	@echo ""


pull_latest:
	git add .
	git stash
	git pull origin master
	git

install:
	@./bootstrap.sh

secondary:
	@./post_setup.sh

brew:
	@./scripts/brew.sh

iterm:
	@./scripts/iterm2.sh

update:
	pull_latest


all:
	brew
	@./scripts/zsh.sh
