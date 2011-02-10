#!/bin/bash
erlc randomstring.erl
erlc hashmod.erl
erlc mainprogram.erl
for i in {1..5}
do
	combinations=26**$i
	erl -noshell -run mainprogram get_args -extra $combinations 50 $i
done
