(setq server-socket-dir "~/.emacs.d")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . caml-mode))
(autoload 'caml-mode "caml" "Major mode for editing OCaml code." t)
(if window-system (require 'caml-font))
(add-hook 'go-mode-hook (lambda () (setq tab-width 2)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(epg-gpg-program "/usr/local/bin/gpg2")
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(mac-auto-operator-composition-mode t)
 '(menu-bar-mode nil)
 '(org-babel-load-languages '((shell . t) (emacs-lisp . t)))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(dash terraform-mode protobuf-mode typescript-mode solidity-mode caml yaml-mode go-mode vterm))
 '(scroll-bar-mode nil)
 '(server-mode t)
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
