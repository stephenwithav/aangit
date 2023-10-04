# aangit

transient-powered interface for ng (Angular) cli.

## Workflow

`M-x aangit-menu`, `n`, `n` creates a new Angular project and opens it in `dired`.

`M-x aangit-menu`, `g` lets you quickly scaffold Components, Interfaces, and Services.

# Install with Doom Emacs

1. `SPC f P`, `packages.el`, add `(package! aangit :recipe (:host github :repo "stephenwithav/aangit"))`.
2. `SPC f P`, `config.el`, add `(use-package! aangit :after magit :config (map! :leader "ma" 'aangit-menu :mode dired-mode))`.
3. `SPC h r r`

You can now quickly access aangit-menu with `SPC m a` when in `dired`.
