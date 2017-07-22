;;; browserific.el --- Show the current buffer's content in a browser

;; Copyright (C) XXXX

;; Author: xxx <xxx@xxx.xxx>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; browserific htmlizes the current buffer's content and displays it in the
;; default browser.
;;
;; Usage:
;;
;;     M-x browserific
;;
;; or
;;
;;     M-x browserific-use-htmlfontify
;;
;; or
;;
;;     M-x browserific-use-htmlize
;;
;; `M-x browserific' uses `htmlize' by default and falls back to
;; `htmlfontify' if it is not available.

;;; Code:

(defvar bfy-html-document-path "~/.emacs.d/")

(defvar bfy-html-document-name "document.html")

(defun browserific-use-htmlize (&optional buffer)
  "Instantly opens the content of a buffer in the system's default browser
by making use of the `htmlize.el' library.

This is done by storing the html output in `bfy-html-document-path' in a
file with the name stored int `bfy-html-document-name' and pointing the
system's default browser to this file."
  (interactive "bbrowserific buffer: ")
  (let ((url (expand-file-name (concat bfy-html-document-path
                                       bfy-html-document-name))))
    (with-current-buffer (htmlize-buffer buffer)
      (write-file
       url)
      (browse-url url))))

(defun browserific-use-htmlfontify (&optional buffer)
  "Instantly opens the content of a buffer in the system's default browser
by making use of the `htmlfontify.el' library.

This is done by storing the html output in `bfy-html-document-path' in a
file with the name stored int `bfy-html-document-name' and pointing the
system's default browser to this file."
  (interactive "bbrowserific buffer: ")
  (let ((url (expand-file-name (concat bfy-html-document-path
                                       bfy-html-document-name))))
    (with-current-buffer buffer
      (with-current-buffer (htmlfontify-buffer)
        (write-file
         url)
        (browse-url url)))))

(defun browserific (&optional buffer)
  "Instantly opens the content of a buffer in the system's default browser
by making use of either the `htmlize.el' or the `htmlfontify.el' library.

If `htmlize.el' is available it will be preferred over `htmlfontify.el'."

It  is achieved by storing the html output in `bfy-html-document-path' in a
file with the name stored int `bfy-html-document-name' and pointing the
system's default browser to this file."
  (interactive "bbrowserific buffer: ")
  (if (require 'htmlize nil 'noerror)
      (browserific-use-htmlize buffer)
      (browserific-use-htmlfontify buffer)))


(provide 'browserific)
;;; browserific.el ends here
