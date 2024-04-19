(defun FIRST-display-images-in-folder (folder)
  "Display each image in FOLDER one at a time."
  (interactive "DSelect folder: ")
  (let ((files (directory-files folder t)))
    (dolist (file files)
      (when (and (not (file-directory-p file))
                 (image-type-from-file-name file))
        (find-file file)
        (image-mode-fit-frame)
        (read-event)
        (kill-buffer)))))

(defun SECOND-display-images-in-folder (folder)
  "Display each image in FOLDER one at a time."
  (interactive "DSelect folder: ")
  (let ((files (directory-files folder t)))
    (dolist (file files)
      (when (and (not (file-directory-p file))
                 (image-type-from-file-name file))
        (find-file file)
        ;; (image-transform-fit-to-width)
        (image-transform-fit-to-height)
        (read-event)
        (kill-buffer)))))

(defun THIRD-display-images-in-folder (folder scale)
  "Display each image in FOLDER one at a time with a given SCALE."
  (interactive "DSelect folder: \nnScale: ")
  (let ((files (directory-files folder t)))
    (dolist (file files)
      (when (and (not (file-directory-p file))
                 (image-type-from-file-name file))
        (find-file file)
        (image-transform-set-scale scale)
        (read-event)
        (kill-buffer)))))

;; check for image magick support
(image-type-available-p 'imagemagick)

(require 'image+)

(defun FOURTH-display-images-in-folder (folder)
  "Display each image in FOLDER one at a time."
  (interactive "DSelect folder: ")
  (let ((files (directory-files folder t)))
    (dolist (file files)
      (when (and (not (file-directory-p file))
                 (image-type-from-file-name file))
        (find-file file)
	(imagex-auto-adjust-mode 1)
        (imagex-sticky-maximize)
        (read-event)
        (kill-buffer)))))

(defun display-images-in-folder (folder)
  "Display each image in FOLDER one at a time using an external viewer."
  (interactive "DSelect folder: ")
  (let ((files (directory-files folder t)))
    (dolist (file files)
      (when (and (not (file-directory-p file))
                 (image-type-from-file-name file))
        (w32-shell-execute "open" file)
        (read-event)))))
