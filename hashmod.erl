-module(hashmod).
-export([hashin/3, hashout/3]).

hashout(TabId, PercentNum, K) ->
	MyRandom = randomstring:get(K, "abcdefghijklmnopqrstuvwxyz"),
	RandomMatch = ets:lookup(TabId, MyRandom),
	case PercentNum>0 of
		true -> 
			case RandomMatch of
				[] ->
					hashout(TabId, PercentNum, K);
				_ ->
					ets:delete(TabId, RandomMatch),
					hashout(TabId, PercentNum-1, K)
			end;
		false ->
			PercentNum
	end.

hashin(TabId, N, K) -> 
	case N>0 of
		true ->
			MyRandom = randomstring:get(K,"abcdefghijklmnopqrstuvwxyz"),
			ets:insert(TabId,{MyRandom,MyRandom}),
			N + hashin(TabId, N-1, K);
		false -> N
	end.

