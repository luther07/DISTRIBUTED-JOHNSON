#!/bin/bash
erlc randomstring.erl
erlc hashmod.erl
erlc mainprogram.erl
erl -noshell -run mainprogram prep_file
for i in {1..4}
do
	for j in {50}
	do
		erl -noshell -run mainprogram get_args -extra $i $j $i
	done
done
