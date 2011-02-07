-module(hashmod).
-export([hashin/2, hashout/2]).

hashout(TabId, PercentNum) ->
	MyRandom = randomstring:get(5, "abcdefghijklmnopqrstuvwxyz"),
	RandomMatch = ets:lookup(TabId, MyRandom),
	case PercentNum>0 of
		true -> 
			case RandomMatch of
				[] ->
					hashout(TabId, PercentNum);
				_ ->
					ets:delete(TabId, RandomMatch),
					hashout(TabId, PercentNum-1)
			end;
		false ->
			PercentNum
	end.

hashin(TabId, N) -> 
	case N>0 of
		true ->
			MyRandom = randomstring:get(5,"abcdefghijklmnopqrstuvwxyz"),
			ets:insert(TabId,{MyRandom,MyRandom}),
			N + hashin(TabId, N-1);
		false -> N
	end.

