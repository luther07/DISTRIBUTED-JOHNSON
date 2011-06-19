%%%-----------------------------------------------------------------
%%% File	: mainprogram_tests.erl
%%% Author	: Mark Johnson <mjohnson4@luc.edu>
%%% Purpose	: Tests modules in module "mainprogram"
%%% Created	: 17 May 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified	: 14 June 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%-----------------------------------------------------------------

-module(mainprogram_tests).
-include_lib("eunit/include/eunit.hrl").

% Let's test function "powers/2" in module "mainprogram".
powers_test() ->
   ?assertEqual(mainprogram:powers(2,0),1),
   ?assertEqual(mainprogram:powers(2,1),2),
   ?assertEqual(mainprogram:powers(2,2),4),
   ?assertEqual(mainprogram:powers(2,3),8),
   ?assertEqual(mainprogram:powers(2,4),16),
   ?assertEqual(mainprogram:powers(2,5),32),
   ?assertEqual(mainprogram:powers(2,6),64).

