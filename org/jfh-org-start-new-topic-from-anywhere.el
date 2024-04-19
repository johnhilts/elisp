(defun current-line-empty-p ()
  "Checks that a line is empty; can be used from any position."
  (interactive)
  (eq 0 (string-match-p "\\`\\s-*$" (thing-at-point 'line))))

(defun is-empty-line-p ()
  "Checks that a line is empty; must be used from the beginning of the line."  
  (interactive)
  (looking-at-p "[[:blank:]]*$"))

(defun jfh/org-start-new-topic-from-anywhere ()
  "Add new top level element in an org document from anywhere in the document."
  (interactive)
  (if (cl-search ".org" (buffer-name))
      (progn
	(goto-char (point-max))
	(beginning-of-line)
	(unless (is-empty-line-p)
	  (end-of-line)
	  (insert "\n"))
	(end-of-line)
	(insert "* ")
	(insert (format-time-string "%m/%d/%Y ")))
    (message "Command only works in org mode.")))
