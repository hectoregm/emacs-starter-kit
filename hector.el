;; My configuration
;; For GNU/Linux and MacOS X systems

(let ((path))
  (setq path (concat "~/bin:"
                     "~/src/homebrew/bin:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/bin"))
  (setenv "PATH" path))

(add-to-list 'load-path (concat dotfiles-dir "vendor"))

(require 'hector/meta)
(require 'hector/ide)
(require 'hector/css)
(require 'hector/c-lang)
(require 'hector/csharp)

;; RVM
(add-to-list 'load-path (concat dotfiles-dir "vendor/rvm"))
(require 'rvm)
(rvm-use-default)

;; Ruby
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook 'turn-on-whitespace)

(require 'hector/cucumber)
(require 'hector/rails)
(require 'hector/js)
(require 'hector/keyboard)

;; Color Themes
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)

;; Activate theme
(load (concat dotfiles-dir "hector/theme.el"))
(color-theme-ruby)
