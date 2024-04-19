(defun save-buffer-list (&optional file-name)
  (setq file-name (if (= 0 (length file-name)) "c:/data/backup/buffer-list.txt" file-name))
  (with-temp-file file-name
    (insert
     (format "%s"
	     (mapcar
	      #'(lambda (buffer)
		  (cons (buffer-name buffer) (format "\"%s\"" (buffer-file-name buffer))))
	      (buffer-list))))))

(defun read-buffer-list (f)
  (with-temp-buffer
    (insert-file-contents f)
    (read-from-string
     (buffer-substring-no-properties
      (point-min)
      (point-max)))))

(defun filter-file-list (file-list)
  (cl-remove-if
   #'(lambda (e) (or (not (stringp e)) (string-equal "nil" e)))
   (mapcar
    #'(lambda (file-info)
	(cdr file-info))
    file-list)))

(defun display-saved-buffer-list (&optional file-name)
  (setq file-name (if (= 0 (length file-name)) "c:/data/backup/buffer-list.txt" file-name))
  (mapc #'(lambda (e)
	    (princ (format "%s\n" e)))
	(filter-file-list (car (read-buffer-list file-name))))
  ())

(defun open-files-from-list (file-names)
  (mapc #'ffap file-names))

;; (open-files-from-list (filter-file-list (car (read-buffer-list "c:/dev/john/buffer-list.txt"))))
