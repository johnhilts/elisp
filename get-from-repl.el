;;; code that I either got from lisp123 (irc handle) or based on what he wrote.
;;; his github: https://github.com/ashok-khanna
;;; I need to go through these and figure out what I want to do with them

(global-set-key (kbd "C-c r")
                (lambda ()
                  (interactive)
                  (let ((command (format "%s"
                                         (with-current-buffer (slime-output-buffer) ; "*slime-repl sbcl*"
                                           (car slime-repl-input-history)))))
                                        ; (slime-interactive-eval command)
                    command)))

(global-set-key (kbd "C-c i") (lambda ()
                                (interactive)
                                (let ((command (format "%s"
                                                       (with-current-buffer (slime-output-buffer)
                                                         (car slime-repl-input-history)))))
                                  (insert command))))


(defun lisp-mode-code-block ()
  (interactive)
  (org-insert-structure-template "src")
  (insert "lisp")
  (newline 3)
  (goto-char (line-beginning-position 0)))

(defun lisp-mode-code-block-region ()
  (interactive)
  (save-excursion
    (let* ((beg (region-beginning))
           (end (region-end))
           (code-test (buffer-substring-no-properties beg end)))
      (kill-region beg end)
      (org-insert-structure-template "src")
      (insert "lisp")
      (newline 2)
      (insert code-test)
            (newline))))
