(add-to-list 'auto-mode-alist '("\\.cs$'" . csharp-mode))

(add-hook 'csharp-mode-hook 'run-coding-hook)
(add-hook 'csharp-mode-hook 'whitespace-mode)

(provide 'hector/csharp)
