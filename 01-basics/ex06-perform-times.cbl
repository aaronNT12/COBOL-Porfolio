     ******************************************************************
      * Author: AARON
      * Date:  17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFORM-TIMES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  CONTADOR    PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 1 TO CONTADOR.

           PERFORM 5 TIMES
               DISPLAY "Iteraction numero: " CONTADOR
               ADD 1 TO CONTADOR
           END-PERFORM.
            STOP RUN.
       END PROGRAM PERFORM-TIMES.
