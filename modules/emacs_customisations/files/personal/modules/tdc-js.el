(require 'tdc-snippets)

(add-hook
 'js3-mode-hook
 #'(lambda ()
     (setq yas/mode-symbol 'js-mode)))

(provide 'tdc-js)
