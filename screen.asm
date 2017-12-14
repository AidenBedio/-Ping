TITLE ASM1 (EXE)
.MODEL SMALL
.stack 32
;=================================================================(AIDEN LODI)=====================================================================
.Data

FRAME1_STR            DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
FRAME2_STR            DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG1_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG2_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG3_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG4_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG5_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG6_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG7_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG8_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
BG9_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
GO_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
HI_STR            		DB 1818 DUP('$')  ;length = original length of record + 1 (for $)
FILEHANDLE            DW ?

STR 									DB 		5 DUP('0')
EXT 									DB 				'$'

SELECT                DB    ">>$"

GLOBAL_TIMER          DB      0,'$'

HISCORE               DB      "HI SCORE: ",'$'
SCORE                 DB      "SCORE: ",'$'

BEEPCX              DW      ?                               ;FOR BEEP SOUND
BEEPBX              DB      ?                               ;FOR BEEP SOUND

KEY_INPUT             DB      0

FRAME1FILE            DB 'menu1.txt', 00H
FRAME2FILE            DB 'menu2.txt', 00H
GOFILE 								DB 'gameover.txt', 00H
HIFILE                DB 'hiScore.txt', 00H

;4,5,7,9
BG1FILE               DB 'frame1.txt', 00H
BG2FILE               DB 'frame2.txt', 00H
BG3FILE               DB 'frame3.txt', 00H
BG4FILE               DB 'frame4.txt', 00H
BG5FILE               DB 'frame5.txt', 00H
BG6FILE               DB 'frame6.txt', 00H
BG7FILE               DB 'frame7.txt', 00H
BG8FILE               DB 'frame8.txt', 00H
BG9FILE               DB 'frame9.txt', 00H

HISCORE_STR           DB 10   DUP('$')

;---------------------------------------------------------------------------------

_This                 equ     es:[bx]         ;Provide a mnemonic name for THIS.

;---------------------------------------------------------------------------------
;**** Macros to simplify calling the various methods (Menu Data type) ****


_DISPLAY1             macro
                      call _This._Display1_
                      endm

_DISPLAY2             macro
                      call _This._Display2_
                      endm

_DISPLAYHI            macro 
                      call _This._DisplayHi_
                      endm

;**** Macros to simplify calling the various methods (SHIP Data type) ****

_DRAWSHIP             macro
                      call _This._DrawShip_
                      endm

_DrawHeart            macro
                      call _This._DrawHeart_
                      endm

_DrawBomb             macro
                      call _This._DrawBomb_
                      endm

_DrawScore            macro
                      call _This._DrawScore_
                      endm

_UpdateSHIP           macro
                      call _This._UpdateShip_
                      endm

;**** Macros to simplify calling the various methods (Bullet Data type) ****

_SETXY                macro
                      call _This._SetXY_
                      endm

_DrawBullet           macro
                      call _This._DrawBullet_
                      endm

_UpdateBullet         macro
                      call _This._UpdateBullet_
                      endm

;**** Macros to simplify calling the various methods (Interceptor Data type) ****

_ICSETXY              macro
                      call _This._icSetXY_
                      endm

_DRAWIC               macro
                      call _This._DRAWIC_
                      endm

_UpdateIC             macro
                      call _This._UpdateIC_
                      endm

;---------------------------------------------------------------------------------
INTERCEPT             STRUC
  
  ic_X                DB      50
  ic_Y                DB      0
  ic_health 					DW 			0

  icFrame 						DW 			1

  active              DB      0

  _icSetXY_           DD      ?
  _DRAWIC_            DD      ?
  _UpdateIC_          DD      ? 

INTERCEPT             ends

IC_VAR                macro       var
var                   INTERCEPT<,,,,,icSetXY,drawIC,updateIC>
                      endm

IC_VAR                ic1
ic1Addr               dd      ic1

IC_VAR                ic2
ic2Addr               dd      ic2

IC_VAR                ic3
ic3Addr               dd      ic3

IC_VAR                ic4
ic4Addr               dd      ic4

IC_VAR                ic5
ic5Addr               dd      ic5

IC_VAR                ic6
ic6Addr               dd      ic6

IC_VAR                ic7
ic7Addr               dd      ic7

IC_VAR                ic8
ic8Addr               dd      ic8

IC_VAR                ic9
ic9Addr               dd      ic9

IC_VAR                ic10
ic10Addr              dd      ic10

IC_VAR                ic11
ic11Addr              dd      ic11

IC_VAR                ic12
ic12Addr              dd      ic12

IC_VAR                ic13
ic13Addr              dd      ic13

IC_VAR                ic14
ic14Addr              dd      ic14

IC_VAR                ic15
ic15Addr              dd      ic15
;---------------------------------------------------------------------------------
BULLET                STRUC
  
  bullet_X            DB      0
  bullet_Y            DB      0

  onair               DB      0

  _SetXY_             dd      ?
  _DrawBullet_        dd      ?
  _UpdateBullet_      dd      ?

BULLET                endS

BULLET_VAR            macro       var
var                   BULLET<,,,bSetXY,drawBullet, updatebullet>
                      endm

BULLET_VAR            b1
b1Addr                dd      b1

BULLET_VAR            b2
b2Addr                dd      b2

BULLET_VAR            b3
b3Addr                dd      b3

BULLET_VAR            b4
b4Addr                dd      b4

BULLET_VAR            b5
b5Addr                dd      b5

BULLET_VAR            b6
b6Addr                dd      b6

BULLET_VAR            b7
b7Addr                dd      b7

BULLET_VAR            b8
b8Addr                dd      b8

BULLET_VAR            b9
b9Addr                dd      b9

BULLET_VAR            b10
b10Addr               dd      b10

BULLET_VAR            b11
b11Addr               dd      b11

BULLET_VAR            b12
b12Addr               dd      b12

BULLET_VAR            b13
b13Addr               dd      b13

BULLET_VAR            b14
b14Addr               dd      b14

BULLET_VAR            b15
b15Addr               dd      b15

BULLET_VAR            b16
b16Addr               dd      b16

BULLET_VAR            b17
b17Addr               dd      b17

BULLET_VAR            b18
b18Addr               dd      b18

BULLET_VAR            b19
b19Addr               dd      b19

BULLET_VAR            b20
b20Addr               dd      b20
;---------------------------------------------------------------------------------

SHIP                  STRUC


  health_X            DB       5
  ship_Health         DW       3

  bomb                DW       2, '$'

  ship_X              DB       10
  ship_Y              DB       12
  shipFrame           DB       1

  ship_State          DB       1

  ship_Score          DW       0, '$'

  _DrawShip_          dd       ?
  _DrawHeart_         dd       ?
  _DrawBomb_          dd       ?
  _DrawScore_         dd       ?
  _UpdateShip_ 				dd 			 ?

SHIP                  ENDS

SHIP_VAR              macro     var
var                   SHIP<,,,,,,,,drawShip,drawHeart, drawBomb, drawScore, updateShip>
                      endm

SHIP_VAR              myShip
myShipAddr            dd      myShip   
;---------------------------------------------------------------------------------
MENU                  STRUC
  
  CURRENTFRAME        DB    1
  BGFRAME             DB    1
  SELECTION           DB    1

  X                   DB    30
  Y                   DB    15 


  _Display1_          dd     ?
  _Display2_          dd     ?
  _DisplayHi_         dd     ?

MENU                  ENDS


MENU_VAR              macro     var
var                   MENU<,,,,,menuDisplay1, menuDisplay2, displayHi>
endm

MENU_VAR              HomeScreen
HomeScreenAddr        dd      HomeScreen              ;Provide convenient address for U1.


  ;INPUT2 DB ?, 0AH, 0DH
  ;INPUT3 DB ?,'$'

