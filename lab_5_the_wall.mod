MODULE MainModule
    !Tools.
    PERS tooldata tGripper:=[TRUE,[[112.288,4.40752,102.276],[0.0012407,-0.593629,-0.00648292,-0.804711]],[1,[1.99,4.75,50.33],[1,0,0,0],0,0,0]];

    !Work objects.
    TASK PERS wobjdata wobjSheet:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[694.959,-374.145,-48.0878],[0.707069,1.2399E-06,-5.17063E-06,0.707144]]];

    !Loads.
    TASK PERS loaddata loadDice:=[0.20,[12,0,12],[1,0,0,0],0,0,0];

    !General positions.
    CONST jointtarget pZero:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pAxis5:=[[378.56,46.28,793.74],[0.354451,0.614159,-0.60649,0.35964],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Supply area positions.
    CONST robtarget pDiceRed1:=[[58.73,208.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceWhite1:=[[58.73,158.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceWhite2:=[[108.73,158.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceWhite3:=[[158.73,158.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceBlack1:=[[58.73,108.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceBlack2:=[[108.73,108.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceBlack3:=[[158.73,108.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceGreen1:=[[58.73,58.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceGreen2:=[[108.73,58.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pDiceGreen3:=[[158.73,58.45,50.99],[0.0173698,-0.374949,0.926872,0.00432713],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Wall positions.
    CONST robtarget pLevel1Pos1:=[[218.68,138.45,50.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel1Pos2:=[[268.68,138.45,50.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel1Pos3:=[[318.68,138.45,50.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel1Pos4:=[[368.68,138.45,50.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel2Pos1:=[[243.68,138.95,87.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel2Pos2:=[[293.68,138.95,87.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel2Pos3:=[[343.68,138.95,87.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel3Pos1:=[[268.68,138.95,124.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel3Pos2:=[[318.68,138.95,124.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pLevel4Pos1:=[[293.68,138.95,161.99],[0.0173286,-0.375089,0.926816,0.0043038],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Speeds.
    CONST speeddata vFast:=V200;    !Speed of joint movements (200mm/s)
    CONST speeddata vSlow:=V50;     !Speed of linear movements (50mm/s)

    !Constants.
    CONST num nGripperDelay:=0.75;  !Delay, in seconds, between checks when opening/closing the gripper
    CONST num nLinearApproach:=45;  !Distance of the linear movement when picking up/putting down a dice

    !Variables.
    VAR num nLevels;                    !Number of levels to assemble for the wall
    VAR num nAssemblyDurationInSeconds; !Duration of the assembly
    VAR bool bDisassemble;              !TRUE if the wall must be disassembled at the end, FALSE otherwise

    PROC main()
        VelSet 100, 2000;
        AccSet 50, 50;

        !Initialization.
        TPErase;
        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper\WObj := wobjSheet;

        !Ask the number of levels to assemble (exit if not valid).
        AskNoLevelsToAssembleOrExit;

        !Break axis 5.
        MoveJ pAxis5, vFast, fine, tGripper\WObj := wobjSheet;

        !Assemble the wall.
        AssembleLevels;
        DisplayAssemblyDuration;

        !Disassemble the wall if requested by the operator.
        AskConfirmationToDisassemble;
        DisassembleIfRequired;

        !Return to zero.
        MoveAbsJ pZero\NoEOffs, vFast, fine, tGripper\WObj := wobjSheet;
    ENDPROC


    PROC AskNoLevelsToAssembleOrExit()
        VAR num nChoice;

        TPReadFK nChoice, "Number of levels to assemble?", "1", "2", "3", "4", "Cancel";
        IF (nChoice=5)
            EXIT;

        nLevels := nChoice;
    ENDPROC


    PROC AssembleLevels()
        VAR clock cClock;

        ClkReset cClock;
        ClkStart cClock;

        IF (nLevels>=1)
            AssembleLevel1;

        IF (nLevels>=2)
            AssembleLevel2;

        IF (nLevels>=3)
            AssembleLevel3;

        IF (nLevels>=4)
            AssembleLevel4;

        ClkStop cClock;
        nAssemblyDurationInSeconds := ClkRead(cClock);
    ENDPROC


    PROC AssembleLevel1()
        rMove pDiceRed1, pLevel1Pos4;
        rMove pDiceWhite3, pLevel1Pos3;
        rMove pDiceWhite2, pLevel1Pos2;
        rMove pDiceWhite1, pLevel1Pos1;
    ENDPROC


    PROC AssembleLevel2()
        rMove pDiceBlack3, pLevel2Pos3;
        rMove pDiceBlack2, pLevel2Pos2;
        rMove pDiceBlack1, pLevel2Pos1;
    ENDPROC


    PROC AssembleLevel3()
        rMove pDiceGreen3, pLevel3Pos2;
        rMove pDiceGreen2, pLevel3Pos1;
    ENDPROC


    PROC AssembleLevel4()
        rMove pDiceGreen1, pLevel4Pos1;
    ENDPROC


    PROC DisplayAssemblyDuration()
        TPWrite "Assembly completed";
        TPWrite "  - level(s) assembled: " \Num := nLevels;
        TPWrite "  - duration: " + ValToStr(nAssemblyDurationInSeconds) + " seconds";
        TPWrite "  - joint movement speed: " + ValToStr(vFast.v_tcp) +" mm/s";
        TPWrite "  - linear movement speed: " + ValToStr(vSlow.v_tcp) +" mm/s\0D\0A";
    ENDPROC


    PROC AskConfirmationToDisassemble()
        VAR num nChoice;
        TPReadFK nChoice, "Disassemble the wall?", "Disassemble", "Return to initial position", "", "", "";

        bDisassemble := (nChoice=1);
    ENDPROC


    PROC DisassembleIfRequired()
        IF bDisassemble
            DisassembleLevels;
    ENDPROC


    PROC DisassembleLevels()
        IF nLevels>=4
            DisassembleLevel4;

        IF nLevels>=3
            DisassembleLevel3;

        IF nLevels>=2
            DisassembleLevel2;

        IF nLevels>=1
            DisassembleLevel1;
    ENDPROC


    PROC DisassembleLevel4()
        rMove pLevel4Pos1, pDiceGreen1;
    ENDPROC


    PROC DisassembleLevel3()
        rMove pLevel3Pos1, pDiceGreen2;
        rMove pLevel3Pos2, pDiceGreen3;
    ENDPROC


    PROC DisassembleLevel2()
        rMove pLevel2Pos1, pDiceBlack1;
        rMove pLevel2Pos2, pDiceBlack2;
        rMove pLevel2Pos3, pDiceBlack3;
    ENDPROC


    PROC DisassembleLevel1()
        rMove pLevel1Pos1, pDiceWhite1;
        rMove pLevel1Pos2, pDiceWhite2;
        rMove pLevel1Pos3, pDiceWhite3;
        rMove pLevel1Pos4, pDiceRed1;
    ENDPROC


    !**************************************************************************
    ! Provided by instructor.
    !**************************************************************************
    PROC rMove(robtarget pSrc, robtarget pDest)
        rPickUp(pSrc);
        rPutDown(pDest);
    ENDPROC


    !**************************************************************************
    ! Provided by instructor.
    !**************************************************************************
    PROC rPickUp(robtarget pSrc)
        MoveJ pSrc, vFast, z1, tGripper\WObj := wobjSheet;
        rOpenGripper;

        MoveL Offs(pSrc, 0, 0, -nLinearApproach), vSlow, fine, tGripper\WObj := wobjSheet;

        WaitTime nGripperDelay;
        rCloseGripper;
        GripLoad loadDice;

        MoveL Offs(pSrc, 0, 0, nLinearApproach), vSlow, fine, tGripper\WObj := wobjSheet;
    ENDPROC


    !**************************************************************************
    ! Provided by instructor.
    !**************************************************************************
    PROC rPutDown(robtarget pDest)
        MoveJ pDest, vFast, z1, tGripper\WObj := wobjSheet;

        MoveL Offs(pDest, 0, 0, -nLinearApproach), vSlow, fine, tGripper\WObj := wobjSheet;

        rOpenGripper;
        WaitTime nGripperDelay;
        GripLoad load0;

        MoveL Offs(pDest, 0, 0, nLinearApproach), vSlow, fine, tGripper\WObj := wobjSheet;
    ENDPROC


    !**************************************************************************
    ! Provided by instructor.
    !**************************************************************************
    PROC rOpenGripper()
        Reset DO_2;
        SET DO_1;
        WaitUntil(DI_1=1 AND DI_2=0);
        WaitTime nGripperDelay;
        WaitUntil(DI_1=1 AND DI_2=0);
    ENDPROC


    !**************************************************************************
    ! Provided by instructor.
    !**************************************************************************
    PROC rCloseGripper()
        Reset DO_1;
        SET DO_2;
        WaitUntil(DI_1=0 AND DI_2=1);
        WaitTime nGripperDelay;
        WaitUntil(DI_1=0 AND DI_2=1);
    ENDPROC
ENDMODULE