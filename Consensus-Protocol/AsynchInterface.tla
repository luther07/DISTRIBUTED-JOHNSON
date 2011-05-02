-----MODULE AsynchInterface-----
EXTENDS Naturals
CONSTANT Data
VARIABLES val, rdy, ack
TypeInvariant == /\ val \in Data
                 /\ rdy \in {0,1}
                 /\ ack \in {0,1}
--------------------------------
(*Initial Predicate*)
Init == /\ val \in Data
        /\ rdy \in {0,1}
        /\ ack = rdy

(*Next-state sub-action, Send*)
Send == /\ rdy = ack
        /\ val' \in Data
        /\ rdy' = 1-rdy
        /\ UNCHANGED ack

(*Next-state sub-action, Rcv*)
Rcv == /\ rdy # ack
       /\ ack' = 1-ack
       /\ UNCHANGED <<val,rdy>>

(*Next-state Action, Next*)
Next == Send \/ Rcv

(*The full specification allows stuttering steps*)
Spec == Init /\ [][Next]_<<val,rdy,ack>>

--------------------------------
THEOREM Spec => []TypeInvariant

===============================
