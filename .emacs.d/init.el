(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(package-refresh-contents)

(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))

(message "Start init.el")
(setq debug-on-error t)
(defun init ()
        (message "Init function")
        ; setup vars
        ;(setq color-init "~/.emacs.d/color-theme/init.el")
        (setq sanity-init "~/.emacs.d/el/sanity.el")
        (setq ui-init "~/.emacs.d/el/ui.el")
        (setq clock-init "~/.emacs.d/el/bh.el")
        (setq start-file "~/.emacs.d/org/main.org")
        (setq backup-dir "~/.emacs.d/backup/")
        (setq lang-init "~/.emacs.d/el/lang.el")

        ; Set up backups
        (setq
          backup-by-copying t      ; don't clobber symlinks
          backup-directory-alist
          '(("." . "~/.emacs.d/backup/"))    ; don't litter my fs tree
          delete-old-versions t
          kept-new-versions 6
          kept-old-versions 2
          version-control t)       ; use versioned backups


        (message "Load init files")
        ;;(load-file color-init)
        (load-file ui-init)
        (load-file clock-init)
        (load-file sanity-init)
        (load-file lang-init)

        (setenv "PATH" (concat "/usr/local/texlive/2020/bin/x86_64-linux:"
                               (getenv "PATH")))
        (add-to-list 'exec-path "/usr/local/texlive/2020/bin/x86_64-linux")

        ;(find-file start-file)
        (setq inhibit-startup-screen t)
        ;(setq initial-buffer-choice start-file)
)

(init)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("41098e2f8fa67dc51bbe89cce4fb7109f53a164e3a92356964c72f76d068587e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "e5dc5b39fecbeeb027c13e8bfbf57a865be6e0ed703ac1ffa96476b62d1fae84" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "819ab08867ef1adcf10b594c2870c0074caf6a96d0b0d40124b730ff436a7496" default))
 '(package-selected-packages
   '(magit solarized-theme spaceline ewal-evil-cursors ewal-spacemacs-themes ewal xresources-theme xresouces-theme selectrum-prescient prescient selectrum calfw-howm calfw-gcal calfw-ical calfw-cal calfw calfw-org org-gcal org-fragtog pdf-tools helm-org helm smart-mode-line-atom-one-dark-theme smart-mode-line doom-themes all-the-icons use-package leuven-theme org-bullets org org-journal))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
