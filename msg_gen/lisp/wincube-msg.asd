
(cl:in-package :asdf)

(defsystem "wincube-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "cmd_msg" :depends-on ("_package_cmd_msg"))
    (:file "_package_cmd_msg" :depends-on ("_package"))
  ))