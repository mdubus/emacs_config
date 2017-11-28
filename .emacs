
(package-initialize)
(require 'package)
(add-to-list 'package-archives
                 '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; ---------- BONUS ----------

;; colonne de 80 caracteres
(setq-default fill-column 80)
(setq auto-fill-mode 1)

;; Insertion du header de 42 pour le 'normalize_me'
(setq config_files "/usr/share/emacs/site-lisp/")
(setq load-path (append (list nil config_files) load-path))
(load "header.el")

;; Les tab sont de tab 4 et l'indentation en C aussi
(setq default-tab-width 4)
(setq c-basic-offset 4)
(setq tab-width 4)
(setq-default indent-tabs-mode t)

;; highlight la parenthese / accolade complementaire
(require 'paren)
(show-paren-mode 1)
(setq show-parem-delay 0)
;;(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#7EB6FF")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(set-face-background 'show-paren-match nil)


;; permet d'inserer des tabs pour la norme
(global-set-key (kbd "TAB") 'self-insert-command)

;; ---------- PARTIE OBLIGATOIRE ----------

;; Indentation automatique
(setq c-default-style "linux")
(defun set-newline-and-indent ()
(local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode-hook 'set-newline-and-indent)

;; Les parentheses s'autocompletent
(electric-pair-mode t)

;; Le numero de la colonne du curseur est affichee
(setq column-number-mode t)

;; Highlight deux espaces cote a cote en bleu
;;(global-hi-lock-mode 1)
;;(add-hook 'change-major-mode-hook '(lambda () (highlight-regexp "  " 'hi-blue)))

;; Highlight les espaces de fin de ligne en rouge
(setq-default show-trailing-whitespace t)

;; Sauvegarde dans un dossier specifique
(setq backup-directory-alist '(("." . "~/.emacs.d/Backups")))

;; Theme monokai-alt-theme

(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-safe-themes
   (quote
	("eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages (quote (monokai-alt-theme neotree))))
(custom-set-faces
 )
(load-theme 'monokai-alt)

