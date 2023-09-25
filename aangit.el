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

(defun aangit-menu--unimplemented ()
  (interactive)
  (message "not yet implemented"))

(transient-define-prefix aangit-menu--generate-submenu ()
  :value '("--defaults")
  ["Generate what?"
   ("a" "Application shell" aangit-menu--unimplemented)
   ("A" "application in projects" aangit-menu--unimplemented)
   ("C" "Class" aangit-menu--unimplemented)
   ("c" "Component" aangit-menu--unimplemented)
   ("o" "Configuration file" aangit-menu--unimplemented)
   ("d" "Directive" aangit-menu--unimplemented)
   ("e" "Enums" aangit-menu--unimplemented)
   ("g" "Guard" aangit-menu--unimplemented)
   ("I" "Interceptor" aangit-menu--unimplemented)
   ("i" "Interface" aangit-menu--unimplemented)
   ("l" "Library" aangit-menu--unimplemented)
   ("m" "Module" aangit-menu--unimplemented)
   ("p" "Pipe" aangit-menu--unimplemented)
   ("r" "Resolver" aangit-menu--unimplemented)
   ("s" "Service" aangit-menu--unimplemented)
   ("S" "Service Worker" aangit-menu--unimplemented)
   ("w" "Web Worker" aangit-menu--unimplemented)
   ]
  )

(transient-define-prefix aangit-menu ()
  [["ng"
    ("n" "new" aangit-menu--new-project)
    ("g" "generate" aangit-menu--generate-submenu)
    ]])
