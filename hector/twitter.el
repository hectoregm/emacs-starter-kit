(add-to-list 'load-path (concat dotfiles-dir "vendor/twitter"))
(autoload 'twitel-get-friends-timeline "twitel" nil t)
(autoload 'twitel-status-edit "twitel" nil t)
(global-set-key "\C-xt" 'twitel-get-friends-timeline)
(add-hook 'twitel-status-edit-mode-hook 'longlines-mode)

(provide 'hector/twitter)
