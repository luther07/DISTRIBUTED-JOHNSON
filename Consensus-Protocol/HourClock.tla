------MODULE HourClock---------
(*This module specifies a digital clock that displays the current hour. It ignores real*)
(* time, not specifying when the display can change.*)
EXTENDS Naturals
VARIABLE hr \*Variable hr represents the display.
HCini == hr \in (1..12) \*Initially, hr can have any value from 1 through 12.
HCnxt == 
(*The value of hr cycles from 1 through 12.*)
hr' = IF hr # 12 THEN hr + 1 ELSE 1
HC == HCini /\ [][HCnxt]_hr
(*The complete spec. It permits the clock to stop.*)
-------------------------------
THEOREM HC => []HCini \*Type-correctness of the spec.
===============================