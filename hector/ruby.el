(require 'rvm)
(rvm-use-default)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook 'turn-on-whitespace)

(provide 'hector/ruby)
