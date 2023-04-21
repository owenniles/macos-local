(setq gofmt-command "goimports")
(setq mac-command-modifier 'meta)
(setq server-socket-dir "~/.emacs.d")

(add-to-list 'exec-path "~/go/bin")
(add-to-list 'load-path "~/.emacs.d/packages")
(add-to-list 'load-path "~/.emacs.d/packages/copilot.el")
(add-to-list 'load-path "~/.emacs.d/packages/dash.el")
(add-to-list 'load-path "~/.emacs.d/packages/editorconfig-emacs")
(add-to-list 'load-path "~/.emacs.d/packages/emacs-hcl-mode")
(add-to-list 'load-path "~/.emacs.d/packages/emacs-libvterm")
(add-to-list 'load-path "~/.emacs.d/packages/go-mode.el")
(add-to-list 'load-path "~/.emacs.d/packages/s.el")
(add-to-list 'load-path "~/.emacs.d/packages/terraform-mode")
(add-to-list 'load-path "~/.emacs.d/packages/typescript.el")
(add-to-list 'load-path "~/.emacs.d/packages/yaml-mode")

(require 'copilot)
(require 'go-mode)
(require 'protobuf-mode)
(require 'terraform-mode)
(require 'typescript-mode)
(require 'yaml-mode)

(autoload 'vterm "vterm" nil t)

(add-hook
 'before-save-hook
 (lambda () (unless (file-remote-p default-directory) (gofmt-before-save))))
(add-hook 'go-mode-hook (lambda () (setq tab-width 2)))
(add-hook 'prog-mode-hook 'copilot-mode)

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

;; Accept the current Copilot completion one word at a time by pressing tab if
;; one is available. Otherwise, fall back to the default behavior.
(defun accept-completion-by-word-or-tab ()
  (interactive)
  (or (copilot-accept-completion-by-word)
      (indent-for-tab-command)))

(defun accept-completion-or-complete ()
  (interactive)
  (or (copilot-accept-completion)
      (copilot-complete)))

(with-eval-after-load 'copilot
  (define-key copilot-mode-map (kbd "<tab>") 'accept-completion-by-word-or-tab)
  (define-key copilot-mode-map (kbd "C-<return>") 'accept-completion-or-complete)
  (define-key copilot-mode-map (kbd "M-n") 'copilot-next-completion)
  (define-key copilot-mode-map (kbd "M-p") 'copilot-previous-completion))

(server-start)
