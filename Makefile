VIM_DIR  := $(HOME)/.vim
VIMRC    := $(HOME)/.vimrc
AUTOLOAD := $(VIM_DIR)/autoload
PLUGGED  := $(VIM_DIR)/plugged
VIM_PLUG := $(AUTOLOAD)/plug.vim

BASE := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
SRC  := $(BASE)/src

install: basic vim-plug plugins | $(VIM_DIR)
	@echo set runtimepath+="$(VIM_DIR)" > "$(VIMRC)"
	@cat $(SRC)/basic.vim >> "$(VIMRC)"
	@cat $(SRC)/basic-*.vim >> "$(VIMRC)"
	@echo "call plug#begin('$(PLUGGED)')" >> "$(VIMRC)"
	@cat $(SRC)/plug.vim >> "$(VIMRC)"
	@echo 'call plug#end()' >> "$(VIMRC)"
	@cat $(SRC)/plug-*.vim >> "$(VIMRC)"
	@cat $(SRC)/theme-*.vim >> "$(VIMRC)"
	@cat $(SRC)/local.vim >> "$(VIMRC)"

$(VIM_DIR):
	@mkdir -p $(VIM_DIR)

basic:
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
	@which nvim > /dev/null 2>&1 \
		&& nvim -V0 -u $(VIMRC) +PlugInstall +GoInstallBinaries +qall \
		|| vim -V0 -u $(VIMRC) +PlugInstall +GoInstallBinaries +qall

clean:
	@rm -rf $(VIM_DIR) $(VIMRC)
