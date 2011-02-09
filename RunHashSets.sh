#!/bin/bash
erlc randomstring.erl
erlc hashmod.erl
erlc mainprogram.erl
erl -noshell -run mainprogram get_args -extra 26 50 1
