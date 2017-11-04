INSTALL_DIR := $(HOME)/.vim
BASE        := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

VIMRC_IN  := $(BASE)/vimrc
VIMRC_OUT := $(BASE)/.vimrc
AUTOLOAD  := $(BASE)/autoload
PLUGGED   := $(BASE)/plugged

VIMPLUG := $(AUTOLOAD)/plug.vim

build: vim-plug .vimrc plugins

clean:
	@rm -f $(VIMRC_OUT)

install: clean build
	@rm -rf $(INSTALL_DIR)
	@mkdir -p $(INSTALL_DIR)
	@cp -r $(AUTOLOAD) $(PLUGGED) $(INSTALL_DIR)
	@cp $(VIMRC_OUT) ~/.vimrc

vim-plug:
	@[ -f $(VIMPLUG) ] || \
		curl -sfLo $(VIMPLUG) --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@mkdir -p $(PLUGGED)

.vimrc:
	@echo set runtimepath+="$(BASE)" > "$(VIMRC_OUT)"
	@cat $(VIMRC_IN)/basic.vim >> "$(VIMRC_OUT)"
	@cat $(VIMRC_IN)/basic-*.vim >> "$(VIMRC_OUT)"
	@echo "call plug#begin('$(PLUGGED)')" >> "$(VIMRC_OUT)"
	@cat $(VIMRC_IN)/plug.vim >> "$(VIMRC_OUT)" 
	@echo 'call plug#end()' >> "$(VIMRC_OUT)"
	@cat $(VIMRC_IN)/plug-*.vim >> "$(VIMRC_OUT)"
	@cat $(VIMRC_IN)/theme.vim >> "$(VIMRC_OUT)"
	@cat $(VIMRC_IN)/local.vim >> "$(VIMRC_OUT)"

plugins:
	@vim -u $(VIMRC_OUT) +PlugInstall +GoInstallBinaries +qall
