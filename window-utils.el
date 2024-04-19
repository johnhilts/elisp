(defun scroll-up-half-window ()
  (interactive)
  (let ((window-size (- (window-start) (window-end))))
    (scroll-up-line (round (/ window-size 2)))))

(defun scroll-down-half-window ()
  (interactive)
  (let ((window-size (- (window-start) (window-end))))
    (scroll-down-line (round (/ window-size 2)))))

(global-set-key (kbd "C-c u") 'scroll-down-half-window)
(global-set-key (kbd "C-c d") 'scroll-up-half-window)
