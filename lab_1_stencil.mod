MODULE MainModule
    !Tools.
    PERS tooldata tPencil:=[TRUE,[[150.5,0,69.7],[0,0.707107,0,0.707107]],[1,[0,0,1],[1,0,0,0],0,0,0]];

    !Work objects.
    TASK PERS wobjdata wobjStencil:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[1076.52,-544.01,672],[0.705162,-0.000000635,-0.000000035,0.709046]]];

    !Positions.
    CONST robtarget pHome:=[[167.24,12.56,144.7],[0.00419992,0.705128,-0.709055,-0.00427597],[-1,-1,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];

    CONST robtarget pOutline0:=[[61.41,-1.04,0],[0.0041999,0.705128,-0.709055,-0.00427594],[-1,-1,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget pOutline1:=[[43.01,41.86,0],[0.00419969,0.705127,-0.709055,-0.0042758],[-1,-1,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget pOutline2:=[[0,60,0],[0.00420002,0.705127,-0.709055,-0.0042757],[-1,-1,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget pOutline3:=[[-0.000457089,180.00080437,0.000279638],[0.004200036,0.705127365,-0.709055341,-0.004275706],[-1,-1,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget pOutline4:=[[300.193526416,180.001721692,0.000517114],[0.004200015,0.705127365,-0.709055342,-0.004275713],[-1,-1,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget pOutline5:=[[329.24,167.69,0.00],[0.00420017,0.705127,-0.709055,-0.00427538],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline6:=[[340.80,142.09,0.01],[0.0042002,0.705127,-0.709056,-0.00427511],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline7:=[[340.02,-0.13,0.01],[0.00420044,0.705127,-0.709056,-0.00427511],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutlineUp:=[[61.41,-1.04,30.45],[0.00419957,0.705128,-0.709055,-0.00427573],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pSquare0:=[[22.13,78.70,0.00],[0.00420004,0.705128,-0.709055,-0.00427548],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSquare1:=[[22.57,159.43,0.00],[0.00419989,0.705127,-0.709055,-0.00427534],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSquare2:=[[99.46,159.01,0.01],[0.00420008,0.705127,-0.709056,-0.00427499],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSquare3:=[[99.03,80.74,0.01],[0.00420016,0.705127,-0.709056,-0.00427501],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pSquareUp:=[[22.13,78.70,30.04],[0.00419792,0.705127,-0.709056,-0.00427503],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pCircle0:=[[141.68,123.98,0.01],[0.00420062,0.705128,-0.709055,-0.00427476],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pCircle2:=[[219.36,123.55,0.01],[0.00420093,0.705128,-0.709055,-0.00427447],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pCircle1:=[[179.67,158.91,0.01],[0.00420051,0.705128,-0.709055,-0.00427453],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pCircle3:=[[179.93,82.81,0.01],[0.00420049,0.705128,-0.709055,-0.00427499],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pCircleUp:=[[141.68,123.98,29.01],[0.0042001,0.705128,-0.709055,-0.00427424],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pTriangle0:=[[279.76,99.88,0.01],[0.00420086,0.705128,-0.709055,-0.0042741],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pTriangle1:=[[318.94,20.84,0.01],[0.00420097,0.705128,-0.709055,-0.00427379],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pTriangle2:=[[241.16,21.26,0.02],[0.00420099,0.705128,-0.709055,-0.00427345],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pTriangleUp:=[[279.76,99.88,30.19],[0.00420074,0.705128,-0.709055,-0.00427392],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pComplex0:=[[220.06,41.06,0.01],[0.00420076,0.705128,-0.709055,-0.00427394],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pComplex1:=[[219.94,19.70,0.01],[0.00420077,0.705128,-0.709055,-0.00427395],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pComplex2:=[[101.08,20.35,0.01],[0.00420113,0.705128,-0.709055,-0.00427348],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pComplex3:=[[101.19,39.34,0.01],[0.00420092,0.705128,-0.709055,-0.00427351],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pComplex4:=[[120.43,59.47,0.01],[0.00420066,0.705128,-0.709055,-0.00427325],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pComplex5:=[[140.17,39.76,0.02],[0.00420072,0.705128,-0.709055,-0.00427306],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pComplex6:=[[160.00,59.84,0.02],[0.00420036,0.705128,-0.709055,-0.00427264],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pComplex7:=[[179.91,40.60,0.02],[0.00420056,0.705128,-0.709055,-0.00427236],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pComplex8:=[[200.77,58.80,0.02],[0.00420045,0.705127,-0.709055,-0.00427208],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC main()
        !Approach.
        MoveJ pHome, v200, z50, tPencil\WObj := wobjStencil;
        MoveL Offs(pOutline0, 0, 0, 50), v200, z10, tPencil\WObj := wobjStencil;

        !Outline tracing.
        MoveL pOutline0, v200, z0, tPencil\WObj := wobjStencil;
        MoveC pOutline1, pOutline2, v200, z0, tPencil\WObj := wobjStencil;
        MoveL pOutline3, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pOutline4, v200, z10, tPencil\WObj := wobjStencil;
        MoveC pOutline5, pOutline6, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pOutline7, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pOutline0, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pOutlineUp, v200, z10, tPencil\WObj := wobjStencil;

        !Square tracing.
        MoveJ pSquare0, v200, fine, tPencil\WObj := wobjStencil;
        MoveL pSquare1, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pSquare2, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pSquare3, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pSquare0, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pSquareUp, v200, z10, tPencil\WObj := wobjStencil;

        !Circle tracing.
        MoveJ pCircle0, v200, fine, tPencil\WObj := wobjStencil;
        MoveC pCircle1, pCircle2, v200, z10, tPencil\WObj := wobjStencil;
        MoveC pCircle3, pCircle0, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pCircleUp, v200, z10, tPencil\WObj := wobjStencil;

        !Triangle tracing.
        MoveJ pTriangle0, v200, fine, tPencil\WObj := wobjStencil;
        MoveL pTriangle1, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pTriangle2, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pTriangle0, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pTriangleUp, v200, z10, tPencil\WObj := wobjStencil;

        !Complex shape tracing.
        MoveJ pComplex0, v200, fine, tPencil\WObj := wobjStencil;
        MoveL pComplex1, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pComplex2, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pComplex3, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pComplex4, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pComplex5, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pComplex6, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pComplex7, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pComplex8, v200, z10, tPencil\WObj := wobjStencil;
        MoveL pComplex0, v200, z10, tPencil\WObj := wobjStencil;

        !Return home.
        MoveJ pHome, v200, z50, tPencil\WObj := wobjStencil;
    ENDPROC
ENDMODULE