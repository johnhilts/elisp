(require 'cl)

(defun slime-connect-with-name (name)
  "re-name the slime process so it's easier to indentify in the slime connection list"
  (interactive (list (read-from-minibuffer
                      "Name: " nil nil nil nil)))
  (let ((beginning-slime-connection-count (length slime-net-processes)))
    (slime)
    (do ((i 0 (+ 1 i))
         (current-slime-connection-count (length slime-net-processes)))
        ((or
          (> current-slime-connection-count beginning-slime-connection-count)
          (> i 10000))))
    (setf (slime-connection-name (car slime-net-processes)) name)))

(defun my/show-slime-swank-port-info ()
  "Display swank port info so that I can connect to different swank ports using different types of clients - ssh and plink"
  (princ (format "\nDefault Swank port: 4005\nSSH Swank port: 4006\nplink Swank port: 4007"))
  nil)
