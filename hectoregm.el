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
(require 'hector/ruby)
(require 'hector/cucumber)
(require 'hector/rails)
(require 'hector/js)
(require 'hector/coffee)
(require 'hector/keyboard)
(require 'hector/twitter)
(require 'hector/textmate)

(if (eq system-type 'darwin)
    (require 'hector/mac))

;; Activate theme
(require 'color-theme)
(load (concat dotfiles-dir "hector/theme.el"))
(color-theme-ruby)
