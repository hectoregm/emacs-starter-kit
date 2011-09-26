;; Snippets
(add-to-list 'load-path (concat dotfiles-dir "vendor/yasnippet-0.6.1c"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet-0.6.1c/snippets"))

(defun yas/advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
           ,(format
             "Try to expand a snippet before point, then call `%s' as usual"
             function-symbol)
           (let ((yas/fallback-behavior nil))
             (unless (and (interactive-p)
                          (yas/expand))
               ad-do-it)))))

(yas/advise-indent-function 'ruby-indent-line)

;; Cedet
(load "vendor/cedet/common/cedet.el")

;; ECB
(add-to-list 'load-path (concat dotfiles-dir "vendor/ecb"))
(require 'ecb)

;; Auto complete
(require 'auto-complete-config)

(ac-config-default)
(defun ac-ruby-mode-setup ()
  (make-local-variable 'ac-ignores)
  (add-to-list 'ac-ignores "end")
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))

(provide 'hector/ide)
