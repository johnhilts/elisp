(defun kill-matching-buffers-by-regex (regex)
  "kill any buffer that matches the supplied regex."
  (mapc
   #'(lambda (buffer)
       (let ((buffer-name (buffer-name buffer)))
         (when (string-match regex buffer-name)
           (princ (format "Killing buffer: %s\n" buffer-name))
           (kill-buffer buffer-name))))
   (buffer-list)))

(defun kill-newsticker-buffers ()
  "Kil certain buffers related to newsticker."
  (kill-matching-buffers-by-regex "emacswiki")
  (kill-matching-buffers-by-regex "hnrss")
  (kill-matching-buffers-by-regex "ycombinator")
  (kill-matching-buffers-by-regex "www.redditstatic.com")
  (kill-matching-buffers-by-regex "www.reddit.com"))

;;; example usage
(progn
  (princ (format "Buffer count (before) : %d\n" (length (buffer-list))))
  (princ (kill-newsticker-buffers))
  (princ (format "Buffer count (after) : %d\n" (length (buffer-list)))))
