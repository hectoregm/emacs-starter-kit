;; Name and email
(setq user-mail-address "hector@hectoregm.com")
(setq user-full-name "Hector E. Gomez Morales")

;; Save backups in one place
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))


;; My functions
(defun string-search-and-replace (search replace string)
  "Replace all instances of SEARCH with REPLACE in STRING."
  (let ((quoted-search (regexp-quote search))
        (start 0))
    (while (string-match quoted-search string start)
      (setq string (replace-match replace nil t string))
      (setq start (+ (match-end 0) (- (length replace)
                                      (length search)))))
    string))

;; Full screen toggle
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))

;; Functions used for hooks
(defun activate-rinari ()
  (rinari-launch))

;; Misc
(server-start)

(setq whitespace-line-column 70)

(require 'line-num)
(require 'unbound)

(provide 'hector/meta)
