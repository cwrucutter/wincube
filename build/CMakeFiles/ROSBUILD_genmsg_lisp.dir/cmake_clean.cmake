FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/wincube/msg"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/cmd_msg.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_cmd_msg.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
