(defconst mj-org-packages '(org))

(defun mj-org/post-init-org()
  (with-eval-after-load 'org
    (setq org-directory "~/doc/Dropbox/org")

    (setq org-agenda-files (list org-directory))
    (setq org-agenda-file-regexp "\\`[^.].*\\.org\\'\\|\\`[0-9]+\\'")

    ;; Inbox
    (setq org-default-notes-file (concat org-directory "/inbox.org"))

    ;; Tasks
    (setq org-task-file (concat org-directory "/tasks.org"))

    ;; Journal
    (setq org-journal-file-format "%Y-%m.org")
    (setq org-journal-file-type 'monthly)
    (setq org-journal-dir org-directory)
    (setq org-journal-date-prefix "\n* ")
    (setq org-journal-date-format "%A, %d. %B %Y")
    (setq org-journal-time-prefix "** ")
    (setq org-journal-time-format "%H:%M ")
    (setq org-journal-carryover-items nil)
    (setq org-journal-enable-encryption nil)
    (setq org-journal-encrypt-journal nil)

    ;; Clock
    (setq org-clock-persist 'history)
    (org-clock-persistence-insinuate)

    (setq org-log-into-drawer t)
    (setq org-log-done nil)

    (setq org-agenda-start-with-follow-mode t)

    (setq org-startup-with-inline-images t)
    (setq org-image-actual-width nil)

    ;; PlantUML
    (setq org-plantuml-jar-path "~/.spacemacs.d/plantuml.jar")

    ;; Todo keywords
    (setq org-todo-keywords
         '((sequence "TODO(t)" "IN-PROGRESS(i!)" "WAITING(@w)" "|"
                      "DONE(d!)" "CANCELED(@c)")))

    (setq org-todo-keyword-fac
          '(
            ("TODO" . (:foreground "#fb4933" :weight bold))
            ("IN-PROGRESS" . (:foreground "#fabd2f" :weight bold))
            ("WAITING" . (:foreground "#fe8019" :weight bold))
            ("DONE" . (:foreground "#8ec07c" :weight bold))
            ("CANCELED" . (:foreground "#83a598" :weight bold))
           )
          )

    (setq org-startup-indented t)

    (setq org-capture-templates '(("t" "Task"
                                   entry
                                   (file org-task-file)
                                   "* TODO %^{Description}\n%U\n%?\n\n")
                                  ("n" "Note"
                                   entry
                                   (file+headline org-default-notes-file "Notes")
                                   "* %^{Description}\n%?\n\n%i")
                                  ))
    )
  )
