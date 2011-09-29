(require 'textmate)
(add-to-list 'load-path (concat dotfiles-dir "/vendor/peepopen.el"))
(if (eq system-type 'darwin)
    (progn
      (require 'peepopen)
      (setq ns-pop-up-frames nil)))
(textmate-mode)

(provide 'hector/textmate)
