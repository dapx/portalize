#!/bin/bash
rcFile=".$(basename $SHELL)rc"
cp ~/$rcFile ~/$rcFile.bkp.$(date +%y%m%d%H%M%S)

portalize_function_alias="alias portalize='make_portal() { echo alias \$1=\$PWD >> ~/$rcFile; unset -f make_portal; source ~/$rcFile }; make_portal'"
unportalize_function_alias="alias unportalize='destroy_portal() { printf \"%s\\n\" \"g/alias \$1=/d\" w | ed -s ~/$rcFile; unalias \$1; unset -f destroy_portal; source ~/$rcFile }; destroy_portal'"

echo $portalize_function_alias >> ~/$rcFile
echo $unportalize_function_alias >> ~/$rcFile

unset portalize_function_alias unportalize_function_alias rcFile
