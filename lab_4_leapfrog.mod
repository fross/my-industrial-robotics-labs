MODULE MainModule
    !Tools.
    TASK PERS tooldata tFork:=[TRUE,[[121.443,-0.165138,51.9933],[1,0,0,0]],[1,[0,0,1],[1,0,0,0],0,0,0]];

    !Work objects.
    TASK PERS wobjdata wobjSupplyArea:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[1056,-727.087,672],[0.707107,0,0,0.707107]]];

    !Positions.
    CONST robtarget pReference:=[[63.17,206.54,41.51],[0.497543,0.502918,0.502105,-0.497409],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Constants.
    CONST num nOffsetX:=63.5;
    CONST num nOffsetY:=-150;

    !Variables.
    VAR robtarget pBlueStart;
    VAR robtarget pRedStart;

    VAR robtarget pSpot1;
    VAR robtarget pSpot2;
    VAR robtarget pSpot3;
    VAR robtarget pSpot4;
    VAR robtarget pSpot5;
    VAR robtarget pSpot6;

    PROC main()
        !Limit velocity to 200mm/s, and acceleration to 50% (ramp-up at 50%).
        VelSet 100, 200;
        AccSet 50, 50;

        !Initialize positions from the reference position.
        pBlueStart := Offs(pReference,        0, 0, 0);
        pRedStart  := Offs(pReference, nOffsetX, 0, 0);

        pSpot1 := Offs(pBlueStart,  9.5                  , nOffsetY, 0);
        pSpot2 := Offs(pBlueStart, (9.5 +      nOffsetX ), nOffsetY, 0);
        pSpot3 := Offs(pBlueStart, (9.5 + (2 * nOffsetX)), nOffsetY, 0);
        pSpot4 := Offs(pBlueStart, (9.5 + (3 * nOffsetX)), nOffsetY, 0);
        pSpot5 := Offs(pBlueStart, (9.5 + (4 * nOffsetX)), nOffsetY, 0);
        pSpot6 := Offs(pBlueStart, (9.5 + (5 * nOffsetX)), nOffsetY, 0);

        !Break axis 5.
        MoveAbsJ [[0, 0, 0, 0, 0, 0], [9E+09, 9E+09, 9E+09, 9E+09, 9E+09, 9E+09]]\NoEOffs, v200, fine, tool0;
        MoveJ [[726.92, 20.90, 815.84], [0.668361, 0.230854, 0.230854, -0.668361], [0, 0, 0, 0], [9E+09, 9E+09, 9E+09, 9E+09, 9E+09, 9E+09]], v200, z50, tFork\WObj := wobjSupplyArea;

        !Leapfrog forward.
        rMove pBlueStart, wobjSupplyArea, pSpot1, wobjSupplyArea;
        rMove pRedStart, wobjSupplyArea, pSpot2, wobjSupplyArea;
        rMove pSpot1, wobjSupplyArea, pSpot3, wobjSupplyArea;
        rMove pSpot2, wobjSupplyArea, pSpot4, wobjSupplyArea;
        rMove pSpot3, wobjSupplyArea, pSpot5, wobjSupplyArea;
        rMove pSpot4, wobjSupplyArea, pSpot6, wobjSupplyArea;

        !Leapfrog backward.
        rMove pSpot6, wobjSupplyArea, pSpot4, wobjSupplyArea;
        rMove pSpot5, wobjSupplyArea, pSpot3, wobjSupplyArea;
        rMove pSpot4, wobjSupplyArea, pSpot2, wobjSupplyArea;
        rMove pSpot3, wobjSupplyArea, pSpot1, wobjSupplyArea;
        rMove pSpot2, wobjSupplyArea, pRedStart, wobjSupplyArea;
        rMove pSpot1, wobjSupplyArea, pBlueStart, wobjSupplyArea;

        !Return to zero.
        MoveAbsJ [[0, 0, 0, 0, 0, 0], [9E+09, 9E+09, 9E+09, 9E+09, 9E+09, 9E+09]]\NoEOffs, v200, fine, tool0;
    ENDPROC


    !**************************************************************************
    ! Provided by instructor.
    !**************************************************************************
    PROC rMove(robtarget srcPos, PERS wobjdata wobjSrc, robtarget destPos, PERS wobjdata wobjDest)
        MoveJ Offs(srcPos, 0, 100, 100), v200, z100, tFork\WObj := wobjSrc;
        MoveJ Offs(srcPos, 0, 100, 0), v200, z100, tFork\WObj := wobjSrc;
        MoveL srcPos, v50, fine, tFork\WObj := wobjSrc;
        Set DO_15;
        WaitTime 0.5;
        MoveL Offs(srcPos, 0, 0, 100), v50, z100, tFork\WObj := wobjSrc;

        MoveJ Offs(destPos, 0, 0, 100), v200, z100, tFork\WObj := wobjDest;
        MoveL destPos, v50, fine, tFork\WObj := wobjDest;
        ReSet DO_15;
        WaitTime 0.5;
        MoveL Offs(destPos, 0, 100, 0), v50, z100, tFork\WObj := wobjDest;
        MoveJ Offs(destPos, 0, 100, 100), v200, z100, tFork\WObj := wobjDest;
    ENDPROC
ENDMODULE