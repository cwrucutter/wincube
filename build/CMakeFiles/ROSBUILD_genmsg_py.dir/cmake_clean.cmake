FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/wincube/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/wincube/msg/__init__.py"
  "../src/wincube/msg/_cmd_msg.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
