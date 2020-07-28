> type State = Int
> type Transistion a = (State, a, State)
> type FSM a = ([State], [a], [Transistion a], State, [State]) -- a is the type of characters used in the alphabet
> type CurrentStates = [State]

For the purposes of this, it will not matter if the machine is an NFA or DFA

> accept :: Eq a => FSM a -> [a] -> Bool
> accept (q, xs, trans, init, f) w = current (q, xs, trans, init, f) [init] w

> current :: Eq a => FSM a -> CurrentStates -> [a] -> Bool
> current (q, xs, trans, init, f) qs (w:ws) = current (q,xs,trans,init,f) (concat $ map (flip (transitions trans) w) qs) ws
> current (_,_,_,_,f) qs []       = foldr (\q other -> other || q `elem` f) False qs -- accumulates the outcomes of states :: could this be rewritten without the lambda

> transitions :: Eq a => [Transistion a] -> State -> a -> [State]
> transitions xs q w = foldr (\(x,y,z) acc -> if q == x && w == y then z:acc else acc) [] xs
