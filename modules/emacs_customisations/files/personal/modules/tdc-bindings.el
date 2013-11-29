;; tdc-bindings.el --- Key Bindings.
;;

;;; Commentary:

;; Set up all custom key bindings

;;; Code:

;; switch meta and super by default
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; unset minimise
(global-unset-key "\C-z")

(provide 'tdc-bindings)
