      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.PERFORM-UNTIL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  CONTADOR    PIC 9(2).

       PROCEDURE DIVISION.
           MOVE 1 TO CONTADOR.

           PERFORM UNTIL CONTADOR > 5
               DISPLAY "Iteracion: " CONTADOR
               ADD 1 TO CONTADOR
           END-PERFORM.

            STOP RUN.
       END PROGRAM PERFORM-UNTIL.