BACONS                DB          "I LOVe BACONSSS$"
;===================================================================================================================================
.CODE
;===================================================================================================================================
;**** methods for the MENU DATA TYPE ****
menuDisplay1          PROC      FAR

		MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 01
    MOV DL, 19          ;lower right row:column (79:23)
    MOV DH, 06
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 20         ;upper left row:column (01:00)
    MOV CH, 01
    MOV DL, 39          ;lower right row:column (79:23)
    MOV DH, 06
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 40         ;upper left row:column (01:00)
    MOV CH, 01
    MOV DL, 59          ;lower right row:column (79:23)
    MOV DH, 06
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 60         ;upper left row:column (01:00)
    MOV CH, 01
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 06
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H
    ;===================

    MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 07
    MOV DL, 19          ;lower right row:column (79:23)
    MOV DH, 12
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 20         ;upper left row:column (01:00)
    MOV CH, 07
    MOV DL, 39          ;lower right row:column (79:23)
    MOV DH, 12
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 40         ;upper left row:column (01:00)
    MOV CH, 07
    MOV DL, 59          ;lower right row:column (79:23)
    MOV DH, 12
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 60         ;upper left row:column (01:00)
    MOV CH, 07
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 12
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H
    ;===================

    MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 13
    MOV DL, 19          ;lower right row:column (79:23)
    MOV DH, 18
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 20         ;upper left row:column (01:00)
    MOV CH, 13
    MOV DL, 39          ;lower right row:column (79:23)
    MOV DH, 18
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 40         ;upper left row:column (01:00)
    MOV CH, 13
    MOV DL, 59          ;lower right row:column (79:23)
    MOV DH, 18
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 60         ;upper left row:column (01:00)
    MOV CH, 13
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 18
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H
    ;===================
    MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 19
    MOV DL, 19          ;lower right row:column (79:23)
    MOV DH, 23
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 20         ;upper left row:column (01:00)
    MOV CH, 19
    MOV DL, 39          ;lower right row:column (79:23)
    MOV DH, 23
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 40         ;upper left row:column (01:00)
    MOV CH, 19
    MOV DL, 59          ;lower right row:column (79:23)
    MOV DH, 23
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 60         ;upper left row:column (01:00)
    MOV CH, 19
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 23
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H
    ;===================


    MOV DL, 0
    MOV DH, 0
    CALL SET_CURSOR           ;setting of cursor to the upperleft of screen

    les   bx, HomeScreenAddr
    CMP _This.CURRENTFRAME, 1 ;comparison of frames for background animations
    JE @DISPLAY1
    JNE @DISPLAY2

      @DISPLAY1:              ;display frame1

      	LEA DX, FRAME1_STR            ;display of the frame
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr      ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])
        MOV _This.CURRENTFRAME, 2     ;setting the flag for the next frame

        JMP @PROCEED

      @DISPLAY2:              ;display frame2

      	LEA DX, FRAME2_STR            ;display of the frame
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr      ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])
        MOV _This.CURRENTFRAME, 1     ;setting the flag for the next frame


        @PROCEED:

        les   bx, HomeScreenAddr      ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])

        MOV DL, _This.X
        MOV DH, _This.Y
        CALL SET_CURSOR       ;setting of the cursor for the selector 

        LEA DX, SELECT        ;display of the selector
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr      ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])
        MOV DL, _This.X
        MOV DH, _This.Y
        CALL SET_CURSOR               ;setting of the cursor for the selector 

        CALL GET_KEY          ;call of get_key procedure for event listening 
        CALL DELAY            ;call of delay for animation purposes

  ret
menuDisplay1     endP

menuDisplay2      PROC      FAR

    MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 01
    MOV DL, 19          ;lower right row:column (79:23)
    MOV DH, 06
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 20         ;upper left row:column (01:00)
    MOV CH, 01
    MOV DL, 39          ;lower right row:column (79:23)
    MOV DH, 06
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 40         ;upper left row:column (01:00)
    MOV CH, 01
    MOV DL, 59          ;lower right row:column (79:23)
    MOV DH, 06
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 60         ;upper left row:column (01:00)
    MOV CH, 01
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 06
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H
    ;===================

    MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 07
    MOV DL, 19          ;lower right row:column (79:23)
    MOV DH, 12
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 20         ;upper left row:column (01:00)
    MOV CH, 07
    MOV DL, 39          ;lower right row:column (79:23)
    MOV DH, 12
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 40         ;upper left row:column (01:00)
    MOV CH, 07
    MOV DL, 59          ;lower right row:column (79:23)
    MOV DH, 12
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 60         ;upper left row:column (01:00)
    MOV CH, 07
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 12
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H
    ;===================

    MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 13
    MOV DL, 19          ;lower right row:column (79:23)
    MOV DH, 18
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 20         ;upper left row:column (01:00)
    MOV CH, 13
    MOV DL, 39          ;lower right row:column (79:23)
    MOV DH, 18
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 40         ;upper left row:column (01:00)
    MOV CH, 13
    MOV DL, 59          ;lower right row:column (79:23)
    MOV DH, 18
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 60         ;upper left row:column (01:00)
    MOV CH, 13
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 18
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H
    ;===================
    MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 19
    MOV DL, 19          ;lower right row:column (79:23)
    MOV DH, 23
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 20         ;upper left row:column (01:00)
    MOV CH, 19
    MOV DL, 39          ;lower right row:column (79:23)
    MOV DH, 23
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 40         ;upper left row:column (01:00)
    MOV CH, 19
    MOV DL, 59          ;lower right row:column (79:23)
    MOV DH, 23
    MOV BH, 07H         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 60         ;upper left row:column (01:00)
    MOV CH, 19
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 23
    MOV BH, 0EH         ;set of the color to bright yellow
    INT 10H
    ;===================

    MOV DL, 0
    MOV DH, 1
    CALL SET_CURSOR     ;set of cursor for printing of background

    les   bx, HomeScreenAddr          ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])
    CMP _This.BGFRAME, 1              ;comparison of frames for background animations
    JNE @NEXTFRAME2                   ;check next next frame if it is the frame to be displayed

        LEA DX, BG1_STR           ;displaying of the frame
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr      ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])
        MOV _This.BGFRAME, 2          ;setting the flag for the next frame

        ret

    @NEXTFRAME2:
    CMP _This.BGFRAME, 2              ;The same logic for the firt frame
    JNE @NEXTFRAME3

        LEA DX, BG2_STR
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr
        MOV _This.BGFRAME, 3

        ret

    @NEXTFRAME3:
    CMP _This.BGFRAME, 3              ;The same logic for the firt frame
    JNE @NEXTFRAME4

        LEA DX, BG3_STR
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr
        MOV _This.BGFRAME, 4

        ret


    @NEXTFRAME4:
    CMP _This.BGFRAME, 4              ;The same logic for the firt frame
    JNE @NEXTFRAME5

        LEA DX, BG4_STR
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr
        MOV _This.BGFRAME, 5

        ret

    @NEXTFRAME5:
    CMP _This.BGFRAME, 5              ;The same logic for the firt frame
    JNE @NEXTFRAME6

        LEA DX, BG5_STR
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr
        MOV _This.BGFRAME, 6

        ret

    @NEXTFRAME6:
    CMP _This.BGFRAME, 6              ;The same logic for the firt frame
    JNE @NEXTFRAME7

				LEA DX, BG6_STR        
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr
        MOV _This.BGFRAME, 7

        ret

    @NEXTFRAME7:
    CMP _This.BGFRAME, 7              ;The same logic for the firt frame
    JNE @NEXTFRAME8

        LEA DX, BG7_STR
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr
        MOV _This.BGFRAME, 8

        ret

    @NEXTFRAME8:
    CMP _This.BGFRAME, 8              ;The same logic for the firt frame
    JNE @NEXTFRAME9

        LEA DX, BG8_STR
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr
        MOV _This.BGFRAME, 9

        ret

    @NEXTFRAME9:
    CMP _This.BGFRAME, 9              ;The same logic for the firt frame
    JNE @NEXTFRAME10

        LEA DX, BG9_STR
        MOV AH, 09
        INT 21H

        les   bx, HomeScreenAddr
        MOV _This.BGFRAME, 1

        ret

    @NEXTFRAME10:

  ret
menuDisplay2      endp

displayHi      PROC     FAR
  
  MOV DL, 63
  MOV DH, 0
  CALL SET_CURSOR           ;set of cursor for printing "HI SCORE: " on the upper right

  LEA DX, HISCORE           ;display of "HI SCORE: "
  MOV AH, 09
  INT 21H

  LEA DX, HI_STR       ;display of the actual hi score
  MOV AH, 09
  INT 21H

  ret
displayHi     endP


;**** MENU DATA TYPE end methods ****
;===================================================================================================================================
;===================================================================================================================================
;**** methods for the SHIP DATA TYPE ****

drawShip      PROC      FAR
  
  CMP _This.ship_State, 1           ;comparison of ship that will be drawn (because it will change if powerups are taken)
  JE  @DRAW_STATE1                  ;jmp to call to draw a basic ship 

  CMP _This.ship_State, 2
  ;JE  @DRAW_STATE2                 ;jmp to call to draw a 2nd evolution of ship (not yet implemented)

  CMP _This.ship_State, 3
  ;JE @DRAW_STATE3                  ;jmp to call to draw a 3rd evolution of ship (not yet implemented)

  @DRAW_STATE1:
    CALL DRAW_SHIPS1                ;procedure is called to draw a basic ship 

  @DRAW_STATE2:
                                    ;procedure is called to draw a 2nd evolution ship (not yet implemented)

  @DRAW_STATE3:
                                    ;procedure is called to draw a 3rd evolution ship (not yet implemented)
  ret
drawShip      endp

