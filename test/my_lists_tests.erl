-module(my_lists_tests).

-include_lib("eunit/include/eunit.hrl").

is_gt(X) -> fun(Y) -> Y > X end.

filter_test_() ->
    [
        filter_parity(is_gt(2), [1, 2, 3]),
        filter_parity(is_gt(2), [1, 2])
    ].

filter_parity(Predicate, List) ->
    ?_assertEqual(lists:filter(Predicate, List), my_lists:filter(Predicate, List)).

map_test_() -> [map_parity(fun(X) -> X * 2 end, [1, 2])].

map_parity(Mapper, List) ->
    ?_assertEqual(lists:map(Mapper, List), my_lists:map(Mapper, List)).

fold_test_() ->
    [
        fold_parity(fun(X, Acc) -> X + Acc end, 0, [1, 2, 3])
    ].

fold_parity(Fun, Acc, List) ->
    ?_assertEqual(lists:foldl(Fun, Acc, List), my_lists:fold(Fun, Acc, List)).
