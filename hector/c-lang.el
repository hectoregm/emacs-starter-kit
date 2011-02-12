;; C
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "k&r")
            (setq c-basic-offset 8)))

(provide 'hector/c-lang)
