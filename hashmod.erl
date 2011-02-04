-module(hashmod).
-export([hashin/2]).

hashin(TabId, N) -> 
	case N>0 of
		true ->
			MyRandom = randomstring:get(5,"abcdefghijklmnopqrstuvwxyz"),
			ets:insert(TabId,{MyRandom,MyRandom}),
			N + hashin(TabId, N-1);
		false -> N
	end.

hashout(TabId, N, D) ->
	Percent = N * D / 100,
	
	 
	


