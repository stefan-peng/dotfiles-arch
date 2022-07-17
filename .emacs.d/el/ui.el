;; Font
(set-face-attribute 'default nil :height 150 :font "Cascadia Code-12")

;; Bars
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
;(set-frame-parameter nil 'fullscreen 'fullboth)

;; Highlight current line
(add-hook 'after-init-hook 'global-hl-line-mode)

;; Wrap lines
(global-visual-line-mode t)


;; Highlight corresponding parens
(setq show-paren-delay 0)
(show-paren-mode t)

;; Show trailing whitespace
;(setq-default show-trailing-whitespace t)

;; Remove useless whitespace before saving
(add-hook 'before-save-hook 'whitespace-cleanup)
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Icons (p-ins all-the-icons)
(use-package all-the-icons
  :ensure t)

(use-package ewal
  :ensure t
  :init (setq ewal-use-built-in-always-p nil
              ewal-use-built-in-on-failure-p t
              ewal-built-in-palette "sexy-material"))

(use-package ewal-spacemacs-themes
  :ensure t
  :init (progn
          (setq spacemacs-theme-underline-parens t)
          (show-paren-mode +1)
          (global-hl-line-mode)
          )
  :config (progn
            (load-theme 'ewal-spacemacs-modern t)
            (enable-theme 'ewal-spacemacs-modern)))

(use-package ewal-evil-cursors
  :ensure t
  :after (ewal-spacemacs-themes)
  :config (ewal-evil-cursors-get-colors
          :apply t :spaceline t))

(use-package spaceline
  :ensure t
  :after (ewal-evil-cursors winum)
  :init (setq powerline-default-separator nil)
  :config (spaceline-spacemacs-theme))
