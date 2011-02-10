#!/bin/bash
erlc randomstring.erl
erlc hashmod.erl
erlc mainprogram.erl
erl -noshell -run mainprogram prep_file
echo "file is prepped"
for i in {1..4}
do
	erl -noshell -run mainprogram get_args -extra $i 50 $i
done
