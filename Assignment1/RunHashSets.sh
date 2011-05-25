#!/bin/bash
erlc randomstring.erl
erlc hashmod.erl
erlc mainprogram.erl
erlc prep.erl
erlc tests.erl
erl -noshell -run prep prep_file -run init stop
erl -noshell -run tests test_series -run init stop
for i in {1..4}
do
	erl -noshell -run mainprogram program -extra $i 50 $i
done
