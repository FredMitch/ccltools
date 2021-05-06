
     h dftactgrp(*no)
     h actgrp('CCL400')
     h datfmt(*ymd)
     h datedit(*dmy)
     h debug
     h option(*nodebugio:*srcstmt)
     h copyright('(c) Copyright Concise Consulting Ltd.')
     H*****************************************************************
     H*                                                               *
     H*  SYSTEM NAME..: CCL400                                        *
     H*                                                               *
     H*  PROGRAM NAME.: CCL114                                        *
     H*                                                               *
     H*  PROGRAM DESC.: WORK WITH THE *LDA                            *
     H*                                                               *
     H*  DATE.........: 17/07/98                                      *
     H*                                                               *
     H*  AUTHOR.......: FRED MITCHELL                                 *
     H*                                                               *
     H*             (C) COPYRIGHT CONCISE CONSULTING LTD.             *
     H*****************************************************************
     FCCL114D   CF   E             WORKSTN
     D*
     D                SDS
     D  USERID               254    263
     D*
     D LDA             DS
     D  L#CONO                 1      2
     D  L#CONM                 3     37
     D  L#PRQU                38     47
     D  L#PLIB                48     57
     D  L#JOBQ                58     67
     D  L#JOBL                68     77
     D  L#DFNM                78     87
     D  L#FMTN                88     97
     D  L#PGID                98    107
     D  L#JOBN               108    117
     D  L#RTCD               118    119
     D  L#USER               120    129
     D  L#APPN               130    131
     D  L#FUNC               132    135
     D  L#HOLD               136    136
     D  L#LIBL               137    140
     D  L#CUSC               141    143
     D  L#JBNO               144    152
     D  L#SOFF               153    153
     D  L#MNCO               154    154
     D  L#RSTA               155    155
     D  L#EXCL               156    156
     D  L#TERM               157    166
     D  L#RLSL               167    168
     D  L#APSR               169    169
     D  L#GLCO               170    171
     D  L#PRCO               172    173
     D  L#XXCO               174    175
     D  L#CPFN               176    181
     D  L#HPCD               182    183
     D  L#NAPS               184    184
     D  L#SBMX               185    185
     D  L#DTFM               186    186
     D  L#LANG               187    188
     D  L#AACD               189    197
     D  L#IDAT               198    204
     D  L#EDAT               205    210
     D  L#LGLB               211    220
     D  L#MENU               221    230
     D  L#INAM               231    240
     D  L#CROW               241    241
     D  L#CCOL               242    242
     D  L#MCUR               243    243
     D  L#USAF               244    244
     D  L#VATF               245    245
     D  L#WHCD               246    247
     D  L#RSVD               248    256
     D  L#NRM1                 1     50
     D  L#NRM2                51    100
     D  L#NRM3               101    150
     D  L#NRM4               151    200
     D  L#NRM5               201    250
     D  L#NRM6               251    256
     D  L#WK11               257    300
     D  L#WK12               301    350
     D  L#WK13               351    400
     D  L#WK14               401    450
     D  L#WK15               451    500
     D  L#WK16               501    512
     D  L#WK21               513    550
     D  L#WK22               551    600
     D  L#WK23               601    650
     D  L#WK24               651    700
     D  L#WK25               701    750
     D  L#WK26               751    768
     D  L#AST1               769    800
     D  L#AST2               801    850
     D  L#AST3               851    900
     D  L#AST4               901    950
     D  L#AST5               951   1000
     D  L#AST6              1001   1024
     C/EJECT
     C*****************************************************************
     C* MAINLINE PROCESSING
     C*****************************************************************
     C*
     C* DISPLAY FIRST SCREEN
     C     DSPSC1        TAG
     C                   EXFMT     F01
     C*
     C* CHECK FOR COMMAND KEY 3
-->  C     *INKC         CABEQ     '1'           END
     C*
     C* CHECK FOR COMMAND KEY 8
-->  C     *INKH         CABEQ     '1'           UPDLDA
     C*
     C* CHECK FOR COMMAND KEY 11
B01  C     *INKK         IFEQ      '1'
     C                   EXFMT     F01A
     C*
     C* CHECK FOR COMMAND KEY 3
-->  C     *INKC         CABEQ     '1'           END
     C*
     C* CHECK FOR COMMAND KEY 8
-->  C     *INKH         CABEQ     '1'           UPDLDA
E01  C                   END
     C*
     C* CHECK FOR COMMAND KEY 11
-->  C     *INKK         CABEQ     '1'           DSPSC1
     C*
     C* DISPLAY SECOND SCREEN
     C     DSPSC2        TAG
     C                   EXFMT     F02
     C*
     C* CHECK FOR COMMAND KEY 3
-->  C     *INKC         CABEQ     '1'           END
     C*
     C* CHECK FOR COMMAND KEY 8
-->  C     *INKH         CABEQ     '1'           UPDLDA
     C*
     C* CHECK FOR COMMAND KEY 12
-->  C     *INKL         CABEQ     '1'           DSPSC1
     C*
     C* DISPLAY THIRD SCREEN
     C     DSPSC3        TAG
     C                   EXFMT     F03
     C*
     C* CHECK FOR COMMAND KEY 3
-->  C     *INKC         CABEQ     '1'           END
     C*
     C* CHECK FOR COMMAND KEY 8
-->  C     *INKH         CABEQ     '1'           UPDLDA
     C*
     C* CHECK FOR COMMAND KEY 12
-->  C     *INKL         CABEQ     '1'           DSPSC2
     C*
     C* DISPLAY FOURTH SCREEN
     C     DSPSC4        TAG
     C                   EXFMT     F04
     C*
     C* CHECK FOR COMMAND KEY 3
-->  C     *INKC         CABEQ     '1'           END
     C*
     C* CHECK FOR COMMAND KEY 8
-->  C     *INKH         CABEQ     '1'           UPDLDA
     C*
     C* CHECK FOR COMMAND KEY 12
-->  C     *INKL         CABEQ     '1'           DSPSC3
     C*
     C* UPDATE LDA
     C     UPDLDA        TAG
     C                   OUT       LDA
     C*
     C* END OF PROGRAM
     C     END           TAG
     C                   SETON                                        LR
     C                   RETURN
     C*****************************************************************
     C/EJECT
     C*****************************************************************
     C* *INZSR - INITIALISATION SUBROUTINE
     C*****************************************************************
S01  C     *INZSR        BEGSR
     C*
     C* RETRIEVE LDA
     C     *DTAARA       DEFINE    *LDA          LDA
     C                   IN        LDA
     C*
S01  C                   ENDSR
     C*****************************************************************
