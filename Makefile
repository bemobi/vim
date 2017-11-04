VIM_DIR  := $(HOME)/.vim
VIMRC    := $(HOME)/.vimrc
AUTOLOAD := $(VIM_DIR)/autoload
PLUGGED  := $(VIM_DIR)/plugged
VIM_PLUG := $(AUTOLOAD)/plug.vim

BASE := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
SRC  := $(BASE)/src

NVIM := $(shell command -v nvim 2> /dev/null)
VIM  := vim -u $(VIMRC)
ifdef NVIM
VIM := $(NVIM) -u $(VIMRC)
endif

install: basic
	@echo set runtimepath+="$(VIM_DIR)" > "$(VIMRC)"
	@cat $(SRC)/basic.vim >> "$(VIMRC)"
	@cat $(SRC)/basic-*.vim >> "$(VIMRC)"
	@echo "call plug#begin('$(PLUGGED)')" >> "$(VIMRC)"
	@cat $(SRC)/plug.vim >> "$(VIMRC)"
	@echo 'call plug#end()' >> "$(VIMRC)"
	@cat $(SRC)/plug-*.vim >> "$(VIMRC)"
	@cat $(SRC)/theme-*.vim >> "$(VIMRC)"
	@cat $(SRC)/local.vim >> "$(VIMRC)"

basic: basic-vimrc vim-plug plugins | $(VIM_DIR)

basic-vimrc:
	@echo set runtimepath+="$(VIM_DIR)" > "$(VIMRC)"
	@cat $(SRC)/basic.vim >> "$(VIMRC)"
	@cat $(SRC)/basic-*.vim >> "$(VIMRC)"
	@echo "call plug#begin('$(PLUGGED)')" >> "$(VIMRC)"
	@cat $(SRC)/plug.vim >> "$(VIMRC)"
	@echo 'call plug#end()' >> "$(VIMRC)"

vim-plug:
	@[ -f $(VIM_PLUG) ] || \
		curl -sfLo $(VIM_PLUG) --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@mkdir -p $(PLUGGED)

plugins:
	@$(VIM) +PlugInstall +qall
	@$(VIM) +GoInstallBinaries +qall

$(VIM_DIR):
	@mkdir -p $(VIM_DIR)

clean:
	@rm -rf $(VIM_DIR) $(VIMRC)
