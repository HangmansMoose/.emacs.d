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

(unless (package-installed-p 'gruber-darker-theme)
  (use-package gruber-darker-theme))

(load-theme 'doom-gruvbox t)

(setq doom-themes-enabled-bold nil
      doom-themes-enabled-italic nil)

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
   '("48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710" "38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6" default))
 '(package-selected-packages
   '(gruber-darker-theme gruber-darker doom-themes doom-manegarm doom-acario-dark doom-gruvbox doom-modeline kanagawa-themes ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#161616" :foreground "#ebdbb2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 120 :width normal :foundry "outline" :family "MesloLGM Nerd Font Mono")))))

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




