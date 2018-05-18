.SUFFIXES:

VIM_DIR  := $(HOME)/.vim
VIMRC    := $(HOME)/.vimrc
AUTOLOAD := $(VIM_DIR)/autoload
PLUGGED  := $(VIM_DIR)/plugged
VIM_PLUG := $(AUTOLOAD)/plug.vim

BASE := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
SRC  := $(BASE)/src

PIP3 := $(shell command -v pip3 2> /dev/null)
ifndef PIP3
define MSG
PIP3 does not seem to be installed.
To install it, follow the instructions found at this website:

	https://pip.pypa.io/en/stable/installing/

endef
$(error $(MSG))
endif


NVIM_DIR  := $(HOME)/.config/nvim
NVIM_INIT := $(NVIM_DIR)/init.vim

NVIM := $(shell command -v nvim 2> /dev/null)
VIM  := vim
ifdef NVIM
VIM := nvim
endif


PY3_NEOVIM := $(shell pip3 list | grep neovim 2> /dev/null)

ifdef NVIM
ifndef PY3_NEOVIM
define MSG
You have NEOVIM installed, but the Python module is not installed
Try installing it with the following command:

	sudo -H pip3 install neovim

endef
$(error $(MSG))
endif
endif


.PHONY: install
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

.PHONY: basic
basic: basic-vimrc vim-plug plugins | $(VIM_DIR)


.PHONY: basic-vimrc
basic-vimrc:
	@echo set runtimepath+="$(VIM_DIR)" > "$(VIMRC)"
	@cat $(SRC)/basic.vim >> "$(VIMRC)"
	@cat $(SRC)/basic-*.vim >> "$(VIMRC)"
	@echo "call plug#begin('$(PLUGGED)')" >> "$(VIMRC)"
	@cat $(SRC)/plug.vim >> "$(VIMRC)"
	@echo 'call plug#end()' >> "$(VIMRC)"

.PHONY: vim-plug
vim-plug:
	@[ -f $(VIM_PLUG) ] || \
		curl -sfLo $(VIM_PLUG) --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@mkdir -p $(PLUGGED)

.PHONY: plugins
plugins:
ifdef NVIM
	@mkdir -p $(NVIM_DIR)
	@echo "let vimrc=expand(\"$(VIMRC)\")" > "$(NVIM_INIT)"
	@echo 'if filereadable(vimrc)' >> $(NVIM_INIT)
	@echo '     exec ":source " . vimrc' >> $(NVIM_INIT)
	@echo 'endif' >> $(NVIM_INIT)
endif
	@$(VIM) +PlugInstall +qall
	@$(VIM) +GoInstallBinaries +qall

$(VIM_DIR):
	@mkdir -p $(VIM_DIR)

.PHONY: clean
clean:
	@rm -rf $(VIM_DIR) $(VIMRC) $(NVIM_INIT)
