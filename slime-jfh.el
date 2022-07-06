(require 'cl)

(defun slime-connect-with-name (name)
  "re-name the slime process so it's easier to indentify in the slime connection list"
  (slime)
  (setf (slime-connection-name (car slime-net-processes)) name))
