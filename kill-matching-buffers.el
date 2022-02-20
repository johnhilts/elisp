(defun kill-matching-buffers (regex)
  (mapc
   #'(lambda (buffer)
       (when (string-match regex (buffer-name buffer))
         (kill-buffer (buffer-name buffer))))
   (buffer-list)))
