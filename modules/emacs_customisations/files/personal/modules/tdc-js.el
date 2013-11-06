(prelude-ensure-module-deps '(js3-mode))
(require 'tdc-snippets)

(add-hook
 'js3-mode-hook
 #'(lambda ()
     (yas-activate-extra-mode 'js-mode))

 (provide 'tdc-js))
