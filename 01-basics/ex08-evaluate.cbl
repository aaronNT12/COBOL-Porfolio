      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX08-EVALUATE.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  NOTA    PIC 99.

       PROCEDURE DIVISION.
           MOVE 8 TO NOTA.

           EVALUATE TRUE
               WHEN NOTA < 5
                   DISPLAY "Suspenso"
               WHEN NOTA = 5
                   DISPLAY "Aprobado"
               WHEN NOTA = 6
                   DISPLAY "Bien"
               WHEN NOTA = 7 OR NOTA = 8
                   DISPLAY "Notable"
               WHEN NOTA = 9 OR NOTA = 10
                   DISPLAY "Sobresaliente"
               WHEN OTHER
                   DISPLAY "Nota no valida."
           END-EVALUATE.

            STOP RUN.
       END PROGRAM EX08-EVALUATE.
