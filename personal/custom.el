(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (geiser json-mode js2-mode rainbow-mode elisp-slime-nav company smex ido-ubiquitous flx-ido helm-projectile helm rainbow-delimiters auto-complete erlang vkill exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'flycheck)

(flycheck-define-checker erlang
                         "An Erlang syntax checker using the Erlang interpreter."
                         :command ("erlc"
                                   "-I" (eval (format "%s/include" (projectile-project-root)))
                                   "-I" (eval (format "%s/deps" (projectile-project-root)))
                                   "-o" temporary-directory
                                   (option-list "-I" flycheck-erlang-include-path)
                                   (option-list "-pa" flycheck-erlang-library-path)
                                   "-Wall"
                                   source)
                         :error-patterns
                         ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
                          (error line-start (file-name) ":" line ": " (message) line-end))
                         :modes erlang-mode)

(electric-pair-mode 1)

(add-hook 'erlang-mode-hook 'auto-complete-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)


