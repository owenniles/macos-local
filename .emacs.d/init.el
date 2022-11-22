(setq server-socket-dir "~/.emacs.d")

(add-to-list 'load-path "~/.emacs.d/packages")
(add-to-list 'load-path "~/.emacs.d/packages/emacs-libvterm")
(add-to-list 'load-path "~/.emacs.d/packages/go-mode.el")
(add-to-list 'load-path "~/.emacs.d/packages/typescript.el")
(add-to-list 'load-path "~/.emacs.d/packages/yaml-mode")

(require 'go-mode)
(require 'protobuf-mode)
(require 'typescript-mode)
(require 'yaml-mode)

(autoload 'vterm "vterm" nil t)

(add-hook 'go-mode-hook (lambda () (setq tab-width 2)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(mac-auto-operator-composition-mode t)
 '(menu-bar-mode nil)
 '(org-babel-load-languages '((shell . t) (emacs-lisp . t)))
 '(scroll-bar-mode nil)
 '(server-name "server")
 '(set-mark-command-repeat-pop t)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(visible-bell t)
 '(vterm-buffer-name-string "vterm %s")
 '(vterm-shell "/bin/bash"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(fringe ((t (:inherit default)))))

(server-start)
