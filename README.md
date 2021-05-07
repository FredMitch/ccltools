# ccltools

 <B>IBMi (AS400) file utilities</b>

 These tools are designed to run on an IBMi (AS400) and were originally developed in 1998 using RPG3.  
 
 The method used in all of these programs is you run an IBM command such as DSPFFD, with the parameter OUTPUT(*OUTFILE) and then to read/format the output file for display.  Over the years, IBM have modernised how this information can be retrieved and SQL is now the preferred method.  I have included a file examples.sql which shows how this is done.
 
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


  
