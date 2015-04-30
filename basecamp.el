(require 'json)
(require 'request)

(defgroup basecamp nil
  "Basecamp Quick Todo"
  :prefix "basecamp-")

(defcustom user-agent "elisp (your.email@address.com)"
  "Used for HTTP user agent"
  :type '(string)
  :group 'basecamp)

(defun basecamp-todo (user pass user-id project-id todo-id content)
  (let* ((auth (concat "Basic " (base64-encode-string (concat user ":" pass))))
	 (url (concat "https://basecamp.com/" user-id "/api/v1/projects/" project-id "/todolists/" todo-id "/todos.json"))
	 (response (request
		    url
		    :headers (list (cons "Authorization" auth)
				   (cons "User-Agent" user-agent)
				   '("Content-Type" . "application/json"))
		    :parser 'json-read
		    :type "POST"
		    :data (json-encode-alist (list (cons "content"  content)))
		    :success (function*
			      (lambda (&key data response &allow-other-keys)
				(if (= (request-response-status-code response) 201)
				    (message "OK")
				  (message response)))))))
    nil))

(defun quick-basecamp-todo (content)
  (interactive "sEnter something: ")
  (basecamp-todo "username" "password" "user-id" "project-id" "todo-id" content))

(provide 'basecamp)
