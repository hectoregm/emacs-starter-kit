(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(add-hook 'feature-mode-hook 'run-coding-hook)
(add-hook 'feature-mode-hook 'whitespace-mode)

(provide 'hector/cucumber)
