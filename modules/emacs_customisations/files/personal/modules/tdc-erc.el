(prelude-ensure-module-deps '(erc-hl-nicks erc-image erc-tweet))
(require 'erc-hl-nicks)
(require 'erc-tweet)
(require 'erc-image)
(require 'erc-join)
(require 'tdc-todochiku)

(erc-autojoin-enable)

(setq erc-autojoin-channels-alist
      '(("rackspace.com" "#NebOps" "#cloudoutage")
        ("freenode.net" "#rackred" "#reach-qe" "#reach-dev")))

(setq erc-nick "tobyclemson")
(setq erc-auto-query "frame")

(add-to-list 'auth-source-protocols '(irc "irc" "6667"))

(add-to-list 'erc-modules 'spelling)
(add-to-list 'erc-modules 'keep-place)
(add-to-list 'erc-modules 'log)
(add-to-list 'erc-modules 'tweet)
(add-to-list 'erc-modules 'image)

(defun connect-to (irc-server-url)
  (erc :server irc-server-url
       :nick "tobyclemson"))

(defun connect-to-freenode-irc ()
  (interactive)
  (connect-to "irc.freenode.net"))

(defun connect-to-rackspace-irc ()
  (interactive)
  (connect-to "irc.intra.rackspace.com"))

(defun reach-irc ()
  (interactive)
  (connect-to-freenode-irc)
  (connect-to-rackspace-irc))

(defun notify-privmsg (proc parsed)
  (let ((nick (car (erc-parse-user (erc-response.sender parsed))))
        (target (car (erc-response.command-args parsed)))
        (msg (erc-response.contents parsed)))
    (when (and (erc-current-nick-p target)
               (not (erc-is-message-ctcp-and-not-action-p msg)))
      (todochiku-message (format "ERC message from: %s" nick)
                         msg
                         (todochiku-icon 'irc)
                         nil))))

(defun notify-nick-mentioned (match-type nick msg)
  (when (eq match-type 'current-nick)
    (todochiku-message (format "%s mentioned your nick." (car (split-string nick "!")))
                       msg
                       (todochiku-icon 'irc)
                       t)))

(add-hook 'erc-text-matched-hook 'notify-nick-mentioned)
(add-hook 'erc-server-PRIVMSG-functions 'notify-privmsg t)
(add-hook 'erc-server-PRIVMSG-functions 'erc-server-PRIVMSG t)

(erc-update-modules)

(provide 'tdc-erc)
