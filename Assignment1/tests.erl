%%%-----------------------------------------------------------------
%%% File	: tests.erl
%%% Author	: Mark Johnson <mjohnson4@luc.edu>
%%% Purpose	: Tests modules in module "mainprogram"
%%% Creeated	: 17 May 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%-----------------------------------------------------------------

-module(tests).
-export([test1/3, test2/2]).

%Test function "powers/2" in module "mainprogram".
test1(Base, Exp, Res) ->
	case (mainprogram:powers(Base, Exp)) of
		Result	->
				true;
		_  	->	
				false
	end.

%Test return values from powers in File mainprogram.erl.
test2(Base, Exp) ->
	mainprogram:powers(Base, Exp).
	
