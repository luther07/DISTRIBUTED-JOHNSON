#!/bin/bash
erlc randomstring.erl
erlc hashmod.erl
erlc mainprogram.erl
erl -noshell -run mainprogram prep_file
for i in {1..4}
do
	combinations=26**$i
	for j in {25 50 75}
	do
		erl -noshell -run mainprogram get_args -extra $combinations $j $i
	done
done