drawScore       PROC      FAR

  MOV DL, 32
  MOV DH, 0
  CALL SET_CURSOR                   ;setting of the cursor to coordinate (32:x , 00:y)

  LEA DX, SCORE                     ;display of the string "SCORE: "
  MOV AH, 09
  INT 21H

  les bx, myShipAddr                ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
  MOV AX, _This.ship_Score
  CALL TOSTRING
  
  LEA DX, STR          							;display of the player's score (saved on the SHIP object)
  MOV AH, 09
  INT 21H

  MOV DL, _This.ship_X
  MOV DH, _This.ship_Y
  CALL SET_CURSOR                   ;setting the cursor to the ship (default location of the cursor)

  ret
drawScore       endp

drawHeart       PROC      FAR
  
  MOV DL, 1
  MOV DH, 0
  CALL SET_CURSOR                   ;setting the cursor to the upperleft for the string "HP: "

  MOV   AL, 72  ; "H"               ; display of the character "H"
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  MOV   AL, 80  ; "P"               ; display of the character "P"
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  MOV   AL, 58  ; ":"               ; display of the character ":"
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr              ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])

  MOV CX, _This.ship_health              ;setting the loop to the number of health left

  @HEARTLOOP:                       ;start of loop for printing the 'payting/heart'

    PUSH CX                         ;push the current value of CX because the CX register will be used in clearscreen for color purposes

    MOV AX, 0600H                   ;full screen

    MOV CL, _This.health_X          ;upper left row:column (00:depends) / initially on 5
    MOV CH, 00H
    MOV DL, _This.health_X          ;lower right row:column (00:depends)
    MOV DH, 00H
    MOV BH, 04H 
    INT 10H                         ; we call this the 'unit clearscreen'

    POP CX                          ;re-acquire value for the CX register for looping

    les   bx, myShipAddr            ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
    MOV DL, _This.health_X
    MOV DH, 0
    CALL SET_CURSOR                 ;setting of cursor for the printing of heart

    MOV   AL, 03                    ; display of the "payting" symbol
    MOV   AH, 02H
    MOV   DL, AL
    INT   21H    

    les   bx, myShipAddr            ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
    ADD _This.health_X, 1           ;add x coordinate for the next heart symbol that will be printed

    LOOP @HEARTLOOP                 ;end of loop for printing the 'payting/heart'

    les   bx, myShipAddr            ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
    MOV _This.health_X, 5           ;resetting the value of the x coordinate to 5

    ;CALL DELAY

  ret
drawHeart       endp

drawBomb      PROC      FAR

		MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 00
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 00
    MOV BH, 0FH         ;set of the color to bright yellow
    INT 10H

    MOV AX, 0600H       ;full screen

    MOV CL, 00         ;upper left row:column (01:00)
    MOV CH, 23
    MOV DL, 79          ;lower right row:column (79:23)
    MOV DH, 24
    MOV BH, 0FH         ;set of the color to bright yellow
    INT 10H
  
  les   bx, myShipAddr              ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
  MOV DL, 1
  MOV DH, 24
  CALL SET_CURSOR                   ;setting the cursor to the lower right of the screen (01:x , 24:y)

  MOV   AL, 237  ; "  "              ;display of the character 'Ø' as symbol for bomb
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  MOV   AL, 00  ; "space/' '"       ;display of the character ' '
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  MOV   AL, 120  ; "x"              ;display of the character 'x'
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  MOV   AL, 00  ; "space/' '"       ;display of the character ' '
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr              ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])

  ADD _This.Bomb, 48                ;adding character '0' so that it will display its decimal equivalent (To be optimized/ will not work greater than 10)
  LEA DX, _This.Bomb                ;display of the current 'bomb' a ship has
  MOV AH, 09H
  INT 21H

  SUB _This.Bomb, 48                ;subtract back '0' so that it will not keep on adding because this function is always called (normalization)

  ret
drawBomb      endp

updateShip 			PROC 			FAR
	
	  CMP _This.ship_health, 0
		JNE @RETURNBACK

		MOV AX, _This.ship_Score
		CALL TOSTRING

		CLD
		LEA SI, HI_STR
		LEA DI, STR
		MOV CX, 5

		_CHECK:
		MOV AH, [SI]
		MOV AL, [DI]

		CMP AH, AL
		JB _NEWHI

		INC SI
		INC DI

		LOOP _CHECK

		CALL GAME_OVER

		_NEWHI:

		CALL SAVEHI
		CALL GAME_OVER

	@RETURNBACK:

	ret
updateShip 			ENDP


;**** SHIP DATA TYPE end methods ****
;===================================================================================================================================
;===================================================================================================================================
;**** methods for the BULLET DATA TYPE ****
bSetXY      PROC      FAR
  
  PUSH BX                         ;push the current bullet's address stored in bx because we will use the bx register temporarily

  les bx, myShipAddr              ;load myShipAddr to bx to get its current x coordinate

  MOV AL, _This.ship_X            ;get ship's current x coordinate (store in AL)
  ADD AL, 4                       ;add 4 units to make it in front of the ship

  POP BX                          ;re-acquire current bullet's address
  PUSH BX                         ;push it back, same process will happen but this time it is the y-axis

  MOV _This.Bullet_X, AL          ;assign the value stored in AL as the bullet's new X coordinate

  les bx, myShipAddr              ;load myShipAddr to bx to get its current y coordinate

  MOV AL, _This.ship_Y            ;get ship's current y coordinate (store in AL)

  POP BX                          ;re-acquire current bullet's address
  MOV _This.Bullet_Y, AL          ;assign the value stored in AL as the bullet's new Y coordinate

  ret
bSetXY      endp

drawBullet   PROC       FAR
  
                                  ;this should have some comparison here to which type of bullet is displayed (power ups not yet implemented)

  PUSH BX                         ;push the current bullet's address stored in bx because we will use the bx register for color purposes

  MOV AX, 0600H                   ;full screen

  MOV CL, _This.Bullet_X          ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.Bullet_Y
  MOV DL, _This.Bullet_X          ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.Bullet_Y
  MOV BH, 09H                     ;set to color blue
  INT 10H                         ;unit clearscreen

  POP BX                          ;re-acquire current bullet's address

  MOV DL, _This.Bullet_X
  MOV DH, _This.Bullet_Y
  CALL SET_CURSOR                 ;mov cursor to the bullet's position

  MOV   AL, 21  ; "§ "            
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H                       ;display of the bullet

  les bx, myShipAddr              ;load myShipAddr to bx for resetting the cursor to default position

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR                ;set the cursor to the ship (default cursor position)
  
  ret
drawBullet      endp

