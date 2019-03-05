init.el: distribution.org
	emacs -Q --batch --eval "(progn (require 'ob-tangle) (dolist (file command-line-args-left) (with-current-buffer (find-file-noselect file) (org-babel-tangle))))" "distribution.org"

init.elc: init.el
	emacs -Q -l init.el --batch -f batch-byte-compile *.el

.PHONY: benchmark-init
benchmark-init: init.el
	emacs -Q -l init.el -nw --eval "(benchmark-init/show-durations-tree)"

.PHONY: freeze-packages
freeze-packages: init.el
	emacs -Q -l init.el --batch --eval "(straight-freeze-versions)"

.PHONY: install-packages
install-packages: init.el
	emacs -Q -l init.el --batch

.PHONY: profile
profile: init.el
	emacs -Q -l init.el -nw --eval "(esup)"

.PHONY: run
run: init.el
	emacs -Q -l init.el -nw

.PHONY: run-gui
run-gui: init.el
	emacs -Q -l init.el

.PHONY: self-edit
self-edit: init.el
	emacs -Q -l init.el -nw distribution.org

.PHONY: thaw-packages
thaw-packages: init.el
	emacs -Q -l init.el --batch --eval "(straight-thaw-versions)"
	$(MAKE) install-packages

.PHONY: update-packages
update-packages: init.el
	emacs -Q -l init.el --batch --eval "(progn (straight-pull-all) (straight-check-all) (straight-freeze-versions))"
