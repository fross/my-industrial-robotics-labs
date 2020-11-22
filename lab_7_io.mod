MODULE MainModule
    !Tools.
    TASK PERS tooldata tGripper:=[TRUE,[[183.281,5.73935,130.061],[0.697666,-0.0100603,0.716351,0.00148259]],[1,[2,4.75,50.3],[1,0,0,0],0,0,0]];

    !Loads.
    TASK PERS loaddata loadDice:=[0.20,[12,0,12],[1,0,0,0],0,0,0];

    !Positions.
    CONST jointtarget pZero:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pAxis5:=[[717.08,5.75,694.39],[0.324982,-0.00846964,0.945665,0.00564228],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHome:=[[511.97,-50.07,123.77],[0.17477,-0.215559,-0.959469,-0.0490898],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceStart:=[[522.94,-175.47,-109.29],[0.182693,-0.382548,-0.902667,-0.0739778],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceEnd:=[[601.83,5.85,-110.29],[0.182694,-0.382548,-0.902667,-0.0739766],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Speeds.
    CONST speeddata vFast:=V500;    !Speed of joint movements (500mm/s)
    CONST speeddata vSlow:=V50;     !Speed of linear movements (50mm/s)

    !Constants.
    CONST num nGripperDelay:=0.75;  !Delay, in seconds, between checks when opening/closing the gripper
    CONST num nLinearApproach:=45;  !Distance of the linear movement when picking up/putting down a dice

    PROC main()
        VelSet 100, 500;
        AccSet 50, 50;

        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper;

        !Wait for button press from operator.
        rTurnOnLightIndicator;
        rWaitButtonPress;
        rTurnOffLightIndicator;

        !Break axis 5.
        MoveJ pAxis5, vFast, z1, tGripper;

        !Move home.
        MoveJ pHome, vFast, z1, tGripper;

        !Move dice from start to end position.
        rPickUp(pDiceStart);
        rPutDown(pDiceEnd);

        !Return to zero.
        MoveJ pHome, vFast, z1, tGripper;
        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper;

        rTurnOnLightIndicator;
    ENDPROC


    PROC rTurnOnLightIndicator()
        SET DO_16;
    ENDPROC


    PROC rTurnOffLightIndicator()
        Reset DO_16;
    ENDPROC


    PROC rWaitButtonPress()
        WaitUntil DI_14=1;
    ENDPROC


    PROC rPickUp(robtarget pSrc)
        MoveJ Offs(pSrc, 0, 0, nLinearApproach), vFast, fine, tGripper;
        rOpenGripper;
        MoveL pSrc, vSlow, fine, tGripper;
        rCloseGripper;
        GripLoad loadDice;
        MoveL Offs(pSrc, 0, 0, nLinearApproach), vSlow, fine, tGripper;
    ENDPROC


    PROC rPutDown(robtarget pDest)
        MoveJ Offs(pDest, 0, 0, nLinearApproach), vFast, fine, tGripper;
        MoveL pDest, vSlow, fine, tGripper;
        rOpenGripper;
        GripLoad load0;
        MoveL Offs(pDest, 0, 0, nLinearApproach), vSlow, fine, tGripper;
    ENDPROC


    PROC rOpenGripper()
        Reset DO_2;
        SET DO_1;
        WaitUntil(DI_1=1 AND DI_2=0);
        WaitTime nGripperDelay;
        WaitUntil(DI_1=1 AND DI_2=0);
    ENDPROC


    PROC rCloseGripper()
        Reset DO_1;
        SET DO_2;
        WaitUntil(DI_1=0 AND DI_2=1);
        WaitTime nGripperDelay;
        WaitUntil(DI_1=0 AND DI_2=1);
    ENDPROC
ENDMODULE