;;
(defconst local-ext "~/work/local-extensions.el")
(if (file-exists-p local-ext)
      (load-file local-ext))

(load-file "~/.emacs.d/two-mode-mode.el")
(require 'nxml-mode)
(require 'two-mode-mode)
(or (assoc "\\.yaws$" auto-mode-alist)
    (setq auto-mode-alist (cons '("\\.yaws$" . two-mode-mode) auto-mode-alist)))


(require 'whitespace)
;; Remove trailing whitespaces when writing to a file
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Display only tails of lines longer than 80 columns, tabs and
;; trailing whitespaces
(setq whitespace-line-column 80
      whitespace-style '(face tabs trailing lines-tail))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation ignore)))
 '(inhibit-startup-screen t)
 '(quote (size-indication-mode t))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(global-whitespace-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))


(setq version-control t)
(setq delete-old-versions 'no)
(setq kept-new-versions 400)
(setq kept-old-versions 400)
(setq vc-make-backup-files t)
(setq default-frame-alist '((left . 0) (top . 0)(height . 46)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 (set-face-attribute 'whitespace-line nil
                     :background "red1"
                     :foreground "yellow"
                     :weight 'bold)

 ;; face for Tabs
 (set-face-attribute 'whitespace-tab nil
                     :background "red1"
                     :foreground "yellow"
                     :weight 'bold)
 '(default ((t (:inherit nil :stipple nil :background "black"
                         :foreground "yellow" :inverse-video nil
                         :box nil :strike-through nil :overline nil
                         :underline nil :slant normal :weight normal
                         :height 90 :width normal :foundry "unknown"
                         :family "DejaVu Sans Mono")))))
