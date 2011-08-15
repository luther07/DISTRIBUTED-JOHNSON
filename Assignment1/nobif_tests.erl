%%%-----------------------------------------------------------------
%%% File	: nobif_tests.erl
%%% Author	: Mark Johnson <mjohnson4@luc.edu>
%%% Purpose	: Tests function powers/2 in module nobif
%%% Created	: 17 May 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified	: 14 July 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%-----------------------------------------------------------------

-module(nobif_tests).
-include_lib("eunit/include/eunit.hrl").

% Let's test function "powers/2" in module "nobif".
powers_test() ->
   ?assertEqual(nobif:powers(2,0),1),
   ?assertEqual(nobif:powers(2,1),2),
   ?assertEqual(nobif:powers(2,2),4),
   ?assertEqual(nobif:powers(2,3),8),
   ?assertEqual(nobif:powers(2,4),16),
   ?assertEqual(nobif:powers(2,5),32),
   ?assertEqual(nobif:powers(2,6),64).

