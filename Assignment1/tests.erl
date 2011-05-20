%%%-----------------------------------------------------------------
%%% File	: tests.erl
%%% Author	: Mark Johnson <mjohnson4@luc.edu>
%%% Purpose	: Tests modules in module "mainprogram"
%%% Created	: 17 May 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified	: 19 May 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%-----------------------------------------------------------------

-module(tests).
-export([test1/3, test_series/0]).

% Let's test function "powers/2" in module "mainprogram".
test1(Base, Exp, Result) ->
	case (mainprogram:powers(Base, Exp)) of
		Result	->
				true;
		_  	->	
				false
	end.

%Test series for "powers/2" in module "mainprogram".
test_series()	->
	
	io:fwrite("\nTest 0? "),
	io:fwrite(tests:test1(2, 0, 1)),

	io:fwrite("\nTest 1? "),
	io:fwrite(tests:test1(2, 1, 2)),

	io:fwrite("\nTest 2? "),
	io:fwrite(tests:test1(2, 2, 4)),

	io:fwrite("\nTest 3? "),
	io:fwrite(tests:test1(2, 3, 8)),

	io:fwrite("\nTest 4? "),
	io:fwrite(tests:test1(2, 4, 16)),

	io:fwrite("\nTest 5? "),
	io:fwrite(tests:test1(2, 5, 32)),

	io:fwrite("\nTest 6? "),
	io:fwrite(tests:test1(2, 6, 64)),
	
	io:fwrite("\n").
