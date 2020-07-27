> type State = Int
> type Transistion a = (State, a, State)
> type FSM a = ([State], [a], [Transistion a], State, [State]) -- a is the type of characters used in the alphabet
> type CurrentStates = [State]

For the purposes of this, it will not matter if the machine is an NFA or DFA

> accept :: FSM a -> [a] -> Bool
> accept (q, xs, trans, init, f) w = current (q, xs, trans, init, f) [init] w

> current :: FSM a -> CurrentStates -> [a] -> Bool
> current (q, xs, trans, init, f) qs (w:ws) = current (q,xs,trans,init,f) (map (flip (transitions trans) w) qs) ws
> current (_,_,_,_,f) qs []       = foldr ((||) . elem f) False qs -- accumulates the outcomes of states

> transitions :: Eq a => [Transistion a] -> State -> a -> [State]
> transitions ((x,y,z):xs) q w | q == x && w == y = z:(transitions xs)
>                              | otherwise        = transitions xs
> transitions []           _ _ = [] -- fold?