updateBullet      PROC      FAR
  
  ;problem [when to pop bx back if no enemy] (basta stack problem ni siya sure ko)
  PUSH BX

  les   bx, ic1Addr
  CMP _This.active, 1
  JNE @IC2HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP1

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP1

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC2check1
        JE @WARP1

            @IC2check1:
            PUSH BX
            JMP @IC2HIT

        @WARP1:

        CMP _This.Bullet_X, AL
        JL  @IC2check2
        JGE @PORTAL1

            @IC2check2:
            PUSH BX
            JMP @IC2HIT

        @PORTAL1:
        MOV _This.onair, 0

        les bx, ic1Addr
        DEC _This.ic_health

        ret

  @IC2HIT:
  les   bx, ic2Addr
  CMP _This.active, 1
  JNE @IC3HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP2

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP2

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC3check1
        JE @WARP2

            @IC3check1:
            PUSH BX
            JMP @IC3HIT

        @WARP2:

        CMP _This.Bullet_X, AL
        JL  @IC3check2
        JGE @PORTAL2

            @IC3check2:
            PUSH BX
            JMP @IC3HIT

        @PORTAL2:
        MOV _This.onair, 0

        les bx, ic2Addr
        DEC _This.ic_health

        ret

  @IC3HIT:
  les   bx, ic3Addr
  CMP _This.active, 1
  JNE @IC4HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP3

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP3

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC4check1
        JE @WARP3

            @IC4check1:
            PUSH BX
            JMP @IC4HIT

        @WARP3:

        CMP _This.Bullet_X, AL
        JL  @IC4check2
        JGE @PORTAL3

            @IC4check2:
            PUSH BX
            JMP @IC4HIT

        @PORTAL3:
        MOV _This.onair, 0

        les bx, ic3Addr
        DEC _This.ic_health

        ret

  @IC4HIT:
  les   bx, ic4Addr
  CMP _This.active, 1
  JNE @IC5HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP4

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP4

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC5check1
        JE @WARP4

            @IC5check1:
            PUSH BX
            JMP @IC5HIT

        @WARP4:

        CMP _This.Bullet_X, AL
        JL  @IC5check2
        JGE @PORTAL4

            @IC5check2:
            PUSH BX
            JMP @IC5HIT

        @PORTAL4:
        MOV _This.onair, 0

        les bx, ic4Addr
        DEC _This.ic_health

        ret

  @IC5HIT:
  les   bx, ic5Addr
  CMP _This.active, 1
  JNE @IC6HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP5

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP5

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC6check1
        JE @WARP5

            @IC6check1:
            PUSH BX
            JMP @IC6HIT

        @WARP5:

        CMP _This.Bullet_X, AL
        JL  @IC6check2
        JGE @PORTAL5

            @IC6check2:
            PUSH BX
            JMP @IC6HIT

        @PORTAL5:
        MOV _This.onair, 0

        les bx, ic5Addr
        DEC _This.ic_health

        ret

  @IC6HIT:
  les   bx, ic6Addr
  CMP _This.active, 1
  JNE @IC7HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP6

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP6

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC7check1
        JE @WARP6

            @IC7check1:
            PUSH BX
            JMP @IC7HIT

        @WARP6:

        CMP _This.Bullet_X, AL
        JL  @IC7check2
        JGE @PORTAL6

            @IC7check2:
            PUSH BX
            JMP @IC7HIT

        @PORTAL6:
        MOV _This.onair, 0

        les bx, ic6Addr
        DEC _This.ic_health

        ret

  @IC7HIT:
  les   bx, ic7Addr
  CMP _This.active, 1
  JNE @IC8HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP7

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP7

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC8check1
        JE @WARP7

            @IC8check1:
            PUSH BX
            JMP @IC8HIT

        @WARP7:

        CMP _This.Bullet_X, AL
        JL  @IC8check2
        JGE @PORTAL7

            @IC8check2:
            PUSH BX
            JMP @IC8HIT

        @PORTAL7:
        MOV _This.onair, 0

        les bx, ic7Addr
        DEC _This.ic_health

        ret

  @IC8HIT:
  les   bx, ic8Addr
  CMP _This.active, 1
  JNE @IC9HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP8

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP8

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC9check1
        JE @WARP8

            @IC9check1:
            PUSH BX
            JMP @IC9HIT

        @WARP8:

        CMP _This.Bullet_X, AL
        JL  @IC9check2
        JGE @PORTAL8

            @IC9check2:
            PUSH BX
            JMP @IC9HIT

        @PORTAL8:
        MOV _This.onair, 0

        les bx, ic8Addr
        DEC _This.ic_health

        ret

  @IC9HIT:
  les   bx, ic9Addr
  CMP _This.active, 1
  JNE @IC10HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP9

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP9

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC10check1
        JE @WARP9

            @IC10check1:
            PUSH BX
            JMP @IC10HIT

        @WARP9:

        CMP _This.Bullet_X, AL
        JL  @IC10check2
        JGE @PORTAL9

            @IC10check2:
            PUSH BX
            JMP @IC10HIT

        @PORTAL9:
        MOV _This.onair, 0

        les bx, ic9Addr
        DEC _This.ic_health

        ret

  @IC10HIT:
  les   bx, ic10Addr
  CMP _This.active, 1
  JNE @IC11HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP10

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP10

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC11check1
        JE @WARP10

            @IC11check1:
            PUSH BX
            JMP @IC11HIT

        @WARP10:

        CMP _This.Bullet_X, AL
        JL  @IC11check2
        JGE @PORTAL10

            @IC11check2:
            PUSH BX
            JMP @IC11HIT

        @PORTAL10:
        MOV _This.onair, 0

        les bx, ic10Addr
        DEC _This.ic_health

        ret

  @IC11HIT:
  les   bx, ic11Addr
  CMP _This.active, 1
  JNE @IC12HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP11

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP11

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC12check1
        JE @WARP11

            @IC12check1:
            PUSH BX
            JMP @IC12HIT

        @WARP11:

        CMP _This.Bullet_X, AL
        JL  @IC12check2
        JGE @PORTAL11

            @IC12check2:
            PUSH BX
            JMP @IC12HIT

        @PORTAL11:
        MOV _This.onair, 0

        les bx, ic11Addr
        DEC _This.ic_health

        ret

  @IC12HIT:
  les   bx, ic12Addr
  CMP _This.active, 1
  JNE @IC13HIT

        MOV AL, _This.ic_X
        MOV AH, _This.ic_Y

        POP BX

        CMP _This.Bullet_Y, AH
        JE @WARP12

        DEC AH
        CMP _This.Bullet_Y, AH
        JE @WARP12

        ADD AH, 2
        CMP _This.Bullet_Y, AH
        JNE @IC13check1
        JE @WARP12

            @IC13check1:
            PUSH BX
            JMP @IC13HIT

        @WARP12:

        CMP _This.Bullet_X, AL
        JL  @IC13check2
        JGE @PORTAL12

            @IC13check2:
            PUSH BX
            JMP @IC13HIT

        @PORTAL12:
        MOV _This.onair, 0

        les bx, ic12Addr
        DEC _This.ic_health

        ret

  @IC13HIT:
  POP BX
  

  CMP _This.Bullet_X, 75          ;checking of the bullets if it goes outside the screen
  JL @KEEPUPDATING                ;if not yet then keep updating 

    MOV _This.onair, 0            ;else then set the current bullet's active flag to false

    ret

  @KEEPUPDATING:
  ADD _This.Bullet_X, 5           ;move the bullet by updating its X coordinate

  ret
updateBullet    endp

;**** BULLET DATA TYPE end methods ****
;===================================================================================================================================
;===================================================================================================================================
;**** methods for the INTERCEPTOR DATA TYPE ****
icSetXY       PROC      FAR
  ; should be something random (3 - 21)
  MOV AH, 2CH  ; interrupts to get system time        
  INT 21H      ; CX:DX now hold number of clock ticks since midnight      

  mov  ax, dx
  xor  dx, dx
  mov  cx, 19    
  div  cx       ; here dx contains the remainder of the division - from 0 to 9
  ADD DX, 3
  ;DL replace 12
  MOV _This.ic_X, 70
  MOV _This.ic_Y, DL            ;setting of the y coordinate of the enemies (temporarily set to a fixed coordinate for development purposes)

  MOV _This.ic_health, 3
  ret
icSetXY       endP

drawIC      PROC      FAR

  PUSH BX                       ;push the current bullet's address stored in bx because we will use the bx register for color purposes

  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 40  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

;--------------------------------------------

  POP BX                        ;re-acquire current bullet's address
  ADD _This.ic_X, 1
  ADD _This.ic_Y, 1

  PUSH BX

  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 92  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX
  SUB _This.ic_Y, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 219  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX
  SUB _This.ic_Y, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 47  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX
  ADD _This.ic_X, 1
  ADD _This.ic_Y, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 178  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX
  SUB _This.ic_X, 1
  SUB _This.ic_Y, 1
  ADD _This.ic_X, 2

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 94  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_Y, 2

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 22;248  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  SUB _This.ic_Y, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 177  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_Y, 1
  ADD _This.ic_X, 1							;lower right corner of the meteor

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 47  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  SUB _This.ic_Y, 2 						;upper right corner of the meteor

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 170  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_Y, 1 						;upper right corner of the meteor

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 176  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_X, 1 						;upper right corner of the meteor

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 06H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 41  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_X, 1

  CMP _This.icFrame, 1
  JE @TRAIL1

  @TRAIL2:

  CALL TRAILER2
  RET

  @TRAIL1:

  CALL TRAILER1
  ret
drawIC      endP

updateIC      PROC      FAR

	CMP _This.ic_health, 0
		JNE @BLINK

		MOV _This.active, 0

		les bx, myShipAddr
		INC _This.ship_Score

		RET

	@BLINK:	

	PUSH BX

	les bx, myShipAddr
	MOV AL, _This.ship_X
	MOV AH, _This.ship_Y

	POP BX

  CMP _This.IC_Y, AH
  JE @WORMHOLE

  DEC AH
  CMP _This.IC_Y, AH
  JE @WORMHOLE

  ADD AH, 2
  CMP _This.IC_Y, AH
  JNE @BH1
  JE @WORMHOLE

  		@BH1:
  		PUSH BX
  		JMP @CARRY_ON

  @WORMHOLE:

  CMP _This.IC_X, AL
  JG  @BH2
  JLE @TELEPORT

  		@BH2:
  		PUSH BX
  		JMP @CARRY_ON

  @TELEPORT:
  MOV _This.active, 0

  les bx, myShipAddr
  DEC _This.ship_Health
  ret

  @CARRY_ON:
  POP BX

  CMP _This.ic_X, 5             ;checking of the bullets if it goes outside the screen
  JG @KEEPUPDATINGIC            ;if not yet then keep updating 

    MOV _This.ic_X, 79          ;reset current enemies default x coordinate to '79'
    MOV _This.active, 0         ;else then set the current bullet's active flag to false

    ret

  @KEEPUPDATINGIC:
  SUB _This.ic_X, 1             ;move the bullet by updating its X coordinate

  ret
updateIC      endP 


