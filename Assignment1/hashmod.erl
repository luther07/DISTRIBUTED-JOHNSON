%%%----------------------------------------------------------------------
%%% File    : hashmod.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Methods to fill, delete records from, and re-fill a hash table
%%% Created : 08 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(hashmod).
-export([hashin/3, hashout/3, rehash/3]).

hashin(TabId, N, K) -> 
   case N>0 of
      true ->
         MyRandom = randomstring:get(K,"abcdefghijklmnopqrstuvwxyz"),
         RandomMatch = ets:lookup(TabId, MyRandom),
         case RandomMatch of
            [] ->
               ets:insert(TabId, {MyRandom,MyRandom}),
               hashin(TabId, N-1, K);
            _  ->
               hashin(TabId, N, K)
         end;
      false -> ok
   end.

hashout(TabId, PercentNum, K) ->
   case PercentNum>0 of
      true -> 
         MyRandom = randomstring:get(K, "abcdefghijklmnopqrstuvwxyz"),
         RandomMatch = ets:lookup(TabId, MyRandom),
         case RandomMatch of
            [] ->
               hashout(TabId, PercentNum, K);
            _ ->
               ets:delete(TabId, MyRandom),
               hashout(TabId, PercentNum-1, K)
         end;
      false ->
         PercentNum
   end.

rehash(TabId, PercentNum, K) ->
   case PercentNum>0 of
      true ->
         MyRandom = randomstring:get(K, "abcdefghijklmnopqrstuvwxzy"),
         RandomMatch = ets:lookup(TabId, MyRandom),
         case RandomMatch of
            [] ->
               rehash(TabId, PercentNum, K);
            _  ->
               ets:insert(TabId, {MyRandom, MyRandom}),
               rehash(TabId, PercentNum-1, K)
        end;
      false ->
         PercentNum
   end.

