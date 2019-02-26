(defconst mj-evil-packages '(evil-escape))

(defun mj-evil/post-init-evil-escape()
  (push 'visual evil-escape-excluded-states)
  (setq-default evil-escape-delay 0.15)
  (setq-default evil-escape-key-sequence "jk"))

