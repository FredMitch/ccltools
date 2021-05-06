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
     H*  PROGRAM NAME.: CCL102                                        *
     H*                                                               *
     H*  PROGRAM DESC.: DISPLAY FIELD DESCRIPTIONS                    *
     H*                                                               *
     H*  DATE.........: 17/07/98                                      *
     H*                                                               *
     H*  AUTHOR.......: FRED MITCHELL                                 *
     H*                                                               *
     H*             (C) COPYRIGHT CONCISE CONSULTING LTD.             *
     H*****************************************************************
     FCCL101W   IF   E           K DISK
     FCCL102D   CF   E             WORKSTN
     F                                     SFILE(F01SFL:RRECNO)
     D                SDS
     D  USERID               254    263
     D                 DS
     D  FILLIB                 1     20
     D  WHFILE                 1     10
     D  WHLIB                 11     20
     D                 DS
     D  W2A                    1      2
     D  W2A1                   1      1
     D  W2A2                   2      2
     D                 DS
     D  W5A                    1      5
     D  W5A1                   1      1
     D  W5A2                   2      2
     D  W5A3                   3      3
     D  W5A4                   4      4
     D  W5A5                   5      5
     C*
     C* RECEIVE ENTRY PARAMETERS
     C     *ENTRY        PLIST
     C                   PARM                    TEXT
     C*
     C* INITIALISE SUBFILE
     C                   Z-ADD     1             RRECNO            3 0
     C                   SETON                                        97
     C                   WRITE     F01CTL
     C                   SETOFF                                       97
     C*
     C* READ FILE AND WRITE TO SUBFILE
     C                   READ      CCL101W                              9999
B01  C     *IN99         DOWEQ     '0'
     C*
B02  C     *IN26         IFEQ      '0'
     C                   MOVE      *BLANKS       FILE
     C     WHLIB         CAT       '/':0         FILE
     C     FILE          CAT       WHFILE:0      FILE
     C                   SETON                                        26
E02  C                   END
     C*
     C                   MOVE      *BLANKS       DESC
     C                   MOVEL     WHFTXT        DESC
     C*          WHCHD1    CAT  WHCHD2:1  DESC
     C*          DESC      CAT  WHCHD3:1  DESC
     C*
     C                   MOVE      *BLANKS       SIZE
     C                   MOVE      *BLANKS       W5A
     C                   MOVE      *BLANKS       W2A
B02  C     WHFLDT        IFEQ      'A'
     C                   MOVE      WHFLDB        W5A
B03  C     W5A1          IFEQ      '0'
     C                   MOVE      *BLANKS       W5A1
X03  C                   ELSE
-->  C                   GOTO      L020
E03  C                   END
B03  C     W5A2          IFEQ      '0'
     C                   MOVE      *BLANKS       W5A2
X03  C                   ELSE
-->  C                   GOTO      L020
E03  C                   END
B03  C     W5A3          IFEQ      '0'
     C                   MOVE      *BLANKS       W5A3
X03  C                   ELSE
-->  C                   GOTO      L020
E03  C                   END
B03  C     W5A4          IFEQ      '0'
     C                   MOVE      *BLANKS       W5A4
X03  C                   ELSE
-->  C                   GOTO      L020
E03  C                   END
     C     L020          TAG
     C                   MOVE      W5A           SIZE
X02  C                   ELSE
     C                   MOVE      WHFLDD        W5A
B03  C     W5A4          IFEQ      '0'
     C                   MOVE      *BLANKS       W5A4
E03  C                   END
     C     L030          TAG
     C                   MOVE      WHFLDP        W2A
B03  C     W2A1          IFEQ      '0'
     C                   MOVE      ','           W2A1
     C                   MOVEL     W5A           W7A               7
     C                   MOVE      W2A           W7A
     C                   MOVE      W7A           SIZE
X03  C                   ELSE
     C                   MOVE      W2A           W3A               3
     C                   MOVEL     ','           W3A
     C                   MOVEL     W5A           W8A               8
     C                   MOVE      W8A           SIZE
E03  C                   END
E02  C                   END
     C     WHFOBO        ADD       WHFLDB        ENDPOS
     C                   SUB       1             ENDPOS
     C*
     C                   WRITE     F01SFL
     C                   ADD       1             RRECNO
     C*
     C                   READ      CCL101W                              9999
E01  C                   END
     C*
     C* ENSURE SUB FILE IS NOT EMPTY
-->  C     RRECNO        CABEQ     0             END
     C*
     C* DISPLAY SUBFILE
     C     L010          TAG
     C                   WRITE     F01TRL
     C                   EXFMT     F01CTL
     C*
     C* CHECK FOR COMMAND KEY 3
-->  C     *INKC         CABEQ     '1'           END
     C*
     C* CHECK FOR COMMAND KEY 12
-->  C     *INKL         CABEQ     '1'           END
     C*
     C* CHECK FOR COMMAND KEY 09 - DISPLAY KEY FIELDS
B01  C     *INKI         IFEQ      '1'
     C                   CALL      'CCL109'
     C                   PARM                    FILLIB
     C                   PARM                    RETCDE            1
-->  C     RETCDE        CABEQ     'X'           END
E01  C                   END
     C*
     C* CHECK FOR COMMAND KEY 10/PRINT KEY - PRINT
B01  C     *INKJ         IFEQ      '1'
*01  C     *IN10         OREQ      '1'
     C                   CALL      'CCL104'
     C                   PARM                    TEXT
E01  C                   END
     C*
     C* CHECK FOR COMMAND KEY 11 - DISPLAY DEPENDENCIES
B01  C     *INKK         IFEQ      '1'
     C                   CALL      'CCL106'
     C                   PARM                    FILLIB
     C                   PARM                    RETCDE
-->  C     RETCDE        CABEQ     'X'           END
E01  C                   END
     C*
     C* OTHERWISE, RE-DISPLAY SUBFILE
-->  C                   GOTO      L010
     C*
     C* END OF PROGRAM
     C     END           TAG
     C************************
     C                   SETON                                        LR
     C                   RETURN
     C********************************************************************
