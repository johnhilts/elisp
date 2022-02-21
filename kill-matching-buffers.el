(defun kill-matching-buffers (regex)
  (mapc
   #'(lambda (buffer)
       (when (string-match regex (buffer-name buffer))
         (kill-buffer (buffer-name buffer))))
   (buffer-list)))

(defun kill-newsticker-buffers ()
  (kill-matching-buffers "emacswiki")
  (kill-matching-buffers "hnrss")
  (kill-matching-buffers "ycombinator"))
