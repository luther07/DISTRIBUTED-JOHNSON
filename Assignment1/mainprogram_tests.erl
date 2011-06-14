%%%-----------------------------------------------------------------
%%% File	: mainprogram_tests.erl
%%% Author	: Mark Johnson <mjohnson4@luc.edu>
%%% Purpose	: Tests modules in module "mainprogram"
%%% Created	: 17 May 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified	: 14 June 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%-----------------------------------------------------------------

-module(mainprogram_tests).
-include_lib("eunit/include/eunit.hrl").
-export([powers_test/0]).

% Let's test function "powers/2" in module "mainprogram".
powers_test() ->
   ?assertequal(mainprogram:powers(2,0),1),
   ?assertequal(mainprogram:powers(2,1),2),
   ?assertequal(mainprogram:powers(2,2),4),
   ?assertequal(mainprogram:powers(2,3)8),
   ?assertequal(mainprogram:powers(2,4)16),
   ?assertequal(mainprogram:powers(2,5),32),
   ?assertequal(mainprogram:powers(2,6),64).

