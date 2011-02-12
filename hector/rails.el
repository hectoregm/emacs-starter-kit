;; Rhtml
(add-to-list 'load-path (concat dotfiles-dir "vendor/rhtml"))
(require 'rhtml-mode)

(add-hook 'rhtml-mode-hook 'activate-rinari)
(add-hook 'rhtml-mode-hook 'run-coding-hook)

;; Rinari
(setq rinari-tags-file-name "TAGS")

(provide 'hector/rails)
