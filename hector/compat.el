;;; emacs-daemon site-lisp configuration
;; Copyright 2008-2009 Gentoo Foundation
;; Distributed under the terms of the GNU General Public License v2 or later

;; Backwards compatibility code, can be removed some time after the
;; Emacs 23.0.91 snapshot
(and (not (fboundp 'process-attributes))
     (fboundp 'system-process-attributes)
     (defalias 'process-attributes 'system-process-attributes))

(and
 (fboundp 'daemonp)
 (daemonp)
 (null after-init-time)
 (let* ((file (concat "/var/run/emacs/" (user-login-name) "/emacs.pid"))
	(pid (if (file-readable-p file)
		 ;; Get process id from file
		 (with-temp-buffer
		   (ignore-errors
		    (insert-file-contents-literally file nil 0 100)
		    (and (looking-at "[0-9]+")
			 (string-to-number (match-string 0))))))))
   (cond
    ((and (integerp pid)
	  (string-match
	   "emacs" (or (cdr (assq 'comm (process-attributes pid))) ""))
	  (/= pid (emacs-pid)))
     ;; If another Emacs daemon is already running for this user,
     ;; then we would steal its server socket. So we better die.
     (message "Another Emacs daemon is already running at process id %d" pid)
     (kill-emacs))
    ((file-writable-p file)
     ;; Write process id to file
     (with-temp-file file
       (insert (number-to-string (emacs-pid)) "\n"))
     ;; Remove file on exit
     (add-hook 'kill-emacs-hook
	       `(lambda () (ignore-errors (delete-file ,file))))))
   ;; Restart the server if signal SIGUSR1 is received.
   (define-key special-event-map [sigusr1] 'server-start)))

;;; emacs-22 site-lisp configuration
(when (string-match "\\`22\\.3\\>" emacs-version)
  ;;(setq find-function-C-source-directory
  ;;      "/usr/share/emacs/22.3/src")
  (let ((path (getenv "INFOPATH"))
	(dir "/usr/share/info/emacs-22"))
    (and path
	 ;; move Emacs Info dir to beginning of list
	 (setq Info-directory-list
	       (cons dir (delete dir (split-string path ":" t)))))))

;;; emacs-cvs-23 site-lisp configuration
(when (string-match "\\`23\\.0\\.90\\>" emacs-version)
  ;;(setq find-function-C-source-directory
  ;;      "/usr/share/emacs/23.0.90/src")
  (let ((path (getenv "INFOPATH"))
	(dir "/usr/share/info/emacs-23"))
    (and path
	 ;; move Emacs Info dir to beginning of list
	 (setq Info-directory-list
	       (cons dir (delete dir (split-string path ":" t)))))))
