      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
              IDENTIFICATION DIVISION.
       PROGRAM-ID. EX04-BATCH-REPORT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCH-ENTRADA ASSIGN TO "datos.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ARCH-REPORTE ASSIGN TO "reporte.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD ARCH-ENTRADA.
       01 REG-ENT.
           05 ENT-CODIGO     PIC 9(3).
           05 ENT-NOMBRE     PIC X(20).
           05 ENT-IMPORTE    PIC 9(7)V99.

       FD ARCH-REPORTE.
       01 REG-REP           PIC X(80).

       WORKING-STORAGE SECTION.

       01 WS-FIN            PIC X VALUE "N".
       01 WS-COD-ACTUAL     PIC 9(3).
       01 WS-TOT-CODIGO     PIC 9(9)V99 VALUE 0.
       01 WS-TOT-GENERAL    PIC 9(9)V99 VALUE 0.

       01 WS-LINEA          PIC X(80).

       PROCEDURE DIVISION.

       MAIN-PROCESS.
           OPEN INPUT ARCH-ENTRADA
                OUTPUT ARCH-REPORTE

           PERFORM LEER-ENTRADA

           IF WS-FIN = "S"
               DISPLAY "Archivo vacío."
               GO TO FIN-PROGRAMA
           END-IF

           MOVE ENT-CODIGO TO WS-COD-ACTUAL
           PERFORM ESCRIBIR-ENCABEZADO

           PERFORM UNTIL WS-FIN = "S"
               IF ENT-CODIGO NOT = WS-COD-ACTUAL
                   PERFORM IMPRIMIR-TOTAL-CODIGO
                   MOVE ENT-CODIGO TO WS-COD-ACTUAL
               END-IF

               PERFORM IMPRIMIR-DETALLE
               ADD ENT-IMPORTE TO WS-TOT-CODIGO
               ADD ENT-IMPORTE TO WS-TOT-GENERAL

               PERFORM LEER-ENTRADA
           END-PERFORM

           PERFORM IMPRIMIR-TOTAL-CODIGO
           PERFORM IMPRIMIR-TOTAL-GENERAL

       FIN-PROGRAMA.
           CLOSE ARCH-ENTRADA ARCH-REPORTE
           STOP RUN.

       *--------------------------------------------------------------
       * SUBRUTINAS
       *--------------------------------------------------------------

       LEER-ENTRADA.
           READ ARCH-ENTRADA
               AT END MOVE "S" TO WS-FIN
           END-READ.

       ESCRIBIR-ENCABEZADO.
           MOVE "REPORTE DE IMPORTES" TO WS-LINEA
           WRITE REG-REP FROM WS-LINEA
           MOVE ALL "-" TO WS-LINEA
           WRITE REG-REP FROM WS-LINEA.

       IMPRIMIR-DETALLE.
           STRING
               ENT-CODIGO DELIMITED BY SIZE
               "  "
               ENT-NOMBRE DELIMITED BY SIZE
               "  "
               ENT-IMPORTE DELIMITED BY SIZE
               INTO WS-LINEA
           END-STRING
           WRITE REG-REP FROM WS-LINEA.

       IMPRIMIR-TOTAL-CODIGO.
           STRING
               "TOTAL CODIGO " WS-COD-ACTUAL " : "
               WS-TOT-CODIGO
               INTO WS-LINEA
           END-STRING
           WRITE REG-REP FROM WS-LINEA
           MOVE 0 TO WS-TOT-CODIGO.

       IMPRIMIR-TOTAL-GENERAL.
           STRING
               "TOTAL GENERAL: " WS-TOT-GENERAL
               INTO WS-LINEA
           END-STRING
           WRITE REG-REP FROM WS-LINEA.