;**** INTERCEPTOR DATA TYPE end methods ****
;===================================================================================================================================
;===================================================================================================================================


;----------------------------------------------------------------------------------------
;----------------------------------------------------------------------------------------
;----------------------------------------------------------------------------------------

START PROC FAR
  MOV AX, @data
  MOV DS, AX

  CALL LOADRESOURCES

  @MAINMENU:

    CALL CLEAR_SCREEN                           ;calling of clearscreen

    les   bx, HomeScreenAddr                    ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])
    _DISPLAY1                                   ;display of the background for MAINMENU


    CMP KEY_INPUT, 00                           ;check if there was input
    JNE @ISACTION                               ;if so then check what action

        JMP @MAINMENU                           ;else loop back

    @ISACTION:
    CALL ACTION                                 ;call the action button

    JMP @MAINMENU                               ;loop back

  MOV AH, 4CH
  INT 21H

 START ENDP
 ;----------------------------------------------------------------------------------------
 ;----------------------------------------------------------------------------------------
 ;----------------------------------------------------------------------------------------
MAIN_GAME PROC NEAR
  
  @FIXEDUPDATE:

    ;CALL CLEAR_SCREEN                           ;calling of clearscreen

    les   bx, HomeScreenAddr                    ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])
    _DISPLAY2                                   ;display of the background for MAINMENU
    ;CALL DISPLAY_TIMER                         ;display of a counter (appears on the bottom right[for debuggin purposes])

    les   bx, myShipAddr                        ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
    _DRAWBOMB                                   ;display of the current bomb a ship has (bottom left)
    les   bx, myShipAddr                        ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
    _DRAWHEART                                  ;display of the current health a ship has (upper left)
    les   bx, myShipAddr                        ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
    _DRAWSHIP                                   ;display the ship
    les bx, myShipAddr
    _DrawScore                                  ;display the current score
    les   bx, HomeScreenAddr                    ;reassigning of HomeScreenAddr to bx for macro use (_This / es:[bx])
    _DISPLAYHI                                  ;display of the HI SCORE

    CALL GEN                                		;generate enemies (psuedo generate)
    CALL DRAWICS                                ;display generated enemies
    CALL UPDATEICS                              ;update generated enemies' position and status

    les   bx, myShipAddr                        ;reassigning of myShipAddr to bx for macro use (_This / es:[bx])
    _UpdateSHIP


    CALL DRAWBULLETS                            ;display generated bullets
    CALL UPDATE_BULLETS                         ;update generated bullets' position and status

    CALL GET_KEY                                ;call of get_key procedure for event listening 
    CALL DELAYEVENT                             ;call of delay for animation purposes

    CMP KEY_INPUT, 00                           ;check if there was input
    JNE @ISEVENT                                ;if so then check what event

    JMP @FIXEDUPDATE                            ;loop back (main game loop)

    @ISEVENT:
      CALL EVENT                                ;call event procedure (event listening)


        JMP @FIXEDUPDATE                        ;loop back (main game loop)

  RET
MAIN_GAME ENDP

 ;----------------------------------------------------------------------------------------
 ;----------------------------------------------------------------------------------------
 ;----------------------------------------------------------------------------------------
GAME_OVER 			PROC 			NEAR
	
	@GAME_OVER:

	CALL CLEAR_SCREEN

	MOV DL, 0
  MOV DH, 1
  CALL SET_CURSOR           ;setting of cursor to the upperleft of screen	

  LEA DX, GO_STR
  MOV AH, 09
  INT 21H

  MOV DL, 30
  MOV DH, 20
  CALL SET_CURSOR

  LEA DX, SCORE
  MOV AH, 09
  INT 21H

  les bx, myShipAddr

  MOV AX, _This.ship_Score
  CALL TOSTRING

  LEA DX, STR
	MOV AH, 09H
	INT 21H

	MOV DL, 0AH
	MOV AH, 02H
  INT 21H 


  CALL GET_KEY          ;call of get_key procedure for event listening 
  CALL DELAY

  CMP KEY_INPUT, 00                           ;check if there was input
    JNE @ISACTION1                               ;if so then check what action

        JMP @GAME_OVER                           ;else loop back

    @ISACTION1:
    CALL ACTION                                 ;call the action button


  

	JMP @GAME_OVER


 	ret
GAME_OVER 			ENDP
 ;----------------------------------------------------------------------------------------
 ;----------------------------------------------------------------------------------------
 ;----------------------------------------------------------------------------------------
EVENT    PROC   NEAR

  CMP KEY_INPUT, 01H                        ;check if input is 'ESC'     
  JE @EXITPRG1                              ; if so then exit the program
  JNE @SHIPLISTENER                         ; else jmp to ship action listener

    @EXITPRG1:                              ;exit program
    MOV AH, 4CH
    INT 21H

  @SHIPLISTENER:

    les   bx, myShipAddr                    ;load myShipAddr to bx for resetting the cursor to default position

    MOV AL, _This.ship_X
    MOV AH, _This.ship_Y

    CMP KEY_INPUT, 48H                      ;check if input is up
    JE @MOVEUP

    CMP KEY_INPUT, 50H                      ;check if input is down
    JE @MOVEDOWN

    CMP KEY_INPUT, 4BH                      ;check if input is left
    JE @MOVELEFT

    CMP KEY_INPUT, 4DH                      ;check if input is right
    JE @MOVERIGHT

    CMP KEY_INPUT, 39H                      ;check if input is space
    JE @FIRE
    JNE @PORTAL

                                            ;needs one more key for the 'bomb' (not yet implemented)
    @MOVEUP:

    	SUB AH, 1
    	CMP AH, 1
    	JE @PORTAL

      DEC _This.ship_Y                      ;move the ship upwards
      JMP @PORTAL                           ;flush key input (default 00)

    @MOVEDOWN:

    	ADD AH, 1
    	CMP AH, 23
    	JE @PORTAL

      INC _This.ship_Y                      ;move the ship downwards
      JMP @PORTAL                           ;flush key input (default 00)

    @MOVELEFT:

    	SUB AL, 6
    	CMP AL, 0
    	JE @PORTAL

      DEC _This.ship_X                      ;move the ship backwards
      JMP @PORTAL                           ;flush key input (default 00)

    @MOVERIGHT:

    	ADD AL, 3
    	CMP AL, 79
    	JE @PORTAL

      INC _This.ship_X                      ;move the ship forward
      JMP @PORTAL                           ;flush key input (default 00)

    @FIRE:
    	CALL FIRE_SOUND
      CALL FIREBULLET                       ;call FIREBULLET procedure for generating (psuedo-generate) a bullet
      

  @PORTAL:
  MOV KEY_INPUT, 00                         ;flush key input (default 00)                         

  ret
EVENT endp

 ;----------------------------------------------------------------------------------------
