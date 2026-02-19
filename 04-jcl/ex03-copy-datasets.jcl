/*--------------------------------------------------------------------*/
/*              JOB PARA COPIAR UN DATASET A OTRO USANDO IEBGENER     */
/*--------------------------------------------------------------------*/
//COPYJOB JOB (ACCT), 'COPY DATASETS',CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1)
//*--------------------------------------------------------------------*
//*       PASO 1: COPIAR DATASET DE ENTRADA A DATASET DE SALIDA        *
//* -------------------------------------------------------------------*
//STEP1        EXEC PGM=IEBGENER 
//SYSUT1       DD  DSN=MY.INPUT.NUMEROS,DISP=SHR
//SYSUT2       DD  DSN=MY.OUTPUT.COPIA,
//                 DISP=(NEW,CATLG,DELETE),
//                 SPACE=(TRK,(1,1)),
//                 UNIT=SYSDA,
//                 DCB=(RECFM=FB,LRECL=50,BLKSIZE=500)
//SYSPRINT     DD  SYSOUT=*
//SYSIN        DD  DUMMY
//*--------------------------------------------------------------------*
//*       FIN DEL JOB                                                  *
//* -------------------------------------------------------------------*