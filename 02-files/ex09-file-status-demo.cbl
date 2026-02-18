      ******************************************************************
      * Author: AARON
      * Date: 18-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
               IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-STATUS-DEMO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO ASSIGN TO "demo.txt"
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD  ARCHIVO.
       01  REGISTRO    PIC X(80).

       WORKING-STORAGE SECTION.
       01  FS          PIC XX.
       01  FIN         PIC X VALUE "N".

           PROCEDURE DIVISION.

       DISPLAY "Intentando abrir un archivo..."
       OPEN INPUT ARCHIVO
       DISPLAY "FS tras OPEM: " FS

       IF  FS = "35"
           DISPLAY "El archivo no existe. Creándolo..."
           OPEN OUTPUT ARCHIVO
           DISPLAY "FS tras crear archivo: "FS
           CLOSE ARCHIVO
           OPEN INPUT ARCHIVO
           DISPLAY "FS tras reabrir: "FS
       END-IF

       PERFORM UNIT FIN = "S"
           READ ARCHIVO
               AT END
                   MOVE "S" TO FIN
                   DISPLAY "Fin de archivo. FS="FS
               NOT AT END
                   DISPLAY "Leídp: " REGISTRO
                   DISPLAY "FS tras READ: " FS

           END-READ
       END-PERFORM

           CLOSE ARCHIVO
           DISPLAY "FS tras CLOSE: " FS


            STOP RUN.
       END PROGRAM FILE-STATUS-DEMO.