ACTION PROC NEAR

  CMP KEY_INPUT, 01H                        ;check if input is 'ESC'
  JE @EXITPRG                               ; if so then exit the program
  JNE @CONT                                 ; else jmp to ship action listener

        @EXITPRG:                           ;exit program
        MOV AH, 4CH
        INT 21H

  @CONT:
        
  CMP KEY_INPUT, 1CH                        ;check if input is 'Enter Key'       
  JE @CHECK_SELECTION                       ;jmp to checking what was selected 
  JNE @CHECK_ARROWKEYS                      ;jmp to checking if arrow keys were pressed (up and down)

          @CHECK_SELECTION:

          			CALL SELECT_SOUND

                les   bx, HomeScreenAddr        ;load HomeScreenAddr to bx for resetting the cursor to default position

                CMP _This.Selection, 1          ;check if selected was 'play game'
                JNE @HOWTO

                			MOV KEY_INPUT, 00                      ;else check if 'tutorial'
                      CALL MAIN_GAME            ;if so then call MAIN_GAME

                @HOWTO:
                CMP _This.Selection, 2          ;check if tutorial was selected
                JNE @EXIT                       ;else check if exit (pointless because at this point it will be exit always)

                			MOV KEY_INPUT, 00
                      CALL GAME_OVER                          ;call procedure for tutorial

                @EXIT:
                CMP _This.Selection, 3          ;check if tutorial was selected
                JE @EXITPRG                     ;jmp exit program

                JMP @RETURNPOINT                ;else return, set KEY_INPUT to default


          @CHECK_ARROWKEYS:

          CMP KEY_INPUT, 48H                    ;check if input was 'arrow up'
          JE @CHECK_SELECTIONUP                 ;if so, then do things

          CMP KEY_INPUT, 50H                    ;else if input was 'down'
          JE @CHECK_SELECTIONDOWN               ;if so the then do things
          JNE @RETURNPOINT                      ;else return, set KEY_INPUT to default

              @CHECK_SELECTIONUP:               ;if UP

              CALL SELECT_SOUND

              les   bx, HomeScreenAddr          ;load HomeScreenAddr to bx for resetting the cursor to default position

              CMP _This.Selection, 1            ;check if current selected was 1
              JE  @RETURNPOINT                  ;if so do nothing, set KEY_INPUT to default

              CMP _This.Selection, 2            ;else check if current selected was 2
              JE  @SELECTION2_UPDATEUP          ;if so then update select

              CMP _This.Selection, 3            ;else check if current selected was 3
              JE  @SELECTION3_UPDATEUP          ;if so then update select


                  @SELECTION2_UPDATEUP:         ;if select was 2

                  SUB _This.Y, 3                ;decrease Y coordinate of the '>>'
                  MOV _This.SELECTION, 1        ;update selection

                  JMP @RETURNPOINT              ;set KEY_INPUT to default


                  @SELECTION3_UPDATEUP:         ;else  if select was 3

                  SUB _This.Y, 3                ;decrease Y coordinate of the '>>'
                  MOV _This.SELECTION, 2        ;update selection

                  JMP @RETURNPOINT              ;set KEY_INPUT to default


              @CHECK_SELECTIONDOWN:             ;if down

              CALL SELECT_SOUND

              les   bx, HomeScreenAddr          ;load HomeScreenAddr to bx for resetting the cursor to default position

              CMP _This.Selection, 1            ;check if current selected was 1
              JE  @SELECTION1_UPDATEDOWN        ;if so then update select

              CMP _This.Selection, 2            ;else check if current selected was 2
              JE  @SELECTION2_UPDATEDOWN        ;if so then update select

              CMP _This.Selection, 3            ;else check if current selected was 3
              JE  @RETURNPOINT                  ;if so do nothing, set KEY_INPUT to default

                  @SELECTION1_UPDATEDOWN:       ;if select was 1

                  ADD _This.Y, 3                ;inrease Y coordinate of the '>>'
                  MOV _This.SELECTION, 2        ;update Selection

                  JMP @RETURNPOINT


                  @SELECTION2_UPDATEDOWN:       ;if select was 2

                  ADD _This.Y, 3                ;inrease Y coordinate of the '>>'
                  MOV _This.SELECTION, 3        ;update Selection

                  JMP @RETURNPOINT              ;set KEY_INPUT to default


        @RETURNPOINT:
        MOV KEY_INPUT, 00                       ;set KEY_INPUT to default

  RET
ACTION ENDP
  ;----------------------------------------------------------------------------------------
CLEAR_SCREEN PROC NEAR
  MOV AX, 0600H           ;full screen

  MOV BH, 0FH 
  MOV CX, 0000H           ;upper left row:column (00:00)
  MOV DX, 184FH           ;lower right row:column (79:23)
  INT 10H

  RET
CLEAR_SCREEN ENDP
;----------------------------------------------------------------------------------------
DELAYEVENT PROC NEAR
      mov bp, 2           ;lower value faster
      mov si, 2           ;lower value faster

    delay3:
      dec bp
      nop
      jnz delay3
      dec si
      cmp si,0
      jnz delay3
      RET
DELAYEVENT ENDP
;----------------------------------------------------------------------------------------
TOSTRING PROC NEAR
	CALL CLEARSTR
	MOV DX, 0000
	MOV BX, 10				; divisor

	CLD
	LEA SI, STR				; diri istore ang ascii values (for printing)
	ADD SI, 4					; start sa last char ang pagstore sa value

	@GETDIGIT:
		DIV BX
		ADD [SI], DL
		MOV DX, 0000
		DEC SI

		CMP AH, 0
		JNE @REPEAT

		CMP AL, 0
		JE @RETURN

		@REPEAT:
			LOOP @GETDIGIT

	@RETURN:
		RET
TOSTRING ENDP

;----------------------------------------------------------------------------------------
CLEARSTR PROC NEAR
	MOV DL, 48
	CLD
	LEA SI, STR
	MOV CX, 5

	@CLEAR:
		MOV [SI], DL
		INC SI

		LOOP @CLEAR

	RET
CLEARSTR ENDP
;----------------------------------------------------------------------------------------
DELAY PROC NEAR
      mov bp, 4           ;lower value faster
      mov si, 4           ;lower value faster

    delay2:
      dec bp
      nop
      jnz delay2
      dec si
      cmp si,0
      jnz delay2
      RET
DELAY ENDP
;----------------------------------------------------------------------------------------
DISPLAY_TIMER       PROC      NEAR  ;[proc for debugging purposes only]
  MOV   DL, 78
  MOV   DH, 24
  CALL  SET_CURSOR                ;set cursor to the bottom right of the screen

  LEA DX, GLOBAL_TIMER            ;display the current value of the counter
  MOV AH, 09
  INT 21H

  INC GLOBAL_TIMER                ;inc counter value

  ret
DISPLAY_TIMER       ENDP
;----------------------------------------------------------------------------------------
FIRE_SOUND 			PROC 			NEAR
	
                   	MOV     AL, 182
                    OUT     43H, AL
                    MOV     AX, 440
                    OUT     42H, AL
                    MOV     AL, AH
                    OUT     42H, AL
                    IN      AL, 61H
                    OR      AL, 00000011B
                    OUT     61H, AL
                    MOV     BEEPBX, 75
            .PAUSEA:
                    MOV     BEEPCX, 100
            .PAUSEB:
                    DEC     BEEPCX
                    JNE     .PAUSEB
                    DEC     BEEPBX
                    JNE     .PAUSEA
                    IN      AL, 61H
                    AND     AL, 11111100B
                    OUT     61H, AL
                    RET

	RET
FIRE_SOUND 			ENDP
;----------------------------------------------------------------------------------------
SELECT_SOUND 			PROC 			NEAR
	
                   	MOV     AL, 182
                    OUT     43H, AL
                    MOV     AX, 1000
                    OUT     42H, AL
                    MOV     AL, AH
                    OUT     42H, AL
                    IN      AL, 61H
                    OR      AL, 00000011B
                    OUT     61H, AL
                    MOV     BEEPBX, 75
            @PAUSEA:
                    MOV     BEEPCX, 100
            @PAUSEB:
                    DEC     BEEPCX
                    JNE     @PAUSEB
                    DEC     BEEPBX
                    JNE     @PAUSEA
                    IN      AL, 61H
                    AND     AL, 11111100B
                    OUT     61H, AL
                    RET

	RET
SELECT_SOUND 			ENDP
;----------------------------------------------------------------------------------------
SET_CURSOR PROC  NEAR
      MOV   AH, 02H
      MOV   BH, 00
      INT   10H
      RET
SET_CURSOR ENDP
;----------------------------------------------------------------------------------------
GET_KEY  PROC  NEAR
      MOV   AH, 01H               ;check for input
      INT   16H

      JZ    LEAVETHIS

      MOV   AH, 00H               ;get input  MOV AH, 10H; INT 16H
      INT   16H

      MOV   KEY_INPUT, AH

  LEAVETHIS:
      RET
GET_KEY  ENDP
;----------------------------------------------------------------------------------------
LOADRESOURCES 			PROC 			NEAR

	MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, GOFILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, GO_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, FRAME1FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, FRAME1_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, FRAME2FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, FRAME2_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG1FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG1_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG2FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG2_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG3FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG3_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG4FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG4_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG5FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG5_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG6FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG6_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG7FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG7_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG8FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG8_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, BG9FILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, BG9_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H

  ;-------------
  MOV AX, 3D00H           ;requst open file            ;read only; 01 (write only); 10 (read/write)
	LEA DX, HIFILE
  INT 21H

  MOV FILEHANDLE, AX

  MOV AH, 3FH             ;request read record
  MOV BX, FILEHANDLE      ;file handle
  MOV CX, 1818            ;record length
  LEA DX, HI_STR      ;address of input area
  INT 21H

  MOV AH, 3EH             ;request close file
  MOV BX, FILEHANDLE      ;file handle
  INT 21H


	
	ret
LOADRESOURCES 			ENDP
;----------------------------------------------------------------------------------------
SAVEHI 					PROC 		NEAR
	
	MOV AH, 3CH           ;request create file
  MOV CX, 00            ;normal attribute
  LEA DX, HIFILE  ;load path and file name
  INT 21H
  
  MOV FILEHANDLE, AX

  MOV AH, 40H           ;request write record
  MOV BX, FILEHANDLE    ;file handle
  MOV CX, 5           ;record length

  LEA DX, STR    ;address of output area
  INT 21H

  MOV AH, 3EH           ;request close file
  MOV BX, FILEHANDLE    ;file handle
  INT 21H


	ret
