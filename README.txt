A basic program allowing for simulations of FSMs in Haskell. Both NFAs and DFAs can be dealt with

An FSM is treated as a 5 tuple: (Q, ∑, δ, q0, F) where:
Q is a list of integers representing a state. Integers should be unique.
∑ is a list representing the alphabet of the FSM. 'Characters' should be unique. If the functions are to be used, a should be in the Eq typeclass
δ is a list of 3 tuples representing the transition function. For each tuple (q,a,r), δ(q,a) = r
q0 is the initial state
F is a list representing the set of accepting states.

This'll probably never be touched again, but feel free to use this for whatever
