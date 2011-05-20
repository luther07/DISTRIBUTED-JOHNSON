#!/bin/bash
erlc randomstring.erl
erlc hashmod.erl
erlc mainprogram.erl
erlc prep.erl
erlc tests.erl
erl -noshell -run prep prep_file -run init stop
echo "file is prepped"
for i in {1..4}
do
	erl -noshell -run mainprogram get_args -extra $i 50 $i
done
