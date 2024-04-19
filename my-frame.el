(defun my/after-make-frame-functions ()
  "Run these after creating a new frame"
  (push #'(lambda (frame) (toggle-frame-fullscreen)) after-make-frame-functions)
  (push #'(lambda (frame) (toggle-scroll-bar ())) after-make-frame-functions)
  (push #'(lambda (frame) (sleep-for 0 100)) after-make-frame-functions))
