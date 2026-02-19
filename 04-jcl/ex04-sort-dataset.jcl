/*--------------------------------------------------------------------*/
/*        JOB PARA ORDENAR UN DATASET USANDO LA UTLILIDAD SORT        */
/*--------------------------------------------------------------------*/
//SORTJOB JOB (ACCT), 'SORT DATASET',CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1)
//*--------------------------------------------------------------------*
//*       PASO 1:  ORDENAR EL DATASET DE ENTRADA                       *
//* -------------------------------------------------------------------*
//STEP1   EXEC PGM=SORT 
//SORTIN  DD   DSN=MY.INPUT.NUMEROS,DISP=SHR
//SORTOUT DD   DSN=MY.OUTPUT.ORDENADO,
//             DISP=(NEW,CATGL,DELETE),
//             SPACE=(TRK,(1,1)),
//             UNIT=SYSDA,
//             DCB=(RECFM=FB,LRECL,BLKSIZE=500)
//SYSOUT  DD   SYSOUT=*
//SYSIN   DD   *
  SORT FIELDS=(1,10,CH,A) 
/*
//*--------------------------------------------------------------------*
//*       FIN DEL JOB                                                  *
//*--------------------------------------------------------------------*