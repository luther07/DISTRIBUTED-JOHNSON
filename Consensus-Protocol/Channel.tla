-----MODULE Channel-----
EXTENDS Naturals \*This imports the built-in Module for natural numbers
CONSTANT Data    \*This declares a constant, which could be more strictly specified
VARIABLE chan    \*A variable can take any value, but chan is a tuple, a triple

------------------------
(*Because TLA+ is a typeless language, we must declare a type invariant*)
(*The formula, TypeInvariant, describes the variable, chan*)
TypeInvariant == chan \in [val:Data, rdy:{0,1}, ack:{0,1}]
------------------------
(*Init is the initial state, the initial predicate*)
(*Formula Init says that the TypeInvariant must be true and ack must be equal to rdy*)
(*in the initial state*)
Init == /\ TypeInvariant
        /\ chan.ack = chan.rdy

------------------------
(*The formula, Send, describes an action where rdy must be equal to ack*)
(*and chan' must be equal to chan, except chan' val must be equal to parameter d*)
(*and rdy must be equal to 1 - rdy*)
Send(d) == /\ chan.rdy = chan.ack
           /\ chan' = [chan EXCEPT !.val = d, !.rdy = 1-@]

------------------------
(*The formula, Rcv, describes an action where rdy is not equal to ack*)
(*and chan' must be equal to chan, except chan' ack must be equal to 1 - ack *)
Rcv == /\ chan.rdy # chan.ack
       /\ chan' = [chan EXCEPT !.ack = 1-@]

------------------------
(*Next is the formula that describes the step or the granularity of state transition.*)
(*Formula Next says that either the action Send(d) is TRUE (where d is a subset of Data)*)
(*or the action Rcv is TRUE*)
Next == (\E d \in Data : Send(d)) \/ Rcv

------------------------
(*The formula, Spec, brings everything together in one formula.*)
(*Spec says that formula Init is TRUE and fromula Next is always true at all times,*)
(*except in the case that there is a stutter step and variable chan is unchanged.*)
Spec == Init /\ [][Next]_chan

-------------------------
(*THEOREM is a keyword. Saying that "Spec implies that the TypeInvariant is always TRUE"*)
(*is a THEOREM is saying that the behavior "Spec implies that the TypeInvariant is always TRUE"*)
(*will always be true for a system that meets this specification.*)
THEOREM Spec => []TypeInvariant 

========================
