(require 'tdc-snippets)

(add-hook
 'js3-mode-hook
 #'(lambda ()
     (add-to-list (make-variable-buffer-local 'yas--extra-modes)
                  'js-mode)))

(provide 'tdc-js)
