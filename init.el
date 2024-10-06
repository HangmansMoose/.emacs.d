(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
;; (toggle-truncate-lines)

(menu-bar-mode -1)

(setq visible-bell t)

(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono" :height 120)

(load-theme 'tango-dark)

;;Init package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; This block ensures that the package list is populated if this is the first run
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; If use-package is not installed install it using package-install
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ctrl-h f describe function
