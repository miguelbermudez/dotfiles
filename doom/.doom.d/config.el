;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; ui config
(setq line-spacing 0.25)
;; (setq doom-font (font-spec :family "Iosveka" :size 16))

;; evil config
(setq-default evil-escape-key-sequence "fd")

;; Place your private configuration here
(projectile-add-known-project "~/Documents/Develop/the-platform-client")
(projectile-add-known-project "~/Documents/Develop/Clojure/shadow-ddp")



(after! clojure-mode
	(require 'flycheck-clj-kondo)
  (setq clojure-indent-style 'always-indent)
  (define-clojure-indent
    (PUT 2)
    (POST 2)
    (GET 2)
    (PATCH 2)
    (DELETE 2)
    (context 2)
    (for-all 2)
    (checking 3))
  (setq clojure-align-forms-automatically t))

(after! neotree
(setq neo-theme 'icons))


(add-hook! elixir-mode
  (flycheck-mode)
  (rainbow-delimiters-mode))

(def-package! aggressive-indent
  :hook
  (clojure-mode . aggressive-indent-mode)
  (lisp-mode . aggressive-indent-mode))

(def-package! lispyville
  :hook ((emacs-lisp-mode clojure-mode) . lispyville-mode)
  :config
  (lispyville-set-key-theme
   '(operators
     c-w
     prettify
     text-objects
     atom-movement
     commentary
     wrap
     slurp/barf-lispy
     additional
     additional-movement
     additional-insert
     escape)))