SAVEHI 			ENDP
;----------------------------------------------------------------------------------------
DRAW_SHIPS1     PROC    NEAR
  
  ;[Overall this series of repetitive task will form the shape of the ship]

  PUSH BX                       ;push the current ship's address stored in bx because we will use the bx register for color purposes

  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ship_X          ;upper left row:column (depends:depends)  depends equ ship's current x and y coordinate
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X          ;upper left row:column (depends:depends)  depends equ ship's current x and y coordinate
  MOV DH, _This.ship_Y
  MOV BH, 0FH 
  INT 10H

  POP BX                        ;re-acquire ship's current address

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR              ;set cursor to ship's current x and y axis

  MOV   AL, 219                 ;display box part of the ship
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H


  les   bx, myShipAddr          ;load myShipAddr to bx for repositioning of cursor
  ADD _This.Ship_x, 1           ;reposition cursor

  PUSH BX                       ;same process as before but for a different character and position

  MOV AX, 0600H   

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 0FH 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 91                   ; display of the character "["
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  ADD _This.Ship_x, 1

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 04H 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 62                   ; display of the character ">"
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  SUB _This.Ship_x, 3

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 0FH 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 221                   ; display of the character slim box
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  SUB _This.Ship_y, 1

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X  
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 04H 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 192                   ; display of the character wingup
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  ADD _This.Ship_y, 2

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X  
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 04H 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 218                   ; display of the character wingdown
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  SUB _This.ship_x, 1

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X 
  MOV DH, _This.ship_Y
  MOV BH, 04H 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 124                     ; display of the character double pipe
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  SUB _This.ship_y, 2

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 04H 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 124                     ; display of the character double pipe
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  ADD _This.ship_y, 1
  SUB _This.ship_x, 1


  ;240 - equivalence
  ;205 - =
  ;196 - -

  les   bx, myShipAddr             ;load myShipAddr to bx for repositioning of cursor
  CMP _This.shipFrame, 1           ;check if what frame of thrusters is being displayed (for animation purposes)
  JE @Thruster1                    ;if so then print frame1 of thrusters

  @Thruster2:                      ;else print the thrusters2

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 0EH 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 61                     ;display of the character "="
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  SUB _This.ship_X, 1

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 04H 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 45                    ;display of the character "-"
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  ADD _This.ship_X, 4

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR                ;resetting of the cursor to default position

  les   bx, myShipAddr
  MOV _This.shipFrame, 1          ;set up flag for the next frame

  RET


  @Thruster1:

  PUSH BX

  MOV AX, 0600H  

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 04H 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 240                                       ;display of character 'equivalence'
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  SUB _This.ship_X, 1

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X   
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X  
  MOV DH, _This.ship_Y
  MOV BH, 0EH 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 61                                       ;display character '='
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  SUB _This.ship_X, 1

  PUSH BX

  MOV AX, 0600H   

  MOV CL, _This.ship_X 
  MOV CH, _This.ship_Y
  MOV DL, _This.ship_X 
  MOV DH, _This.ship_Y
  MOV BH, 04H 
  INT 10H

  POP BX

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR

  MOV   AL, 45                                        ;display character '-'
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  les   bx, myShipAddr
  ADD _This.ship_X, 5

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR                                    ;resetting of the cursor to default position

  les   bx, myShipAddr
  MOV _This.shipFrame, 2                              ;setting up of flag for the next frame


  RET
DRAW_SHIPS1 ENDP
;----------------------------------------------------------------------------------------
FIREBULLET      PROC      NEAR
  
  les   bx, b1Addr              ;load bulletAddr to bx for repositioning of cursor
  CMP _This.onair, 0            ;check if bullet1 is already fired
  JE @INSTANTIATE               ;if not yet then fire/generate bullet

  les   bx, b2Addr              ;else check the next bullet (so on and so forth)
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b3Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b4Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b5Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b6Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b7Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b8Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b9Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b10Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  les   bx, b11Addr
  CMP _This.onair, 0
  JE @INSTANTIATE


  les   bx, b12Addr
  CMP _This.onair, 0
  JE @INSTANTIATE

  @INSTANTIATE:
  MOV _This.onair, 1                  ;set current bullet's status/flag  true/1/fired
  _SETXY                              ;set bullet's starting position

  ret
FIREBULLET  ENDP
;----------------------------------------------------------------------------------------
UPDATE_BULLETS      PROC      NEAR
  
  les   bx, b1Addr                    ;load bulletAddr to bx for repositioning of cursor
  CMP _This.onair, 1                  ;check if first bullet is fired
  JNE @NEXT2up                        ;if not then check the next (and the next.... next.... next)

  _UpdateBullet                       ;if so then, update the bullet's position and status

                                      ;iterate through all of the bullets
  @NEXT2up:
  les   bx, b2Addr
  CMP _This.onair, 1
  JNE @NEXT3up

  _UpdateBullet

  @NEXT3up:
  les   bx, b3Addr
  CMP _This.onair, 1
  JNE @NEXT4up

  _UpdateBullet

  @NEXT4up:
  les   bx, b4Addr
  CMP _This.onair, 1
  JNE @NEXT5up

  _UpdateBullet

  @NEXT5up:
  les   bx, b5Addr
  CMP _This.onair, 1
  JNE @NEXT6up

  _UpdateBullet

  @NEXT6up:
  les   bx, b6Addr
  CMP _This.onair, 1
  JNE @NEXT7up

  _UpdateBullet

  @NEXT7up:
  les   bx, b7Addr
  CMP _This.onair, 1
  JNE @NEXT8up

  _UpdateBullet

  @NEXT8up:
  les   bx, b8Addr
  CMP _This.onair, 1
  JNE @NEXT9up

  _UpdateBullet

  @NEXT9up:
  les   bx, b9Addr
  CMP _This.onair, 1
  JNE @NEXT10up

  _UpdateBullet

  @NEXT10up:
  les   bx, b10Addr
  CMP _This.onair, 1
  JNE @NEXT11up

  _UpdateBullet


  @NEXT11up:
  les   bx, b11Addr
  CMP _This.onair, 1
  JNE @NEXT12up

  _UpdateBullet

  @NEXT12up:
  les   bx, b12Addr
  CMP _This.onair, 1
  JNE @NEXT13up

  _UpdateBullet

  @NEXT13up:
  les   bx, b13Addr
  CMP _This.onair, 1
  JNE @NEXT14up

  _UpdateBullet

  @NEXT14up:
  les   bx, b14Addr
  CMP _This.onair, 1
  JNE @NEXT15up

  _UpdateBullet

  @NEXT15up:
  les   bx, b15Addr
  CMP _This.onair, 1
  JNE @NEXT16up

  _UpdateBullet

  @NEXT16up:
  les   bx, b16Addr
  CMP _This.onair, 1
  JNE @NEXT17up

  _UpdateBullet

  @NEXT17up:
  les   bx, b17Addr
  CMP _This.onair, 1
  JNE @NEXT18up

  _UpdateBullet

  @NEXT18up:
  les   bx, b18Addr
  CMP _This.onair, 1
  JNE @NEXT19up

  _UpdateBullet

  @NEXT19up:
  les   bx, b19Addr
  CMP _This.onair, 1
  JNE @NEXT20up

  _UpdateBullet

  @NEXT20up:
  les   bx, b20Addr
  CMP _This.onair, 1
  JNE @NEXT21up

  _UpdateBullet

  @NEXT21up:
  
  ret
UPDATE_BULLETS      ENDP
;----------------------------------------------------------------------------------------
DRAWBULLETS       PROC      NEAR
  
  les   bx, b1Addr
  CMP _This.onair, 1
  JNE @NEXT2

  _DrawBullet

  @NEXT2:
  les   bx, b2Addr
  CMP _This.onair, 1
  JNE @NEXT3

  _DrawBullet

  @NEXT3:
  les   bx, b3Addr
  CMP _This.onair, 1
  JNE @NEXT4

  _DrawBullet

  @NEXT4:
  les   bx, b4Addr
  CMP _This.onair, 1
  JNE @NEXT5

  _DrawBullet

  @NEXT5:
  les   bx, b5Addr
  CMP _This.onair, 1
  JNE @NEXT6

  _DrawBullet

  @NEXT6:
  les   bx, b6Addr
  CMP _This.onair, 1
  JNE @NEXT7

  _DrawBullet

  @NEXT7:
  les   bx, b7Addr
  CMP _This.onair, 1
  JNE @NEXT8

  _DrawBullet

  @NEXT8:
  les   bx, b8Addr
  CMP _This.onair, 1
  JNE @NEXT9

  _DrawBullet

  @NEXT9:
  les   bx, b9Addr
  CMP _This.onair, 1
  JNE @NEXT10

  _DrawBullet

  @NEXT10:

  les   bx, b10Addr
  CMP _This.onair, 1
  JNE @NEXT11

  _DrawBullet

  @NEXT11:

  les   bx, b11Addr
  CMP _This.onair, 1
  JNE @NEXT12

  _DrawBullet

  @NEXT12:

  les   bx, b12Addr
  CMP _This.onair, 1
  JNE @NEXT13

  _DrawBullet

  @NEXT13:

  les   bx, b13Addr
  CMP _This.onair, 1
  JNE @NEXT14

  _DrawBullet

  @NEXT14:

  les   bx, b14Addr
  CMP _This.onair, 1
  JNE @NEXT15

  _DrawBullet

  @NEXT15:

  les   bx, b15Addr
  CMP _This.onair, 1
  JNE @NEXT16

  _DrawBullet

  @NEXT16:

  les   bx, b16Addr
  CMP _This.onair, 1
  JNE @NEXT17

  _DrawBullet

  @NEXT17:

  les   bx, b17Addr
  CMP _This.onair, 1
  JNE @NEXT18

  _DrawBullet

  @NEXT18:

  les   bx, b18Addr
  CMP _This.onair, 1
  JNE @NEXT19

  _DrawBullet

  @NEXT19:
  les   bx, b19Addr
  CMP _This.onair, 1
  JNE @NEXT20

  _DrawBullet

  @NEXT20:
  les   bx, b20Addr
  CMP _This.onair, 1
  JNE @NEXT21

  _DrawBullet

  @NEXT21:

  ret
