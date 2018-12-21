init.el: distribution.org
	emacs -Q --batch --eval "(progn (require 'ob-tangle) (dolist (file command-line-args-left) (with-current-buffer (find-file-noselect file) (org-babel-tangle))))" "distribution.org"

.PHONY: freeze-packages
freeze-packages: init.el
	emacs -Q -l init.el --batch --eval "(straight-freeze-versions)"

.PHONY: install-packages
install-packages: init.el
	emacs -Q -l init.el --batch

.PHONY: run
run: init.el
	emacs -Q -l init.el -nw

.PHONY: self-edit
self-edit: init.el
	emacs -Q -l init.el -nw distribution.org
