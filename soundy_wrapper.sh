#!/bin/bash
working_dir=$(dirname "$(readlink -f "$0")")
cd "${working_dir}"
shell='gnome-terminal'
cols='23'
rows=$(./soundy -l | wc -l)
${shell} --title=soundy --geometry=${cols}x${rows} -- ./soundy -i 2> /dev/null
