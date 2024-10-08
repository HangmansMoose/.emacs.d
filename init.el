(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
;; (toggle-truncate-lines)

(menu-bar-mode -1)

(setq visible-bell nil)

(set-face-attribute 'default nil :font "MesloLGM Nerd Font Mono" :height 120)

;; Init package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
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

(unless (package-installed-p 'kanagawa-themes)
  (use-package kanagawa-themes))

(unless (package-installed-p 'doom-themes)
  (use-package doom-themes))

(setq doom-themes-enabled-bold nil
      doom-themes-enabled-italic nil)

(load-theme 'doom-gruvbox t)

;; Doom themes - gruvbox, acario-dark, manegarm

;; ctrl-h v describe function
(setq split-height-threshold nil)


;; Ivy is an completion package that adds nicer/better completion for file/buffer searches - does a lot more than that, will learn as I come across it.
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6" default))
 '(package-selected-packages
   '(doom-themes doom-manegarm doom-acario-dark doom-gruvbox doom-modeline kanagawa-themes ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Ver 29+ of emacs is built with treesitter integrated
;; Must provide the language definitions to use

(setq treesit-language-source-alist
      '((python "https://github.com/tree-sitter/tree-sitter-python")
        (make "https://github.com/alemuller/tree-sitter-make")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; NOTE: need to come back and have a loop here that will check whether these langs are installed and, if not, install them

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))



(set-background-color "#161616")
