(defun jfh/http-post (url data)
  "Send DATA to URL as a POST request."
  (let ((url-request-method "POST")
        (url-request-extra-headers `(("Content-Type" . "application/x-www-form-urlencoded")))
        (url-request-data (format "org-text=%s" data)))
    (url-retrieve url (lambda (status) (switch-to-buffer (current-buffer))))))

(defun jfh/example-http-post ()
  (my/http-post "http://192.168.1.18:5096/receive?use-light-mode=t" (url-hexify-string "#+title: My Title\r\n* One\r\n** Two")))

(defun jfh/org2html-from-region (beg end &optional universal)
  (interactive "r\nP")
  (let ((org-text (buffer-substring-no-properties beg end))
	(use-light-mode (not universal)))
    (message "org-text: %s" org-text)
    (my/http-post (format "http://192.168.1.18:5096/receive?use-light-mode=%s" (if use-light-mode "t" "")) (url-hexify-string org-text))))
