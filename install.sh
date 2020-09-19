#!/bin/sh
rcFile=".$(basename $SHELL)rc"
portalsFile=".portals"
cp ~/$rcFile ~/$rcFile.bkp.$(date +%y%m%d%H%M%S)

portalize_function_alias="alias portalize='make_portal() { echo alias \$1=\$PWD >> ~/$portalsFile; unset -f make_portal; source ~/$rcFile }; make_portal'"
unportalize_function_alias="alias unportalize='destroy_portal() { printf \"%s\\\\n\" \"g/alias \$1=/d\" w | ed -s ~/$portalsFile; unalias \$1; unset -f destroy_portal; source ~/$rcFile }; destroy_portal'"

portalsFileLoad=". ~/$portalsFile"

echo $portalsFileLoad >> ~/$rcFile
echo $portalize_function_alias >> ~/$portalsFile
echo $unportalize_function_alias >> ~/$portalsFile

unset portalize_function_alias unportalize_function_alias rcFile portalsFile portalsFileLoad
