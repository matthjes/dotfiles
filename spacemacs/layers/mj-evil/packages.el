(defconst mj-evil-packages '(evil-escape))

(defun mj-evil/post-init-evil-escape()
  (setq-default evil-escape-delay 0.15)
  (setq-default evil-escape-key-sequence "jk")
  )
