       ******************************************************************
       * Author: AARON
       * Date: 17-02-2026
       * Purpose:
       * Tectonics: cobc
       ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF-BASIC-VERSION-1.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  EDAD    PIC 99.

       PROCEDURE DIVISION.
           MOVE 17 TO EDAD.

           IF EDAD >= 18
               DISPLAY "Es mayor edad."

           END-IF.

           DISPLAY "Hello world".

           STOP RUN.
       END PROGRAM IF-BASIC-VERSION-1.


       *Version del programa con un solo condicional, omitiendo el ELSE-IF.
