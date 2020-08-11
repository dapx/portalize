#!/bin/sh
cp ~/.$(basename $SHELL)rc ~/.$(basename $SHELL)rc.bkp.$(date +%y%m%d%H%M%S)

portalize_function_alias="alias portalize='make_portal(){ echo alias \$1=\$PWD >> ~/.$(basename $SHELL)rc; unset -f make_portal; source ~/.$(basename $SHELL)rc }; make_portal'"
unportalize_function_alias="alias unportalize='destroy_portal(){ printf \"%s\\n\" \"g/alias \$1=/d\" w | ed -s ~/.$(basename $SHELL)rc; unalias \$1; unset -f destroy_portal; source ~/.$(basename $SHELL)rc }; destroy_portal'"

echo $portalize_function_alias >> ~/.$(basename $SHELL)rc
echo $unportalize_function_alias >> ~/.$(basename $SHELL)rc

unset -f portalize_function_alias unportalize_function_alias
