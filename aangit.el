(transient-define-suffix aangit-menu--ng-new (&optional args)
  :description "ng new"
  (interactive (list (transient-args transient-current-command)))
  (let ((dir (car (last (string-split (car (dired-read-dir-and-switches "")) "/"))))
        (cliargs (string-join args " ")))
    (if (eq dir "")
        (message "missing project name")
      (shell-command (format "ng new --defaults %s %s" dir cliargs)))))

(transient-define-argument aangit-menu--new-project-style ()
  :description "Style"
  :class transient-option
  :key "-y"
  :argument "--style="
  :choices '("css" "scss" "sass" "less")
  )

(transient-define-prefix aangit-menu--new-project ()
  :value '("--standalone" "--routing" "--style=css")
  ["Switches"
   ("-s" "Standalone" "--standalone" :class transient-switch)
   ("-r" "Routing" "--routing" :class transient-switch)
   ("-i" "Inline Style" "--inline-style" :class transient-switch)
   ("-t" "Inline Template" "--inline-template" :class transient-switch)
   (aangit-menu--new-project-style)
   ]
  ["Commands"
   ("n" "new" aangit-menu--ng-new)]
  )

(transient-define-prefix aangit-menu ()
  [["ng"
    ("n" "new" aangit-menu--new-project)
    ]])
