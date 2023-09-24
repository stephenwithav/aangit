(transient-define-suffix aangit-menu--suffix (&optional args)
  :key "x"
  :description "suffix"
  ;; :transient t
  (interactive (list (transient-args transient-current-command)))
  (message "%s" args)
  )

(transient-define-argument aangit-menu--new-project-style ()
  :description "Style"
  :class transient-switches
  :key "-y"
  :argument-format "--style=%s"
  :argument-regexp ".+"
  :choices '("css" "scss" "sass" "less")
  )

(transient-define-prefix aangit-menu--new-project ()
  ["Switches"
   ("-d" "Defaults" "--defaults" :class transient-switch)
   ("-s" "Standalone" "--standalone" :class transient-switch)
   ("-r" "Routing" "--routing" :class transient-switch)
   (aangit-menu--new-project-style)]
  ["Commands"
   ("n" "new" aangit-menu--suffix)]
  )

(transient-define-prefix aangit-menu ()
  [["ng"
    ("n" "new" aangit-menu--new-project)
    ]])
