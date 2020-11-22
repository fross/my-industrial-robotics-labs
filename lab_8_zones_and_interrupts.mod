MODULE MainModule
    !Tools.
    TASK PERS tooldata tGripper:=[TRUE,[[183.281,5.73935,130.061],[0.697666,-0.0100603,0.716351,0.00148259]],[1,[2,4.75,50.3],[1,0,0,0],0,0,0]];

    !Work objects.
    TASK PERS wobjdata wobjSheet:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[711.902,-105.655,-88.3118],[0.702277,-0.00257121,0.00119073,0.711898]]];

    !Loads.
    TASK PERS loaddata loadDice:=[0.20,[12,0,12],[1,0,0,0],0,0,0];

    !Positions.
    CONST jointtarget pZero:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pAxis5:=[[107.07,-8.72,794.50],[0.247166,0.663054,0.664859,-0.239228],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHome:=[[215.68,252.20,212.14],[0.123517,-0.695646,-0.693316,-0.141891],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPickUp:=[[101.21,93.55,-23.30],[0.0626359,-0.895784,-0.407068,-0.167164],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDecontamination:=[[320.54,132.91,-11.76],[0.0626561,-0.895784,-0.407056,-0.167184],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Zones.
    CONST pos pDecontaminationCorner1:=[596.0,191.8,-112.2];
    CONST pos pDecontaminationCorner2:=[548.4,236.0,388.2];
    VAR shapedata zDecontamination;
    VAR wztemporary wzDecontamination;

    !Speeds.
    CONST speeddata vFast:=V500;    !Speed of joint movements (500mm/s)
    CONST speeddata vSlow:=V50;     !Speed of linear movements (50mm/s)

    !Interrupts.
    VAR intnum iButtonPressed;

    !Constants.
    CONST num nGripperDelay:=0.75;          !Delay, in seconds, between checks when opening/closing the gripper
    CONST num nLinearApproach:=45;          !Distance of the linear movement when picking up/putting down a dice
    CONST num nDecontaminationDuration:=5;  !Duration of a decontamination

    PROC main()
        VelSet 100, 500;
        AccSet 100, 100;

        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper\WObj := wobjSheet;

        !Initialize decontamination zone and interrupts.
        rInitializeDecontaminationZone;
        rInitializeInterrupts;

        !Move home.
        MoveJ pAxis5, vFast, z50, tGripper\WObj := wobjSheet;
        MoveJ pHome, vFast, z50, tGripper\WObj := wobjSheet;

        !Decontamination cycle.
        WHILE (DI_15=0) DO
            rPickUp(pPickUp);
            rDecontaminate(pDecontamination);
            rPutDown(pPickUp);
        ENDWHILE

        !Terminate interrupts.
        rTerminateInterrupts;

        !Return to zero.
        MoveJ pHome, vFast, z50, tGripper\WObj := wobjSheet;
        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper\WObj := wobjSheet;
    ENDPROC


    PROC rInitializeDecontaminationZone()
        WZBoxDef \Inside, zDecontamination, pDecontaminationCorner1, pDecontaminationCorner2;
        WZDOSet \Temp, wzDecontamination\inside, zDecontamination, DO_16, 1; !Turn on light indicator.
    ENDPROC


    PROC rInitializeInterrupts()
        CONNECT iButtonPressed WITH tWaitAtHomeUntilConfirmation;
        ISignalDI DI_14, 1, iButtonPressed;
    ENDPROC


    PROC rPickUp(robtarget pSrc)
        MoveJ Offs(pSrc, 0, 0, nLinearApproach), vFast, fine, tGripper\WObj := wobjSheet;

        IDisable;
        rOpenGripper;
        MoveL pSrc, vSlow, fine, tGripper\WObj := wobjSheet;
        rCloseGripper;
        GripLoad loadDice;
        MoveL Offs(pSrc, 0, 0, Abs(pSrc.trans.z - pDecontamination.trans.z)), vSlow, fine, tGripper\WObj := wobjSheet;
        IEnable;
    ENDPROC


    PROC rDecontaminate(robtarget pDecontamination)
        MoveJ pDecontamination, vFast, fine, tGripper\WObj := wobjSheet;

        IDisable;
        WaitTime nDecontaminationDuration;
        IEnable;
    ENDPROC


    PROC rPutDown(robtarget pDest)
        MoveJ Offs(pDest, 0, 0, Abs(pDest.trans.z - pDecontamination.trans.z)), vFast, fine, tGripper\WObj := wobjSheet;

        IDisable;
        MoveL pDest, vSlow, fine, tGripper\WObj := wobjSheet;
        rOpenGripper;
        GripLoad load0;
        MoveL Offs(pDest, 0, 0, nLinearApproach), vSlow, fine, tGripper\WObj := wobjSheet;
        IEnable;
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


    TRAP tWaitAtHomeUntilConfirmation
        VAR robtarget pCurrent;
        VAR num nChoice;

        !Stop and save current position.
        StopMove;
        StorePath;
        pCurrent := CRobT();

        !Move home.
        MoveJ pHome, vFast, fine, tGripper\WObj := wobjSheet;

        !Resume on confirmation from operator.
        TPReadFK nChoice, "Continue?", "Continue", "", "", "", "";
        IF nChoice=1 THEN
            MoveJ pCurrent, vFast, fine, tGripper\WObj := wobjSheet;
            RestoPath;
            StartMove;
        ENDIF
    ENDTRAP


    PROC rTerminateInterrupts()
        IDelete iButtonPressed;
    ENDPROC
ENDMODULE