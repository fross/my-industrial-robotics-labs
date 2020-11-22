MODULE MainModule
    !Tools.
    PERS tooldata tPencil:=[TRUE,[[150.5,0,69.7],[0,0.707106781,0,0.707106781]],[1,[0,0,1],[1,0,0,0],0,0,0]];

    !Work objects.
    TASK PERS wobjdata wobjSheet:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[1076.52,-544.01,672],[0.705162,-0.000000635,-0.000000035,0.709046]]];

    !Positions.
    CONST robtarget pAxis5:=[[547.39,611.23,-161.60],[0.232844,-0.666065,0.669718,0.231558],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pOutline0:=[[687.76,649.28,-741.46],[0.0121275,-0.704892,0.709113,0.0118117],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline1:=[[702.76,612.61,-741.47],[0.0121306,-0.704896,0.709108,0.0118424],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline2:=[[739.97,596.62,-741.47],[0.012135,-0.704903,0.7091,0.0118636],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline3:=[[741.96,427.92,-741.48],[0.0121405,-0.704905,0.709098,0.0118651],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline4:=[[433.44,425.21,-741.48],[0.0121498,-0.704916,0.709087,0.0118751],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline5:=[[396.64,439.73,-741.48],[0.0121622,-0.704916,0.709087,0.0118924],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline6:=[[381.65,475.54,-741.49],[0.0121818,-0.704915,0.709087,0.0119034],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline7:=[[380.81,593.48,-741.50],[0.0122003,-0.704916,0.709085,0.0119232],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline8:=[[394.55,630.88,-741.51],[0.0122171,-0.70493,0.709071,0.0119283],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutline9:=[[429.55,645.08,-741.51],[0.0122118,-0.704926,0.709075,0.0119252],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pOutlineUp:=[[650.97,619.90,-692.01],[0.0121757,-0.704956,0.709046,0.0119033],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pCircle0:=[[594.99,573.34,-740.22],[0.0122042,-0.704972,0.70903,0.0119349],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pCircle1:=[[596.92,501.05,-740.21],[0.0121986,-0.704971,0.709031,0.0119248],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pCircle2:=[[525.47,499.99,-740.21],[0.0122005,-0.704987,0.709015,0.0119265],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pCircle3:=[[522.47,571.99,-740.21],[0.0122018,-0.704981,0.709021,0.0119243],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pCircleUp:=[[603.00,575.34,-692.02],[0.0121882,-0.704961,0.709041,0.011919],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC main()
        !Break axis 5 (avoid singularity).
        MoveAbsJ [[0, 0, 0, 0, 0, 0], [9E+09, 9E+09, 9E+09, 9E+09, 9E+09, 9E+09]]\NoEOffs, v1000, z50, tool0;
        MoveJ pAxis5, v1000, z50, tPencil\WObj := wobjSheet;

        !Move to ouline.
        MoveJ pOutline0, v1000, fine, tPencil\WObj := wobjSheet;

        !Trace outline + clearance.
        !Start at the arc in the bottom left corner, and go clockwise.
        MoveC pOutline1, pOutline2, v1000, z10, tPencil\WObj := wobjSheet;
        MoveL pOutline3, v1000, fine, tPencil\WObj := wobjSheet;
        MoveL pOutline4, v1000, z50, tPencil\WObj := wobjSheet;
        MoveC pOutline5, pOutline6, v1000, z10, tPencil\WObj := wobjSheet;
        MoveL pOutline7, v1000, z50, tPencil\WObj := wobjSheet;
        MoveC pOutline8, pOutline9, v1000, z10, tPencil\WObj := wobjSheet;
        MoveL pOutline0, v1000, fine, tPencil\WObj := wobjSheet;
        MoveL pOutlineUp, v1000, z50, tPencil\WObj := wobjSheet;

        !Move to inner circle.
        MoveJ pCircleUp, v1000, z50, tPencil\WObj := wobjSheet;
        MoveL pCircle0, v1000, fine, tPencil\WObj := wobjSheet;

        !Trace inner circle + clearance.
        MoveC pCircle1, pCircle2, v1000, z10, tPencil\WObj := wobjSheet;
        MoveC pCircle3, pCircle0, v1000, z10, tPencil\WObj := wobjSheet;
        MoveL pCircleUp, v1000, z50, tPencil\WObj := wobjSheet;

        !Return to zero.
        MoveAbsJ [[0, 0, 0, 0, 0, 0], [9E+09, 9E+09, 9E+09, 9E+09, 9E+09, 9E+09]]\NoEOffs, v1000, z50, tool0;
    ENDPROC
ENDMODULE