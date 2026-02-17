      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
          IDENTIFICATION DIVISION.
       PROGRAM-ID. READ-SEG.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO ASSIGN TO "datos.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  ARCHIVO.
       01  REGISTRO    PIC X(80).

       WORKING-STORAGE SECTION.
       01  FIN-ARCHIVO PIC X(1) VALUE "N".

       PROCEDURE DIVISION.

           OPEN INPUT ARCHIVO.

           PERFORM UNTIL FIN-ARCHIVO = "S"
               READ ARCHIVO
                   AT END
                       MOVE "S" TO FIN-ARCHIVO
                   NOT AT END
                       DISPLAY "Linea: " REGISTRO
               END-READ
           END-PERFORM

           CLOSE ARCHIVO.

           STOP RUN.
       END PROGRAM READ-SEG.
