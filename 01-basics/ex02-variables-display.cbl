       ******************************************************************
       * Author: AARON
       * Date: 17-02-2026
       * Purpose: Ejemplo de variables y DISPLAY
       * Tectonics: cobc
       ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VARIABLES-DISPLAY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  NOMBRE  PIC A(10) VALUE "AARON".
       01  EDAD    PIC 99    VALUE 25.
       01  CIUDAD  PIC A(15).

       PROCEDURE DIVISION.
           MOVE "CORUÑA" TO CIUDAD.

           DISPLAY "Nombre: " NOMBRE.
           DISPLAY "Edad: " EDAD.
           DISPLAY "Ciudad: " CIUDAD.

           STOP RUN.
       END PROGRAM VARIABLES-DISPLAY.