DRAWBULLETS   ENDP

;----------------------------------------------------------------------------------------
GENERATEIC      PROC      NEAR
  
  les   bx, ic1Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic2Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic3Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic4Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic5Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic6Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic7Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic8Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic9Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic10Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic11Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  les   bx, ic12Addr
  CMP _This.active, 0
  JE @INSTANTIATEIC

  ret

  @INSTANTIATEIC:
  MOV _This.active, 1
  _ICSETXY

  ret
GENERATEIC      ENDP
;----------------------------------------------------------------------------------------
GEN  PROC NEAR
  
  les   bx, ic1Addr
  CMP _This.active, 0
  JE @INSTANT

  ret

  @INSTANT:
  MOV _This.active, 1
  _ICSETXY

  ret
GEN ENDP
;----------------------------------------------------------------------------------------
DRAWICS      PROC      NEAR

  les   bx, ic1Addr
  CMP _This.active, 1
  JNE @ICNEXT2

  _DRAWIC
  ;_UpdateIC

  @ICNEXT2:
  les   bx, ic2Addr
  CMP _This.active, 1
  JNE @ICNEXT3

  _DRAWIC
  ;_UpdateIC
  @ICNEXT3:
  les   bx, ic3Addr
  CMP _This.active, 1
  JNE @ICNEXT4

  _DRAWIC
  ;_UpdateIC

  @ICNEXT4:
  les   bx, ic4Addr
  CMP _This.active, 1
  JNE @ICNEXT5

  _DRAWIC
  ;_UpdateIC

  @ICNEXT5:
  les   bx, ic5Addr
  CMP _This.active, 1
  JNE @ICNEXT6

  _DRAWIC
  ;_UpdateIC

  @ICNEXT6:
  les   bx, ic6Addr
  CMP _This.active, 1
  JNE @ICNEXT7

  _DRAWIC
  ;_UpdateIC

  @ICNEXT7:
  les   bx, ic7Addr
  CMP _This.active, 1
  JNE @ICNEXT8

  _DRAWIC
  ;_UpdateIC

  @ICNEXT8:
  les   bx, ic8Addr
  CMP _This.active, 1
  JNE @ICNEXT9

  _DRAWIC
  ;_UpdateIC

  @ICNEXT9:
  les   bx, ic9Addr
  CMP _This.active, 1
  JNE @ICNEXT10

  _DRAWIC
  ;_UpdateIC

  @ICNEXT10:
  les   bx, ic10Addr
  CMP _This.active, 1
  JNE @ICNEXT11

  _DRAWIC
  ;_UpdateIC

  @ICNEXT11:
  les   bx, ic11Addr
  CMP _This.active, 1
  JNE @ICNEXT12

  _DRAWIC
  ;_UpdateIC

  @ICNEXT12:
  les   bx, ic12Addr
  CMP _This.active, 1
  JNE @ICNEXT13

  _DRAWIC
  ;_UpdateIC

  @ICNEXT13:
  
  ret
DRAWICS      ENDP
;----------------------------------------------------------------------------------------
UPDATEICS      PROC      NEAR
  
  les   bx, ic1Addr
  CMP _This.active, 1
  JNE @ICNEXTup2

  _UpdateIC

  @ICNEXTup2:
  les   bx, ic2Addr
  CMP _This.active, 1
  JNE @ICNEXTup3

  _UpdateIC

  @ICNEXTup3:
  les   bx, ic3Addr
  CMP _This.active, 1
  JNE @ICNEXTup4

  _UpdateIC

  @ICNEXTup4:
  les   bx, ic4Addr
  CMP _This.active, 1
  JNE @ICNEXTup5

  _UpdateIC

  @ICNEXTup5:
  les   bx, ic5Addr
  CMP _This.active, 1
  JNE @ICNEXTup6

  _UpdateIC

  @ICNEXTup6:
  les   bx, ic6Addr
  CMP _This.active, 1
  JNE @ICNEXTup7

  _UpdateIC

  @ICNEXTup7:
  les   bx, ic7Addr
  CMP _This.active, 1
  JNE @ICNEXTup8

  _UpdateIC

  @ICNEXTup8:
  les   bx, ic8Addr
  CMP _This.active, 1
  JNE @ICNEXTup9

  _UpdateIC

  @ICNEXTup9:
  les   bx, ic9Addr
  CMP _This.active, 1
  JNE @ICNEXTup10

  _UpdateIC

  @ICNEXTup10:
  les   bx, ic10Addr
  CMP _This.active, 1
  JNE @ICNEXTup11

  _UpdateIC

  @ICNEXTup11:
  les   bx, ic11Addr
  CMP _This.active, 1
  JNE @ICNEXTup12

  _UpdateIC

  @ICNEXTup12:
  les   bx, ic12Addr
  CMP _This.active, 1
  JNE @ICNEXTup13

  _UpdateIC

  @ICNEXTup13:
  
  ret
UPDATEICS      ENDP
;----------------------------------------------------------------------------------------
TRAILER1 			PROC 				NEAR
	
	PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 04H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 35  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX
  ADD _This.ic_Y, 1 						;upper right corner of the meteor

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 0EH                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 96  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  SUB _This.ic_Y, 2 						;upper right corner of the meteor

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 0EH                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 44  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_Y, 1 						;upper right corner of the meteor
  ADD _This.ic_X, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 0EH                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 240  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_X, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 04H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 61  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_X, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 0EH                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 45  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX
	
	SUB _This.ic_X, 9 						;this will become -8
  ADD _This.ic_Y, 0

  MOV _This.icFrame, 2

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position


  les bx, myShipAddr            ;load myShipAddr to bx for resetting the cursor to default position

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR              ;set the cursor to the ship (default cursor position)

 		RET
TRAILER1 			ENDP
;----------------------------------------------------------------------------------------
TRAILER2 			PROC 				NEAR

	PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 0EH                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 240  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_Y, 1 						;upper right corner of the meteor

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 04H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 169  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  SUB _This.ic_Y, 2 						;upper right corner of the meteor

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 04H                   ;set enemies to color 4:red     C: bright red
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 28  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_Y, 1 						;upper right corner of the meteor
  ADD _This.ic_X, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 04H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 61  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_X, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 0EH                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 45  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  SUB _This.ic_Y, 1

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 04H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 44  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  ADD _This.ic_Y, 2

  PUSH BX
  
  MOV AX, 0600H                 ;full screen

  MOV CL, _This.ic_X            ;upper left row:column (depends:depends)  depends equ bullet's current x and y coordinate
  MOV CH, _This.ic_Y
  MOV DL, _This.ic_X            ;lower right row:column (depends:depends) depends equ bullet's current x and y coordinate
  MOV DH, _This.ic_Y
  MOV BH, 04H                   ;set enemies to color magenta/purple
  INT 10H                       ;unit clearscreen

  POP BX                        ;re-acquire current bullet's address
  PUSH BX

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  MOV   AL, 96  ; "Þ"          ;display of the INTERCEPTOR enemy character
  MOV   AH, 02H
  MOV   DL, AL
  INT   21H

  POP BX

  SUB _This.ic_X, 7 						;this will become -8
  SUB _This.ic_Y, 1

  MOV _This.icFrame, 1

  MOV DL, _This.ic_X
  MOV DH, _This.ic_Y
  CALL SET_CURSOR               ;mov cursor to the bullet's position

  les bx, myShipAddr            ;load myShipAddr to bx for resetting the cursor to default position

  MOV   DL, _This.ship_X
  MOV   DH, _This.ship_Y
  CALL  SET_CURSOR              ;set the cursor to the ship (default cursor position)

 		RET
TRAILER2 			ENDP
;----------------------------------------------------------------------------------------

END START