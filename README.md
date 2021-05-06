# ccltools

 IBMi (AS400) file utilities

 These tools are designed to run on an IBMi (AS400) and were originally developed in 1998 using RPG3.

 The available commands are:

  DSPFLD - Display file structure
  
  DSPDEP - Display logical files built over a physical file
  
  DSPKEY - Display key of a file
  
  PRTFLD - Print a file structure
  
  WRKLDA - Display and change the *LDA

 To create these utilities run the following commands:

  CRTLIB LIB(CCLTOOLS)
  
  ADDLIBLE LIB(CCLTOOLS)
  
  CRTSRCPF FILE(CCLTOOLS/CCLTOOLSRC)
  
  Upload the source members to CCLTOOLS/CCLTOOLSRC ensuring the source types are correct.
  
  CRTBNDCL PGM(CCLTOOLS/CCLCRTTOOL) SRCFILE(CCLTOOLS/CCLTOOLSRC) 
  
  CALL PGM(CCLTOOLS/CCLCRTTOOL)

 Once the command has completed normally and all objects are created you can run the commands as follows:

  CCLTOOLS/DSPFLD <file_library>/<file_name>
  
  CCLTOOLS/DSPDEP <file_library>/<file_name>
  
  CCLTOOLS/DSPKEY <file_library>/<file_name>  
  
  CCLTOOLS/PRTFLD <file_library>/<file_name>
  
  CCLTOOLS/WRKLDA


  
