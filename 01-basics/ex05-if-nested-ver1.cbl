      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF-NESTED.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 NOTA PIC 99.

       PROCEDURE DIVISION.
           MOVE 8 TO NOTA.

           IF NOTA < 5
               DISPLAY "Suspenso."
           ELSE
               IF NOTA = 5
                   DISPLAY "Aprobado."
               ELSE
                   IF NOTA = 6
                       DISPLAY "Bien."
                   ELSE
                       IF NOTA = 7 OR NOTA = 8
                           DISPLAY "Notable."
                       ELSE
                           IF NOTA = 9 OR NOTA = 10
                               DISPLAY "Sobresaliente"
                           ELSE
                               DISPLAY "Nota no valida."
                           END-IF
                       END-IF
                   END-IF
               END-IF
           END-IF.

            STOP RUN.
       END PROGRAM IF-NESTED.
