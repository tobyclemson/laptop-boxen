;; tdc-ui.el --- UI package.
;;

;;; Commentary:

;; Add UI extensions.

;;; Code:

;; Toggle window dedication
(defun toggle-window-dedication ()
  "Toggle whether the current active window is dedicated or not."
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
       "Window '%s' is normal")
   (current-buffer)))
(global-set-key (kbd "C-c j") 'toggle-window-dedication)

(provide 'tdc-ui)
