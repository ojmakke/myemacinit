(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     t)

(global-ede-mode 1)
(require 'semantic/db)
(semantic-mode 1)
(global-semantic-idle-completions-mode)
(global-set-key (kbd "TAB") 'semantic-ia-complete-tip)
(global-set-key [C-tab] 'semantic-ia-complete-symbol)
(semantic-speedbar-analysis)



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
;(shown-paren-mode 1) ;; parentheses are highlighted

(column-number-mode 1) ;; shows (row, col) for cursor
;(set make-backup-file nil) ;; don't make backup file

;; enable to open recent files. Good for projects
(recentf-mode 1) ;;
(global-set-key (kbd "C-c C-o") 'recentf-open-files)

;; must install tabbar for this
;;(tabbar-mode t)

;; highlight cursor line
;;(global-hl-line-mode nil)

