;; Cucumber
(add-to-list 'load-path (concat dotfiles-dir "vendor/feature-mode"))
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(add-hook 'feature-mode-hook 'run-coding-hook)
(add-hook 'feature-mode-hook 'whitespace-mode)

(provide 'hector/cucumber)
