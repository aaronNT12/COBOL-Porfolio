      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
              IDENTIFICATION DIVISION.
       PROGRAM-ID. FILTER-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO-IN  ASSIGN TO "entrada.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ARCHIVO-OUT ASSIGN TO "salida.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  ARCHIVO-IN.
       01  REG-IN      PIC X(80).

       FD  ARCHIVO-OUT.
       01  REG-OUT     PIC X(80).

       WORKING-STORAGE SECTION.
       01  FIN-ARCHIVO PIC X VALUE "N".
       01  POS         PIC 9(4) VALUE 0.

       PROCEDURE DIVISION.

           OPEN INPUT ARCHIVO-IN
                OUTPUT ARCHIVO-OUT

           PERFORM UNTIL FIN-ARCHIVO = "S"
               READ ARCHIVO-IN
                   AT END
                       MOVE "S" TO FIN-ARCHIVO
                   NOT AT END
                       INSPECT REG-IN
                           TALLYING POS FOR ALL "OK"
                       IF POS > 0
                           MOVE REG-IN TO REG-OUT
                           WRITE REG-OUT
                       END-IF
                       MOVE 0 TO POS
               END-READ
           END-PERFORM

           CLOSE ARCHIVO-IN ARCHIVO-OUT

           DISPLAY "Filtrado completado.".

           STOP RUN.
