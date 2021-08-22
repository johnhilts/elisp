(defun fix-quotes ()
  "fix quote symbols so they work in emacs and the SLIME repl"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "‘" nil t)
    (replace-match "`"))
  (while (search-forward "’" nil t)
    (replace-match "'")))
