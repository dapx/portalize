#!/bin/sh
rc_filename=".$(basename $SHELL)rc"
portals_filename=".portals"

portals_alias="alias portals='sed \"/^alias portals/d; /^alias portalize/d; /^alias unportalize/d; s/alias //g; s/=/ /g\" ~/$portals_filename'"
portalize_function_alias="alias portalize='make_portal() { echo alias \$1=\$PWD >> ~/$portals_filename; unset -f make_portal; . ~/$rc_filename }; make_portal'"
unportalize_function_alias="alias unportalize='destroy_portal() { printf \"%s\\\\n\" \"g/alias \$1=/d\" w | ed -s ~/$portals_filename; unalias \$1; unset -f destroy_portal; . ~/$rc_filename }; destroy_portal'"

add_text_to_file_if_not_exists() {
  text=$1
  file=$2
  grep -qxF "$text" $file || echo $text >> $file
  unset text file
}

remove_alias() {
  # Uses printf with ed
  # 'cause the default 'sed -i' is different between Linux and BSD like.
  printf "%s\n" "g/alias $1=/d" w | ed -s ~/$portals_filename &>/dev/null
}

add_text_to_file_if_not_exists ". ~/$portals_filename" ~/$rc_filename

remove_alias portals
remove_alias portalize
remove_alias unportalize

echo $portals_alias >> ~/$portals_filename
echo $portalize_function_alias >> ~/$portals_filename
echo $unportalize_function_alias >> ~/$portals_filename

unset portals_alias portalize_function_alias unportalize_function_alias rc_filename portals_filename
