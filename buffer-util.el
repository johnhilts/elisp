(defun my/filter-buffers (filter-on-text)
  (mapcar
   #'(lambda (e)
       (cons
        (buffer-name e)
        (buffer-file-name e)))
   (cl-remove-if-not #'(lambda (buffer) (cl-search filter-on-text (buffer-file-name buffer))) (buffer-list))))

;; (cl-remove-if-not #'(lambda (buffer) (cl-search ".lisp" (buffer-file-name buffer))) (buffer-list))
