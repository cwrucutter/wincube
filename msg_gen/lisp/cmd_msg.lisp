; Auto-generated. Do not edit!


(cl:in-package wincube-msg)


;//! \htmlinclude cmd_msg.msg.html

(cl:defclass <cmd_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (left
    :reader left
    :initarg :left
    :type cl:fixnum
    :initform 0)
   (right
    :reader right
    :initarg :right
    :type cl:fixnum
    :initform 0))
)

(cl:defclass cmd_msg (<cmd_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wincube-msg:<cmd_msg> is deprecated: use wincube-msg:cmd_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <cmd_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wincube-msg:header-val is deprecated.  Use wincube-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <cmd_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wincube-msg:left-val is deprecated.  Use wincube-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <cmd_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wincube-msg:right-val is deprecated.  Use wincube-msg:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_msg>) ostream)
  "Serializes a message object of type '<cmd_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_msg>) istream)
  "Deserializes a message object of type '<cmd_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_msg>)))
  "Returns string type for a message object of type '<cmd_msg>"
  "wincube/cmd_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_msg)))
  "Returns string type for a message object of type 'cmd_msg"
  "wincube/cmd_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_msg>)))
  "Returns md5sum for a message object of type '<cmd_msg>"
  "81401375253b01074df288a02d8d49bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_msg)))
  "Returns md5sum for a message object of type 'cmd_msg"
  "81401375253b01074df288a02d8d49bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_msg>)))
  "Returns full string definition for message of type '<cmd_msg>"
  (cl:format cl:nil "Header header~%int8 left~%int8 right~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_msg)))
  "Returns full string definition for message of type 'cmd_msg"
  (cl:format cl:nil "Header header~%int8 left~%int8 right~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_msg
    (cl:cons ':header (header msg))
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
