# basecamp-elisp
Quick add Basecamp (https://basecamp.com/) todo in Emacs Lisp

# Installation
```bash
$ git clone https://github.com/doremi/basecamp-elisp
$ cd basecamp-elisp
$ cp basecamp.el ~/.emacs.d/
$ emacs
$ M-x package-install
Install package: request
```
# Usage
```elisp
$ M-x eval-expression 
(require 'basecamp)
$ M-x quick-basecamp-todo
Enter something: everything
```
Now you can see the new todo in your basecamp!
