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
     H*  PROGRAM NAME.: CCL110                                        *
     H*                                                               *
     H*  PROGRAM DESC.: DISPLAY KEY FIELDS                            *
     H*                                                               *
     H*  DATE.........: 17/07/98                                      *
     H*                                                               *
     H*  AUTHOR.......: FRED MITCHELL                                 *
     H*                                                               *
     H*             (C) COPYRIGHT CONCISE CONSULTING LTD.             *
     H*****************************************************************
     FCCL109W   IF   E           K DISK
     FCCL109X   IF   E           K DISK    USROPN
     FCCL110D   CF   E             WORKSTN
     F                                     SFILE(F01SFL:RRECNO)
     D                SDS
     D  USERID               254    263
     C*
     C* RECEIVE ENTRY PARAMETERS
     C     *ENTRY        PLIST
     C                   PARM                    TEXT
     C                   PARM                    LOGICL            1
     C                   PARM                    RETCDE            1
     C* INITIALISE SUBFILE
     C                   Z-ADD     1             RRECNO            3 0
     C                   SETON                                        97
     C                   WRITE     F01CTL
     C                   SETOFF                                       97
     C*
     C* READ FILE AND WRITE TO SUBFILE
     C                   SETOFF                                       11
     C                   READ      CCL109W                              9999
B01  C     *IN99         DOWEQ     '0'
     C*
     C                   MOVE      *BLANKS       FIELD
     C                   MOVEL     APKEYF        FIELD
     C*
     C                   MOVE      *BLANKS       SEQN
B02  C     APKSEQ        IFEQ      'A'
     C                   MOVE      'Ascend '     SEQN
E02  C                   END
B02  C     APKSEQ        IFEQ      'D'
     C                   MOVE      'Descend'     SEQN
E02  C                   END
     C*
     C                   MOVE      *BLANKS       SELOMT
     C*
B02  C     *IN26         IFEQ      '0'
     C                   MOVE      *BLANKS       FILE
     C     APLIB         CAT       '/':0         FILE
     C     FILE          CAT       APFILE:0      FILE
B03  C     APFTYP        IFNE      'P'
     C                   SETON                                        11
     C                   MOVE      *BLANKS       BOFILE
     C     APBOL         CAT       '/':0         BOFILE
     C     BOFILE        CAT       APBOF:0       BOFILE
E03  C                   END
     C                   SETON                                        26
E02  C                   END
     C*
     C                   WRITE     F01SFL
     C                   ADD       1             RRECNO
     C*
     C                   READ      CCL109W                              9999
E01  C                   END
     C*
     C* READ FILE AND WRITE TO SUBFILE (SELECT/OMIT)
B01  C     LOGICL        IFEQ      'Y'
     C                   OPEN      CCL109X
     C                   READ      CCL109X                              9999
B02  C     *IN99         DOWEQ     '0'
     C*
     C                   MOVE      *BLANKS       FIELD
     C                   MOVEL     SOFLD         FIELD
     C*
     C                   MOVE      *BLANKS       SEQN
B03  C     SORULE        IFEQ      'S'
     C                   MOVE      'Select '     SEQN
E03  C                   END
B03  C     SORULE        IFEQ      'O'
     C                   MOVE      'Omit   '     SEQN
E03  C                   END
B03  C     SORULE        IFEQ      'A'
     C                   MOVE      'And    '     SEQN
E03  C                   END
     C*
     C                   MOVE      *BLANKS       SELOMT
     C     SOCOMP        CAT       SOVALU:1      SELOMT
     C*
     C                   WRITE     F01SFL
     C                   ADD       1             RRECNO
     C*
     C                   READ      CCL109X                              9999
E02  C                   END
     C                   CLOSE     CCL109X
E01  C                   END
     C*
     C* ENSURE SUB FILE IS NOT EMPTY
-->  C     RRECNO        CABEQ     1             END
     C*
     C* DISPLAY SUBFILE
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
     C* OTHERWISE, RE-DISPLAY SUBFILE
-->  C                   GOTO      L010
     C*
     C* END OF PROGRAM
     C     END           TAG
     C************************
     C                   SETON                                        LR
     C                   RETURN
     C********************************************************************
