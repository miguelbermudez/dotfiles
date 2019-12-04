;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
(package! company-lsp)
(package! flycheck-clojure)
(package! flycheck-clj-kondo)
(package! flycheck-credo)
(package! aggressive-indent)
(package! lispyville)
(package! lsp-mode)
(package! lsp-ui :recipe (:host github :repo "emacs-lsp/lsp-ui"))
