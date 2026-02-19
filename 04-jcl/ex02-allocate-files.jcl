/*--------------------------------------------------------------------*/
/*        JOB PARA CREAR LOS DATASETS NECESARIOS PARA EL PROGRAMA     */
/*--------------------------------------------------------------------*/
 // ALLOCJOB JOB (ACCT), 'ALLOC FILES',CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1)
//*--------------------------------------------------------------------*
//*       PASO 1: CREAR ARCHIVO DE ENTRADA                             *
//* -------------------------------------------------------------------*
//STEP1   EXEC PGM=IEFBR14 
//INFILE  DD   DSN=MY.INPUT.NUMEROS,
//        DISP=(NEW,CATGL, DELETE),
//        SPACE=(TRK,(1,1)),
//        UNIT=SYSDA,
//        DCB=(RECFM=FB,LRECL=50,BLKSIZE=500)
//*--------------------------------------------------------------------*
//*       PASO 2 CREAR ARCHIVO DE SALIDA                               *
//* -------------------------------------------------------------------*
//STEP2   EXEC PGM=IFEBR14 
//OUTFILE DD   DSN=MY.OUTPUT.RESULTADOS,
//        DISP=(NEW,CATGL,DELETE),
//        SPACE=(TRK,(1,1)),
//        UNIT=SYSDA,
//        DCB=(RECFM=FB,LRECL=80,BLKSIZE=800)
//*--------------------------------------------------------------------*
//*       FIN DEL JOB                                                  *
//* -------------------------------------------------------------------*