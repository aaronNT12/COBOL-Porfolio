/*--------------------------------------------------------------------*/
/*        JOB PARA EJECUTAR UN PROGRAMA COBOL BATCH COMPLETO          */
/*--------------------------------------------------------------------*/
//RUNBATCH JOB (ACCT),'RUN BATCH',CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1)
//*--------------------------------------------------------------------*
//*       PASO 1: EJECUTAR EL PROGRAMA COBOL BATCH                     *
//* -------------------------------------------------------------------*
//STEPT1       EXEC          PGM=EX05BATCH,REGION=0M
//STEPLIB      DD            DSN=MY.LOADLIB,DISP=SHR
//SYSOUT       DD            SYSOUT=*
//SYSPRINT     DD            SYSOUT=*
//SYSIN        DD            DUMMY
//*--------------------------------------------------------------------*
//*       ARCHIVOS DE ENTRADA                                          *
//* -------------------------------------------------------------------*
//INFILE       DD            DSN=MY.OUTPUT.RESULTADOS,
//                           DISP=(NEW,CATLG,DELETE),
//                           SPACE=(TRK,(1,1)),
//                           UNIT=SYSDA,
//                           DCB=(RECFM=FB,LRECL=120,BLKSIZE=1200)
//REPORT       DD            DSN=MY.OUTPUT.INFORME,
//                           DISP=(NEW,CATLG,DELETE),
//                           SPACE=(TRK,(1,1)),
//                           UNIT=SYSDA,
//                           DCB=(RECFM=FB,LRECL=132,BLKSIZE=1320)
//*--------------------------------------------------------------------*
//*       FIN DEL JOB                                                  *
//* -------------------------------------------------------------------*