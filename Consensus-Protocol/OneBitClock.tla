---------------------------- MODULE OneBitClock ----------------------------
VARIABLE b
Init1 == (b=0) \/ (b=1)
Next1 == \/ /\ b = 0
            /\ b' = 0
         \/ /\ b = 1
            /\ b' = 0
               
=============================================================================
\* Modification History
\* Last modified Thu Apr 14 13:57:10 CDT 2011 by mjohns07
\* Created Wed Apr 13 13:34:03 CDT 2011 by mjohns07
