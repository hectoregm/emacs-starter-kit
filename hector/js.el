;; Espresso
(add-hook 'espresso-mode-hook 'whitespace-mode)
(setq espresso-indent-level 2)

;; Javascript Mode
(add-hook 'js-mode-hook 'whitespace-mode)
(setq js-indent-level 2)

(provide 'hector/js)
