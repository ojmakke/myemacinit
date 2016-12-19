(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     t)

;; =============
;; irony-mode
;; =============
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
;; =============
;; company mode
;; =============
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
(define-key irony-mode-map [remap completion-at-point]
  'irony-completion-at-point-async)
(define-key irony-mode-map [remap complete-symbol]
  'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'company
'(add-to-list 'company-backends 'company-irony))
;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;; =============
;; flycheck-mode
;; =============
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck
'(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; =============
;; eldoc-mode
;; =============
(add-hook 'irony-mode-hook 'irony-eldoc)
;; ==========================================
;; (optional) bind TAB for indent-or-complete
;; ==========================================
(defun irony--check-expansion ()
(save-excursion
  (if (looking-at "\\_>") t
    (backward-char 1)
    (if (looking-at "\\.") t
      (backward-char 1)
      (if (looking-at "->") t nil)))))
(defun irony--indent-or-complete ()
"Indent or Complete"
(interactive)
(cond ((and (not (use-region-p))
            (irony--check-expansion))
       (message "complete")
       (company-complete-common))
      (t
       (message "indent")
       (call-interactively 'c-indent-line-or-region))))
(defun irony-mode-keys ()
"Modify keymaps used by `irony-mode'."
(local-set-key (kbd "TAB") 'irony--indent-or-complete)
(local-set-key [tab] 'irony--indent-or-complete))
(add-hook 'c-mode-common-hook 'irony-mode-keys)

(setq irony-additional-clang-options '("-std=c++11"))

(load-theme 'wombat t)

;; Split window bindings
(global-set-key (kbd "C-)") 'delete-other-windows)
(global-set-key (kbd "C-(") 'delete-other-windows)
(global-set-key (kbd "C-*") 'delete-window)
(global-set-key (kbd "C-0") 'split-window-right)
(global-set-key (kbd "C-9") 'split-window-below)
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)
(global-set-key (kbd "C-&") 'enlarge-window)
(global-set-key (kbd "C-^") 'shrink-window)
(global-set-key (kbd "<f8>") 'execute-extended-command)
(global-set-key (kbd "C-'") 'other-window)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k") 'windmove-down)
(global-set-key (kbd "C-c j") 'windmove-left)
(global-set-key (kbd "C-c i") 'windmove-up)



(defalias 'list-buffers 'ibuffer)
(electric-pair-mode 1)
(setq electric-pair-pairs '(
			    (?\" . ?\")
			    (?\{ . ?\})
			    ))
(shown-paren-mode 1) ;; parentheses are highlighted

(column-number-mode 1) ;; shows (row, col) for cursor
(set make-backup-file nil) ;; don't make backup file

;; enable to open recent files. Good for projects
(recentf-mode 1) ;;
(global-set-key (kbd "C-c C-o") 'recentf-open-files)

;; must install tabbar for this
(tabbar-mode t)

;; highlight cursor line
(global-hl-line-mode t)

