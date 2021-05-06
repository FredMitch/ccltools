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
     H*  PROGRAM NAME.: CCL104                                        *
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
     FQPRINTA4  O    F   80        PRINTER OFLIND(*INOA)
     F                                     FORMLEN(70)
     F                                     FORMOFL(60)
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
     C                   PARM                    TEXT             50
     C*
     C* READ FILE AND WRITE TO SUBFILE
     C                   READ      CCL101W                              9999
B01  C     *IN99         DOWEQ     '0'
     C*
     C* FIRST READ OF FILE
B02  C     *IN26         IFEQ      '0'
     C*
     C                   MOVE      *BLANKS       FILE             21
     C     WHLIB         CAT       '/':0         FILE
     C     FILE          CAT       WHFILE:0      FILE
     C*
     C                   TIME                    CLOCK             6 0
     C                   Z-ADD     0             PAGE
     C                   EXCEPT    HEADS
     C*
     C                   SETON                                        26
     C*
E02  C                   END
     C*
     C                   MOVE      *BLANKS       DESC             36
     C                   MOVEL     WHFTXT        DESC
     C*          WHCHD1    CAT  WHCHD2:1  DESC
     C*          DESC      CAT  WHCHD3:1  DESC
     C*
     C                   MOVE      *BLANKS       SIZE              8
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
     C     WHFOBO        ADD       WHFLDB        ENDPOS            5 0
     C                   SUB       1             ENDPOS
     C*
     C                   EXCEPT    DETL
     C*
     C                   READ      CCL101W                              9999
E01  C                   END
     C*
     C* END OF PROGRAM
     C     END           TAG
     C                   SETON                                        LR
     C                   RETURN
     C********************************************************************
     OQPRINTA4  E            HEADS            02
     O         OR    OA                       02
     O                       TEXT                55
     O                       PAGE          Z     77
     O                                           75 'Page:'
     O          E            HEADS       3
     O         OR    OA                  3
     O                                           19 'File Name:    '
     O                       WHFILE            +  1
     O          E            HEADS       1
     O         OR    OA                  1
     O                                           19 'Record Format:'
     O                       WHNAME            +  1
     O          E            HEADS       3
     O         OR    OA                  3
     O                                           21 'Size/'
     O          E            HEADS       1
     O         OR    OA                  1
     O                                           15 'Field Name'
     O                                           21 'Type'
     O                                           34 'Description'
     O                                           65 'Start'
     O                                           71 '  End'
     O                                           77 '  Len'
     O          E            HEADS       1  1
     O         OR    OA                  1  1
     O                                           15 '----------'
     O                                           21 '----'
     O                                           34 '-----------'
     O                                           65 '-----'
     O                                           71 '  ---'
     O                                           77 '  ---'
     O          EF           DETL        1
     O                       SIZE                19
     O                       WHFLDE              15
     O                       WHFLDT              21
     O                       DESC                59
     O                       WHFOBO        3     65
     O                       ENDPOS        3     71
     O                       WHFLDB        3     77
