;; Set default theme
(defvar tdc-themes-dir (expand-file-name "themes" prelude-personal-dir)
  "The directory containing personal themes.")

(add-to-list 'custom-theme-load-path tdc-themes-dir)
(load-theme 'blackboard t)

(provide 'tdc-themes)
