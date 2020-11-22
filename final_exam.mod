MODULE MainModule
    !Tools
    TASK PERS tooldata tGripper:=[TRUE,[[180.372,8.32881,129.811],[1,0,0,0]],[1,[2,4.75,50.3],[1,0,0,0],0,0,0]];

    !Work objects.
    TASK PERS wobjdata wobjSheet:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[633.692,-135.553,-106.198],[0.701453,0.000246246,0.00215425,0.712712]]];

    !Loads.
    TASK PERS loaddata loadPencil:=[0.40,[12,0,12],[1,0,0,0],0,0,0];
    TASK PERS loaddata loadDice:=[0.20,[12,0,12],[1,0,0,0],0,0,0];

    !Positions.
    CONST jointtarget pZero:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pAxis5:=[[140.38,-81.27,815.50],[0.641861,0.289257,0.28294,-0.651375],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pHome:=[[145.62,132.43,95.80],[0.413755,0.575334,0.567059,-0.419814],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p1:=[[39.28,20.06,-0.50],[0.413462,0.576909,0.566523,-0.41866],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p2:=[[238.68,17.24,-4.50],[0.242659,0.735364,0.344613,-0.530657],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Speeds.
    CONST speeddata vFast:=V500;    !Speed of joint movements (500mm/s)
    CONST speeddata vSlow:=V50;     !Speed of linear movements (50mm/s)

    !Interrupts.
    VAR intnum iDi15;           !On selector left
    VAR intnum iDi16;           !On selector right
    VAR robtarget pInterrupt;

    !Constants.
    CONST num nGridUnitMm:=20;      !Size of a unit on the grid, in mm
    CONST num nTracingZ:=10;        !Height used for tracing, in mm
    CONST num nGripperDelay:=0.75;  !Delay, in seconds, between checks when opening/closing the gripper
    CONST num nLinearApproach:=45;  !Distance of the linear movement when picking up/putting down an object using the gripper

    !Variables.
    VAR robtarget pPencil;  !Position of the pencil

    PROC main()
        VelSet 100, 500;
        AccSet 50, 50;

        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper\WObj := wobjSheet;

        !Initializaton.
        TPErase;
        rTurnOffLightIndicator;

        !Trace shape using pencil.
        rTraceShape;

        !Move dices.
        rMoveDices;

        !Return to zero.
        MoveJ pHome, vFast, z1, tGripper\WObj := wobjSheet;
        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper\WObj := wobjSheet;
    ENDPROC


    PROC rTraceShape()
        VAR num nChoice;
        VAR clock cClock;

        !Ask operator the shape to trace.
        TPReadFK nChoice, "Shape to trace?", "Square", "Triangle", "", "", "";

        !Move home.
        MoveJ pAxis5, vFast, z1, tGripper\WObj := wobjSheet;
        MoveJ pHome, vFast, z1, tGripper\WObj := wobjSheet;

        !Pick up the pencil.
        pPencil := Offs(p1, (14 * nGridUnitMm), (6.5 * nGridUnitMm), 23.7);
        rPickUp pPencil, loadPencil;

        !Enable interrupts of selector.
        rEnableInterruptsOfSelector;

        !Trace the shape asked by the operator.
        ClkReset cClock;
        ClkStart cClock;

        IF nChoice=1 THEN
            rTraceSquare;
        ELSEIF nChoice=2 THEN
            rTraceTriangle;
        ENDIF

        ClkStop cClock;
        TPWrite "Duration tracing shape: " + ValToStr(ClkRead(cClock)) + " seconds";

        !Disable interrupts.
        rDisableInterrupts;

        !Return the pencil to its initial position.
        rPutDown pPencil;
    ENDPROC


    PROC rTraceSquare()
        VAR robtarget pSquareLowerLeft;
        VAR robtarget pSquareLowerRight;
        VAR robtarget pSquareUpperLeft;
        VAR robtarget pSquareUpperRight;

        !Initialize positions.
        pSquareLowerLeft  := Offs(p1,                 0,                 0, nTracingZ);
        pSquareLowerRight := Offs(p1, (8 * nGridUnitMm),                 0, nTracingZ);
        pSquareUpperLeft  := Offs(p1,                 0, (8 * nGridUnitMm), nTracingZ);
        pSquareUpperRight := Offs(p1, (8 * nGridUnitMm), (8 * nGridUnitMm), nTracingZ);

        !Move to start of shape.
        MoveJ pSquareLowerRight, vFast, fine, tGripper\WObj := wobjSheet;

        !Trace.
        MoveL pSquareLowerLeft, vFast, fine, tGripper\WObj := wobjSheet;
        MoveL pSquareUpperLeft, vFast, fine, tGripper\WObj := wobjSheet;
        MoveL pSquareUpperRight, vFast, fine, tGripper\WObj := wobjSheet;
        MoveL pSquareLowerRight, vFast, fine, tGripper\WObj := wobjSheet;
    ENDPROC


    PROC rTraceTriangle()
        VAR robtarget pTriangleLowerLeft;
        VAR robtarget pTriangleLowerRight;
        VAR robtarget pTriangleTip;

        !Initialize positions.
        pTriangleLowerLeft  := Offs(p1,                 0,                 0, nTracingZ);
        pTriangleLowerRight := Offs(p1, (8 * nGridUnitMm),                 0, nTracingZ);
        pTriangleTip        := Offs(p1, (4 * nGridUnitMm), (4 * nGridUnitMm), nTracingZ);

        !Move to start of shape.
        MoveJ pTriangleLowerRight, vFast, fine, tGripper\WObj := wobjSheet;

        !Trace.
        MoveL pTriangleLowerLeft, vFast, fine, tGripper\WObj := wobjSheet;
        MoveL pTriangleTip, vFast, fine, tGripper\WObj := wobjSheet;
        MoveL pTriangleLowerRight, vFast, fine, tGripper\WObj := wobjSheet;
    ENDPROC


    PROC rEnableInterruptsOfSelector()
        !On selector left.
        CONNECT iDi15 WITH tPauseTracingAndReturnToZero;
        ISignalDI DI_15, 1, iDi15;

        !On selector right.
        CONNECT iDi16 WITH tResumeTracing;
        ISignalDI DI_16, 1, iDi16;
    ENDPROC


    TRAP tPauseTracingAndReturnToZero
        !Stop and save current position.
        StopMove;
        StorePath;
        pInterrupt := CRobT();

        !Pause above the support of the pencil for 2 secs.
        MoveJ Offs(pPencil, 0, 0, 25), vFast, fine, tGripper\WObj := wobjSheet;
        WaitTime 2;

        !Move to zero.
        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper\WObj := wobjSheet;

        !Turn on light indicator.
        rTurnOnLightIndicator;
    ENDTRAP


    TRAP tResumeTracing
        !Turn off light indicator.
        rTurnOffLightIndicator;

        !Move back to position before interrupt.
        MoveJ pAxis5, vFast, z1, tGripper\WObj := wobjSheet;
        MoveJ pInterrupt, vFast, fine, tGripper\WObj := wobjSheet;

        !Resume tracing.
        RestoPath;
        StartMove;
    ENDTRAP


    PROC rDisableInterrupts()
        IDelete iDi15;
        IDelete iDi16;
    ENDPROC


    PROC rMoveDices()
        VAR robtarget pDice1;
        VAR robtarget pDice2;
        VAR robtarget pDice3;

        VAR robtarget pDest1;
        VAR robtarget pDest2;
        VAR robtarget pDest3;

        VAR num nDicesToMove;
        VAR clock cClock;

        !Initialize positions.
        pDice1 := p2;
        pDice2 := Offs(p2, (3 * nGridUnitMm), 0, 0);
        pDice3 := Offs(p2, (6 * nGridUnitMm), 0, 0);

        pDest1 := Offs(p2, (   -6 * nGridUnitMm),     nGridUnitMm, 0);
        pDest2 := Offs(p2, (-7.75 * nGridUnitMm), 6 * nGridUnitMm, 0);
        pDest3 := Offs(p2, (-4.25 * nGridUnitMm), 6 * nGridUnitMm, 0);

        !Ask operator the number of dices to move.
        TPReadFK nDicesToMove, "Number of dices to move?", "1", "2", "3", "", "";

        !Move the dices.
        ClkReset cClock;
        ClkStart cClock;

        IF nDicesToMove>=1 THEN
            rPickUp pDice1, loadDice;
            rPutDown pDest1;
        ENDIF

        IF nDicesToMove>=2 THEN
            rPickUp pDice2, loadDice;
            rPutDown pDest2;
        ENDIF

        IF nDicesToMove>=3 THEN
            rPickUp pDice3, loadDice;
            rPutDown pDest3;
        ENDIF

        ClkStop cClock;
        TPWrite "Duration moving dice(s): " + ValToStr(ClkRead(cClock)) + " seconds";
    ENDPROC


    PROC rPickUp(robtarget pSrc, PERS loaddata lLoad)
        MoveJ Offs(pSrc, 0, 0, nLinearApproach), vFast, fine, tGripper\WObj := wobjSheet;
        rOpenGripper;
        MoveL pSrc, vSlow, fine, tGripper\WObj := wobjSheet;
        rCloseGripper;
        GripLoad lLoad;
        MoveL Offs(pSrc, 0, 0, nLinearApproach), vSlow, fine, tGripper\WObj := wobjSheet;
    ENDPROC


    PROC rPutDown(robtarget pDest)
        MoveJ Offs(pDest, 0, 0, nLinearApproach), vFast, fine, tGripper\WObj := wobjSheet;
        MoveL pDest, vSlow, fine, tGripper\WObj := wobjSheet;
        rOpenGripper;
        GripLoad load0;
        MoveL Offs(pDest, 0, 0, nLinearApproach), vSlow, fine, tGripper\WObj := wobjSheet;
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


    PROC rTurnOnLightIndicator()
        SET DO_16;
    ENDPROC


    PROC rTurnOffLightIndicator()
        Reset DO_16;
    ENDPROC
ENDMODULE