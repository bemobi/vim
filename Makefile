BASE      := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

VIMRC_IN  := $(BASE)/vimrc
VIMRC_OUT := $(BASE)/.vimrc
VIMPLUG   := $(BASE)/autoload/plug.vim
PLUGGED   := $(BASE)/plugged
START     := $(BASE)/start

install: vim-plug .vimrc start plugins

clean:
	@rm -f $(START) $(VIMRC_OUT)

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

start:
	@echo '#!/bin/sh' > $(START)
	@echo 'vim -u $(VIMRC_OUT) $$@' >> $(START)
	@chmod +x $(START)

plugins:
	@./start +PlugInstall +GoInstallBinaries +qall
