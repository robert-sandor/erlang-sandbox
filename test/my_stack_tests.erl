-module(my_stack_tests).

-include_lib("eunit/include/eunit.hrl").

new_stack_has_length_zero_test() ->
    ?assertEqual(0, my_stack:length(my_stack:new())).

push_test() ->
    S = my_stack:new(),
    S1 = my_stack:push(S, something),
    ?assertEqual(1, my_stack:length(S1)).

pop_test() ->
    ItemIn = something,
    Stack = my_stack:push(my_stack:new(), ItemIn),
    {ItemOut, ResultingStack} = my_stack:pop(Stack),
    ?assertEqual(ItemIn, ItemOut),
    ?assertEqual(0, my_stack:length(ResultingStack)).

peek_test() ->
    ItemIn = something,
    Stack = my_stack:push(my_stack:new(), ItemIn),
    {ItemOut, ResultingStack} = my_stack:peek(Stack),
    ?assertEqual(ItemIn, ItemOut),
    ?assertEqual(Stack, ResultingStack),
    ?assertEqual(1, my_stack:length(ResultingStack)).
