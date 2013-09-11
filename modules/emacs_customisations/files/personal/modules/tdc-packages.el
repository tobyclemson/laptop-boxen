(package-initialize)

;; check if required packages are installed; if not, install them.
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
 '(todochiku))

(provide 'tdc-packages)
