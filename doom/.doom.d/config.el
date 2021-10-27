;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Miguel Bermudez"
      user-mail-address "miguel@miguelbermudez.com"
      doom-font (font-spec :family "JetBrains Mono" :size 12)
      line-spacing 0.35
      doom-theme 'doom-laserwave)

;; ui config
(setq line-spacing 0.25)
(setq doom-font (font-spec :family "Iosevka" :size 16))

;; evil config
(setq-default evil-escape-key-sequence "fd")

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
    (checking 3)
    (>defn :defn)
    (>defn- :defn)
    (match 1)
    (case 1)
    (describe 1)
    (it 2)
    (fn-traced :defn)
    (defn-traced :defn)
    (assert-match 1))
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

