/*-------------------------------------------------------------------*/
/*        JOB PARA EJECUTAR UN PROGRAMA COBOL BATCH                  */
/*-------------------------------------------------------------------*/
  //RUNCOBOL JOB (ACCT), 'EJEC COBOL',CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1)
//*--------------------------------------------------------------------*
//* PASO 1: EJECUTAR EL PROGRAMA COBOL                                 *
//* -------------------------------------------------------------------*
//RUNSTEP      EXEC PGM=EX01SUM,REGION=0M
//STEPLIB      DD   DSN=MY.LOADLIB,DISP=SHR
//SYOUT        DD   SYSOUT=*
//SYSPRINT     DD   SYSOUT=*
//SYSIN        DD   DUMMY 
//*--------------------------------------------------------------------*
//*       ARCHIVO DE ENTRADA Y SALIDA                                  *
//* -------------------------------------------------------------------*
//INFILE       DD  DSN=MY.INPUT.NUMEROS,DISP=SHR
//OUTFILE      DD  DSN=MY.OUTPUT.RESULTADOS,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(TRK,(1,1),UNIT=SYSDA)         
//*--------------------------------------------------------------------*
//*       FIN DEL JOB                                                  *
//* -------------------------------------------------------------------*
