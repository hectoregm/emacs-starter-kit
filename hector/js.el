;; Espresso
(add-hook 'espresso-mode-hook 'whitespace-mode)
(setq espresso-indent-level 4)

;; Javascript Mode
(add-hook 'js-mode-hook 'whitespace-mode)
(setq js-indent-level 4)

(provide 'hector/js)
