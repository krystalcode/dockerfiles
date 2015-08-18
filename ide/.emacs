;; .emacs

;; Load package repositories.
(require 'package)
(add-to-list 'package-archives
 '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Define packages that should be installed.
(defvar required-packages
 '(
  ; Major modes.
  php-mode
  drupal-mode
  scss-mode
  dockerfile-mode
  haskell-mode
  web-mode
  yaml-mode
  ; Version control.
  magit
  ; Productivity helpers.
  flycheck
  auto-complete
  php-auto-yasnippets
  autopair
  helm
  ; Improved readability.
  column-marker
  ; Browser.
  w3m
 ) "The list of packages that should be installed on startup.")

;; Method that checks if all packages are installed.
(require 'cl)
(defun packages-installed-p ()
 (loop for p in required-packages
  when (not (package-installed-p p)) do (return nil)
  finally (return t)))

;; If not all packages are installed, go through the list and install the
;; missing ones.
(unless (packages-installed-p)
 ;; Check for new packages (package versions).
 (message "%s" "Emacs is now refreshing its package database ...")
 (package-refresh-contents)
 (message "%s" "Refreshing package database is completed.")
 ;; Install missing packages.
 (dolist (p required-packages)
  (when (not (package-installed-p p))
   (package-install p)))
)

;; Configure CEDET and Semantic.
(global-ede-mode 1)
(semantic-mode 1)

;; Ignore *~ files when in find-grep results.
(setq grep-find-command 
  "find . -type f '!' -wholename '*~' -print0 | xargs -0 -e grep -nH -e ")

;; Remember recent files.
(require 'recentf)
(setq recentf-max-saved-items 144
 recentf-max-menu-items 12)
(recentf-mode +1)

;; Configure various options.
(custom-set-variables
 ;; Always end a file with a newline.
 '(require-final-newline t)
 ;; Remove splash screen.
 '(inhibit-splash-screen t)
 ;; Show column number in mode line.
 '(column-number-mode 1)
 ;; Use spaces instead of tabs.
 '(indent-tabs-mode nil))

;; Column marker
(require 'column-marker)

;; Configure php mode.
(require 'php-mode)
(add-hook 'php-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; Configure drupal-mode.
(require 'drupal-mode)
(add-hook 'drupal-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.\\(php\\|inc\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))

;; Configure web-mode.
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))

;; Configure yaml-mode.
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Configure xml mode.
(add-to-list 'auto-mode-alist '("\\.wsdl" . xml-mode))

;; Configure haskell-mode.
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; Javascript indentation.
(setq js-indent-level 2)

;; CSS indentation.
(setq css-indent-offset 2)

;; Configure tramp mode.
(setq tramp-default-method "ssh")

;; Configure auto-complete.
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20141208.809/dict")
(ac-config-default)
(setq ac-sources (append '(ac-source-abbrev ac-source-dictionary ac-source-yasnippet ac-source-words-in-buffer ac-source-words-in-same-mode-buffers ac-source-semantic) ac-sources))

; Configure yasnippet and php-auto-yasnippets.
(require 'php-auto-yasnippets)
(yas-global-mode 1)
(payas/ac-setup)
(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

; Configure flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; Change default browser for 'browse-url' to w3m.
(setq browse-url-browser-function 'w3m-goto-url-new-session)

; Configure autopair.
(require 'autopair)
(autopair-global-mode)

; Configure helm.
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)

; Doc block functions.

; Doc block for functions or classes (starting at the beginning of the line).
(defun doc-block-basic-0 () (interactive)
   (insert "/**\n * \n */")
   (previous-line 1)
)
(define-key global-map (kbd "C-x / 0") 'doc-block-basic-0)

; Doc block for functions or classes (starting 2 spaces in).
(defun doc-block-basic-2 () (interactive)
   (insert "  /**\n   * \n   */")
   (previous-line 1)
)
(define-key global-map (kbd "C-x / 2") 'doc-block-basic-2)

; Doc block for functions or classes (starting 4 spaces in).
(defun doc-block-basic-4 () (interactive)
   (insert "    /**\n     * \n     */")
   (previous-line 1)
)
(define-key global-map (kbd "C-x / 4") 'doc-block-basic-4)

; Doc block for functions or classes (starting 8 spaces in).
(defun doc-block-basic-8 () (interactive)
   (insert "    /**\n     * \n     */")
   (previous-line 1)
)
(define-key global-map (kbd "C-x / 8") 'doc-block-basic-8)
