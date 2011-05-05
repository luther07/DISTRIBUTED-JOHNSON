----------MODULE ConsensusStub----------

(*This is a specification for a consensus protocol*)
\********************************************************
\*Assumption: there are four processes that communicate by
\*sending messages to eachother.
\*********************************************************

EXTENDS Naturals                                  \*Use these built-in modules
CONSTANT Proposal                                 \*Constant referring to the set of possible proposal values
VARIABLES in1, in2, in3, out1, out2, out3, output \*variable names for in and out channels

(*Defining channels to send on*)
OutChan1 == INSTANCE Channel WITH Data <- Proposal, chan <- out1
OutChan2 == INSTANCE Channel WITH Data <- Proposal, chan <- out2
OutChan3 == INSTANCE Channel WITH Data <- Proposal, chan <- out3

(*Defining channels to receive on*)
InChan1 == INSTANCE Channel WITH Data <- Proposal, chan <-in1
InChan2 == INSTANCE Channel WITH Data <- Proposal, chan <-in2
InChan3 == INSTANCE Channel WITH Data <- Proposal, chan <-in3

(*Define the initial predicate, refering to the conjunction of initial predicates in module Channel*)
Init == /\ OutChan1!Init
        /\ OutChan2!Init
        /\ OutChan3!Init
        /\ InChan1!Init
        /\ InChan2!Init
        /\ InChan3!Init
        
(*We define a type invariant, referring to the conjunction of type invariants in module Channel*)
TypeInvariant == /\ InChan1!TypeInvariant
                 /\ InChan2!TypeInvariant
                 /\ InChan3!TypeInvariant
                 /\ OutChan1!TypeInvariant
                 /\ OutChan2!TypeInvariant
                 /\ OutChan3!TypeInvariant

(*We define an action, SSend(p), which sends my proposed state value on the out channels*)
SSend(p) == /\ OutChan1!Send(p)
            /\ OutChan2!Send(p)
            /\ OutChan3!Send(p)

(*We define an action, RRcv(), which receives proposed state values on the in channels*)
RRcv == /\ InChan1!Rcv
        /\ InChan2!Rcv
        /\ InChan3!Rcv

(*We define the four possible ways to reach 3/4 consensus and the output' value which is our decision*)
Decide(p)== \/ /\ in1.val = in2.val
               /\ in2.val = in3.val
               /\ output' = in1.val
            \/ /\ in1.val = in2.val
               /\ in2.val = p
               /\ output' = p
            \/ /\ in2.val = in3.val
               /\ in3.val = p
               /\ output' = p
            \/ /\ in3.val = in1.val
               /\ in1.val = p
               /\ output' = p

(*We define the step granularity. A Next step is a step that changes the state of valiables.
 *This Next step formula says that either we will send our proposed value or receive
 *a proposed value.*)
Next == \/ \E p \in Proposal : SSend(p)
        \/ RRcv
        \/ \E p \in Proposal : Decide(p)
        
(*We define the specification formula, "Spec". This is the main point of the module. This formula says that
 *in order for a behavior to satisfy this module's specification, the initial predicate "Init" must be TRUE or satisfied
 *and the formula "Next" must be TRUE or satisfied at all times, with the exception of allowing stutter steps where the
 *variables in1, in2, in3, out1, out2, and out3 are unchanges.*)
Spec == Init /\ [][Next]_<<in1, in2, in3, out1, out2, out3, output>>
----------------------------------------
THEOREM Spec => []TypeInvariant
========================================
