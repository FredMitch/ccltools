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
     H*  PROGRAM NAME.: CCL107                                        *
     H*                                                               *
     H*  PROGRAM DESC.: DISPLAY FILE DEPENDENCIES                     *
     H*                                                               *
     H*  DATE.........: 17/07/98                                      *
     H*                                                               *
     H*  AUTHOR.......: FRED MITCHELL                                 *
     H*                                                               *
     H*             (C) COPYRIGHT CONCISE CONSULTING LTD.             *
     H*****************************************************************
     FCCL106W   IF   E           K DISK
     FCCL107D   CF   E             WORKSTN
     F                                     SFILE(F01SFL:RRECNO)
     D                SDS
     D  USERID               254    263
     D                 DS
     D  FILLIB                 1     20
     D  WHREFI                 1     10
     D  WHRELI                11     20
     C*
     C* RECEIVE ENTRY PARAMETERS
     C     *ENTRY        PLIST
     C                   PARM                    TEXT
     C                   PARM                    RETCDE            1
     C* INITIALISE SUBFILE
     C                   Z-ADD     1             RRECNO            3 0
     C                   SETON                                        97
     C                   WRITE     F01CTL
     C                   SETOFF                                       97
     C*
     C* READ FILE AND WRITE TO SUBFILE
     C                   READ      CCL106W                              9999
B01  C     *IN99         DOWEQ     '0'
     C*
B02  C     *IN26         IFEQ      '0'
     C                   MOVE      *BLANKS       FILE
     C     WHRLI         CAT       '/':0         FILE
     C     FILE          CAT       WHRFI:0       FILE
     C                   SETON                                        26
E02  C                   END
     C*
B02  C     WHNO          IFNE      0
     C                   WRITE     F01SFL
     C                   ADD       1             RRECNO
E02  C                   END
     C*
     C                   READ      CCL106W                              9999
E01  C                   END
     C*
     C* ENSURE SUB FILE IS NOT EMPTY
-->  C     RRECNO        CABEQ     1             END
     C*
     C* DISPLAY SUBFILE
     C                   Z-ADD     RRECNO        HIRRNO            3 0
     C     L010          TAG
     C                   WRITE     F01TRL
     C                   EXFMT     F01CTL
     C*
     C* CHECK FOR COMMAND KEY 3
B01  C     *INKC         IFEQ      '1'
     C                   MOVE      'X'           RETCDE
-->  C                   GOTO      END
E01  C                   END
     C*
     C* CHECK FOR COMMAND KEY 12
-->  C     *INKL         CABEQ     '1'           END
     C*
     C* CHECK FOR REQUEST TO DISPLAY KEY
     C     L020          TAG
B01  C     1             DO        HIRRNO        X                 3 0
     C     X             CHAIN     F01SFL                             99
B02  C     *IN99         IFEQ      '0'
+02  C     SELECT        ANDEQ     '1'
     C                   MOVE      ' '           RETCDE            1
     C                   CALL      'CCL109'
     C                   PARM                    FILLIB
     C                   PARM                    RETCDE
     C                   MOVE      *BLANKS       SELECT
     C                   UPDATE    F01SFL
-->  C     RETCDE        CABEQ     'X'           END
-->  C                   GOTO      L020
E02  C                   END
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
