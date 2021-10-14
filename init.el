;; Put local extensions in a seperate file to enable to have different setup
;; for different machines.
;; For example one setup at work, another at home and so forth.


;; Add Melpa packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;(package-refresh-contents)

(add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1)))



;; Reference local-extensions if exists
(defconst local-ext "~/.emacs.d/local-extensions.el")
(if (file-exists-p local-ext)
    (load-file local-ext))

;; Add erlang-lsp.el if exists
(defconst erl-lsp "~/.emacs.d/erlang-lsp.el")
(if (file-exists-p erl-lsp)
    (load-file erl-lsp))

;; Add two-mode for *.yaws files
(defconst two-mode "~/.emacs.d/two-mode-mode.el")
(if (file-exists-p two-mode)
    (load-file two-mode)
  (require 'nxml-mode)
  (require 'two-mode-mode)
  (or (assoc "\\.yaws$" auto-mode-alist)
      (setq auto-mode-alist (cons '("\\.yaws$" . two-mode-mode) auto-mode-alist))))

;; Enable erlang-mode for rebar.config files
(add-to-list 'auto-mode-alist '("rebar.config" . erlang-mode))

;; Enable shell-script-mode for .bashrc.personal filename
(add-to-list 'auto-mode-alist '(".bashrc.personal" . shell-script-mode))


(require 'whitespace)
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
 '(global-whitespace-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation ignore)))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (magit-delta magit groovy-mode yaml-mode)))
 '(quote (size-indication-mode t))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))


(setq version-control t)
(setq delete-old-versions 'no)
(setq kept-new-versions 5)
(setq kept-old-versions 5)
(setq vc-make-backup-files t)
(setq default-frame-alist '((height . 61) (top . 0)))
(setq-default indent-tabs-mode nil)
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))


;; Set text and backgrounds
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "yellow" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "unknown")))))
