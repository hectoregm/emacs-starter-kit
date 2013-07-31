;; Java

(add-to-list 'load-path (concat dotfiles-dir "vendor/jdee-2.4.1/lisp"))

;; If you want Emacs to defer loading the JDE until you open a 
;; Java file, edit the following line
;;(setq defer-loading-jde nil)
;; to read:
;;
  (setq defer-loading-jde t)
;;

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde))

(provide 'hector/java)
