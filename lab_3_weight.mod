MODULE MainModule
    !Tools.
    PERS tooldata tFork:=[TRUE,[[150.5,0,69.7],[0,0.707106781,0,0.707106781]],[1,[0,0,1],[1,0,0,0],0,0,0]];

    !Work objects.
    TASK PERS wobjdata wobjSheet:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[1076.52,-544.01,672],[0.705162,-0.000000635,-0.000000035,0.709046]]];

    !Positions.
    CONST robtarget pAxis5:=[[547.29,593.45,-159.73],[0.202977,-0.675659,0.67937,0.201844],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget p1:=[[434.09,540.59,-654.65],[0.0128115,-0.705018,0.708959,0.0127361],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p2:=[[434.09,540.59,-707.44],[0.0128014,-0.70503,0.708947,0.0127416],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p3:=[[434.09,467.58,-707.43],[0.0127754,-0.705052,0.708926,0.0127203],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p4:=[[434.10,467.58,-654.33],[0.0127757,-0.705059,0.70892,0.0127178],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pTilt1:=[[438.27,418.33,-593.64],[0.124509,0.703867,-0.688222,0.124169],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pTilt2:=[[434.16,466.72,-653.62],[0.0107971,-0.705242,0.708803,0.0107431],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget d1:=[[642.72,530.16,-655.19],[0.00660164,-0.705593,0.708554,0.00674585],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget d2:=[[642.72,530.16,-706.38],[0.00660561,-0.705582,0.708565,0.00674539],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget d3:=[[642.71,604.76,-706.39],[0.00661502,-0.705571,0.708576,0.00677094],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget d4:=[[642.71,604.73,-671.26],[0.00659693,-0.705564,0.708583,0.00674007],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget pTilt3:=[[641.75,502.67,-626.30],[0.0634437,0.700722,-0.707811,0.0629807],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pTilt4:=[[642.85,534.19,-658.57],[0.0157844,-0.705717,0.70814,0.015871],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget p4Adjusted:=[[434.25,464.85,-653.75],[0.00652021,-0.705597,0.708553,0.00651244],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p3Adjusted:=[[433.36,456.82,-707.45],[0.0127958,-0.70507,0.708907,0.0127412],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p2Adjusted:=[[431.55,562.72,-707.46],[0.012808,-0.7051,0.708877,0.0127466],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p1Adjusted:=[[434.09,540.59,-654.65],[0.0128115,-0.705018,0.708959,0.0127361],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC main()
        !Break axis 5 (avoid singularity).
        MoveAbsJ [[0, 0, 0, 0, 0, 0], [9E+09, 9E+09, 9E+09, 9E+09, 9E+09, 9E+09]]\NoEOffs, v1000, z50, tool0;
        MoveJ pAxis5, v500, z50, tFork\WObj := wobjSheet;

        !Pick up the weight.
        MoveJ p1, v1000, z50, tFork\WObj := wobjSheet;
        MoveL p2, v100, fine, tFork\WObj := wobjSheet;
        MoveL p3, v100, z50, tFork\WObj := wobjSheet;
        MoveL p4, v100, z50, tFork\WObj := wobjSheet;

        !Tilt the fork to secure the weight.
        MoveJ pTilt1, v500, z50, tFork\WObj := wobjSheet;
        MoveJ pTilt2, v500, z50, tFork\WObj := wobjSheet;

        !Drop the weight.
        MoveJ d1, v500, z50, tFork\WObj := wobjSheet;
        MoveL d2, v100, z50, tFork\WObj := wobjSheet;
        MoveL d3, v100, z50, tFork\WObj := wobjSheet;
        MoveL d4, v100, z50, tFork\WObj := wobjSheet;

        !Pick up the weight again.
        MoveL d3, v100, z50, tFork\WObj := wobjSheet;
        MoveL d2, v1000, z50, tFork\WObj := wobjSheet;
        MoveL d1, v1000, z50, tFork\WObj := wobjSheet;

        !Tilt the fork.
        MoveJ pTilt3, v1000, z50, tFork\WObj := wobjSheet;
        MoveJ pTilt4, v1000, z50, tFork\WObj := wobjSheet;

        !Drop the weight at its initial position (NOT COMPLETED).
        MoveL p4Adjusted, v1000, z50, tFork\WObj := wobjSheet;
        MoveL p3Adjusted, v1000, z50, tFork\WObj := wobjSheet;
        MoveL p2Adjusted, v1000, z50, tFork\WObj := wobjSheet;
        MoveL p1Adjusted, v1000, z50, tFork\WObj := wobjSheet;

        !Return to zero.
        MoveAbsJ [[0, 0, 0, 0, 0, 0], [9E+09, 9E+09, 9E+09, 9E+09, 9E+09, 9E+09]]\NoEOffs, v1000, z50, tool0;
    ENDPROC
ENDMODULE