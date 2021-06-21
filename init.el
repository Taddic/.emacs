;; Put local extensions in a seperate file to enable to have different setup
;; for different machines.
;; For example one setup at work, another at home and so forth.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst local-ext "~/.emacs.d/local-extensions.el")
(if (file-exists-p local-ext)
    (load-file local-ext))


(defconst two-mode "~/.emacs.d/two-mode-mode.el")
(if (file-exists-p two-mode)
    (load-file two-mode)
  (require 'nxml-mode)
  (require 'two-mode-mode)
  (or (assoc "\\.yaws$" auto-mode-alist)
      (setq auto-mode-alist (cons '("\\.yaws$" . two-mode-mode) auto-mode-alist))))


(require 'whitespace)
;; Remove trailing whitespaces when writing to a file
;(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Enable erlang-mode for rebar.config files
(add-to-list 'auto-mode-alist '("rebar.config" . erlang-mode))


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
(setq kept-new-versions 10)
(setq kept-old-versions 10)
(setq vc-make-backup-files t)
(setq default-frame-alist '((height . 76)))
(setq-default indent-tabs-mode nil)
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))

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
                     :background "black"
                     :foreground "yellow"
                     :weight 'bold)
 '(default ((t (:inherit nil :stipple nil :background "black"
                         :foreground "yellow" :inverse-video nil
                         :box nil :strike-through nil :overline nil
                         :underline nil :slant normal :weight normal
                         :height 110 :width normal :foundry "unknown"
			 )))))
