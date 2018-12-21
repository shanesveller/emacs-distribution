init.el: distribution.org
	emacs -Q --batch --eval "(progn (require 'ob-tangle) (dolist (file command-line-args-left) (with-current-buffer (find-file-noselect file) (org-babel-tangle))))" "distribution.org"

.PHONY: install-packages
install-packages:
	emacs -Q -l init.el --batch
