(transient-define-suffix aangit-menu--ng-new (&optional args)
  :description "ng new"
  (interactive (list (transient-args transient-current-command)))
  (let ((dir (car (last (string-split (car (dired-read-dir-and-switches "")) "/"))))
        (args (string-join args " ")))
    (if (eq dir "")
        (message "missing project name")
      (shell-command (format "ng new %s %s" dir args)))))

(transient-define-argument aangit-menu--new-project-style ()
  :description "Style"
  :class transient-option
  :key "-y"
  :argument "--style="
  :choices '("css" "scss" "sass" "less")
  )

(transient-define-prefix aangit-menu--new-project ()
  :incompatible '(
                  ("--defaults" "--standalone")
                  ("--defaults" "--routing")
                  ("--defaults" "--style")
                  )
  :value '("--standalone" "--routing" "--style=css")
  ["Switches"
   ("-d" "Defaults" "--defaults" :class transient-switch)
   ("-s" "Standalone" "--standalone" :class transient-switch)
   ("-r" "Routing" "--routing" :class transient-switch)
   (aangit-menu--new-project-style)
   ]
  ["Commands"
   ("n" "new" aangit-menu--ng-new)]
  )

(transient-define-prefix aangit-menu ()
  [["ng"
    ("n" "new" aangit-menu--new-project)
    ]])
