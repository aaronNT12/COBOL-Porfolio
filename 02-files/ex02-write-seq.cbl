      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITE-SEQ.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO ASSIGN TO "salida.txt"
               ORGANISATION    IS  LINE    SEQUENTIAL.


       DATA DIVISION.
       FILE SECTION.
       FD  ARCHIVO.
       01  REGISTRO    PIC X(80).

       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.

           OPEN    OUTPUT  ARCHIVO.

           MOVE "Primera linea del archivo."   TO REGISTRO.
           WRITE REGISTRO.

           MOVE "Segunda linea del archivo."   TO REGISTRO.
           WRITE REGISTRO.

           MOVE "Tercera linea del archivo."   TO REGISTRO.
           WRITE REGISTRO.

           CLOSE ARCHIVO.

           DISPLAY "Archivo creado correctamente."


            STOP RUN.

       END PROGRAM WRITE-SEQ.
