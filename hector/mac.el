;; Mac overrides
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier nil)

;; Some Mac-friendly key counterparts
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-z") 'undo)
;;(global-set-key (kbd "M-c") 'kill-ring-save) ;; Copy
;;(global-set-key (kbd "M-v") 'yank)

;; Setup path for git
(setq magit-git-executable "/usr/local/bin/git")

;; Fullscreen
(global-set-key [f11] 'toggle-fullscreen)

;; Activate menu bar
(menu-bar-mode)

(provide 'hector/mac)
