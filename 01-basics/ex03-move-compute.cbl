      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVE-COMPUTE.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  NUM1        PIC 9(3).
       01  NUM2        PIC 9(3).
       01  RESULTADO   PIC 9(5).
       PROCEDURE DIVISION.
           MOVE 10 TO NUM1.
           MOVE 25 TO NUM2.

           COMPUTE RESULTADO = NUM1 + NUM2.
           DISPLAY "Suma: " RESULTADO.


           COMPUTE RESULTADO = NUM2 - NUM1.
           DISPLAY "Resta: " RESULTADO.


           COMPUTE RESULTADO = NUM1 * NUM2.
           DISPLAY "Multiplicacion: " RESULTADO.


           COMPUTE RESULTADO = NUM2 / NUM1.
           DISPLAY "Division: " RESULTADO.


            STOP RUN.
       END PROGRAM MOVE-COMPUTE.
