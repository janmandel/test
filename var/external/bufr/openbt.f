      SUBROUTINE OPENBT(LUNDX,MTYP)

C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C
C SUBPROGRAM:    OPENBT
C   PRGMMR: WOOLLEN          ORG: NP20       DATE: 1998-07-08
C
C ABSTRACT: THIS IS A DUMMY SUBROUTINE WHICH ALWAYS RETURNS LUNDX = 0.
C   OPENBT MUST BE PRESENT BECAUSE IT IS CALLED BY BUFR ARCHIVE LIBRARY
C   SUBROUTINE CKTABA AS A LAST RESORT TO TRY AND FIND AN EXTERNAL
C   USER-SUPPLIED BUFR DICTIONARY TABLE FILE IN CHARACTER FORMAT FROM
C   WHICH A TABLE A MNEMONIC CAN BE LOCATED.  IF THE APPLICATION
C   PROGRAM DOES NOT HAVE AN IN-LINE VERSION OF OPENBT (OVERRIDING THIS
C   ONE), THEN THE RETURNED LUNDX = 0 WILL RESULT IN CKTABA RETURNING
C   WITHOUT FINDING A TABLE A MNEMONIC BECAUSE THERE IS NO LINK TO ANY
C   EXTERNAL BUFR TABLES.  NORMALLY, IT IS EXPECTED THAT AN IN-LINE
C   VERSION OF THIS SUBROUTINE WILL ACTUALLY FIND THE APPROPRIATE
C   EXTERNAL BUFR TABLE.
C
C PROGRAM HISTORY LOG:
C 1998-07-08  J. WOOLLEN -- ORIGINAL AUTHOR
C 2003-11-04  S. BENDER  -- ADDED REMARKS/BUFRLIB ROUTINE
C                           INTERDEPENDENCIES
C 2003-11-04  D. KEYSER  -- UNIFIED/PORTABLE FOR WRF; ADDED
C                           DOCUMENTATION (INCLUDING HISTORY); ADDED
C                           MORE COMPLETE DIAGNOSTIC INFO WHEN UNUSUAL
C                           THINGS HAPPEN
C 2009-04-21  J. ATOR    -- USE ERRWRT
C
C USAGE:    CALL OPENBT (LUNDX, MTYP)
C   INPUT ARGUMENT LIST:
C     MTYP     - INTEGER: DUMMY {IN AN APPLICATION PROGRAM (IN-LINE)
C                THIS WOULD BE THE BUFR MESSAGE TYPE}
C
C   OUTPUT ARGUMENT LIST:
C     LUNDX    - INTEGER: DUMMY, ALWAYS RETURNED AS ZERO {IN AN
C                APPLICATION PROGRAM (IN-LINE) THIS WOULD BE THE
C                FORTRAN LOGICAL UNIT NUMBER CONNECTED TO THE FILE
C                CONTAINING THE EXTERNAL BUFR TABLE}
C
C REMARKS:
C    THIS ROUTINE CALLS:        ERRWRT
C    THIS ROUTINE (IN BUFR
C    ARCHIVE LIBRARY):          Called by CKTABA only to allow the
C                               BUFR ARCHIVE LIBRARY to compile, CKTABA
C                               and any application programs should
C                               always call a version of OPENBT in-line
C                               in the application program.
C
C ATTRIBUTES:
C   LANGUAGE: FORTRAN 77
C   MACHINE:  PORTABLE TO ALL PLATFORMS
C
C$$$

      COMMON /QUIET / IPRT

      CHARACTER*128 ERRSTR

      IF(IPRT.GE.0) THEN
      CALL ERRWRT('+++++++++++++++++++++WARNING+++++++++++++++++++++++')
      ERRSTR = 'BUFRLIB: OPENBT - THIS IS A DUMMY BUFRLIB ROUTINE'//
     . ' CALLED BY CKTABA OR APPL. PGM; OPENBT SHOULD BE INCL.'//
     . ' IN-LINE IN APPL. PGM'
      CALL ERRWRT(ERRSTR)
      CALL ERRWRT('+++++++++++++++++++++WARNING+++++++++++++++++++++++')
      CALL ERRWRT(' ')
      ENDIF

      LUNDX = 0

      RETURN
      END