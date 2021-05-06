/*                                                                 */
             CMD        PROMPT('Display File Dependencies')
/*                                                                 */
             PARM       KWD(FILE) TYPE(QUAL1) MIN(1) +
                          PROMPT('File name')
/*                                                                 */
QUAL1:       QUAL       TYPE(*NAME) LEN(10) EXPR(*YES)
             QUAL       TYPE(*NAME) LEN(10) DFT(*LIBL) EXPR(*YES) +
                          SPCVAL((*LIBL)) PROMPT('Library name')
