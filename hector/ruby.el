(require 'rvm)
(rvm-use-default)

(defun ruby-keys ()
  (local-set-key (kbd "M-r") 'ruby-compilation-this-buffer))

(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook 'turn-on-whitespace)
(add-hook 'ruby-mode-hook 'ruby-keys)

(provide 'hector/ruby)
