#!/bin/bash
erlc randomstring.erl
erlc hashmod.erl
erlc mainprogram.erl
erlc prep.erl
erlc nobif.erl
erlc nobif_tests.erl
erl -noshell -run prep prep_file -run init stop
erl -noshell -run nobif test -run init stop
for i in {1..3}
do
	erl -noshell -run mainprogram program -extra $i 50 $i
done
