      ******************************************************************
      * Author: AARON
      * Date: 18-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
               IDENTIFICATION DIVISION.
       PROGRAM-ID. SUM-RECORDS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO-IN ASSIGN TO "numeros.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD  ARCHIVO-IN.
       01  REG-IN      PIC X(20).

       WORKING-STORAGE SECTION.
       01  FS          PIC XX.
       01  FIN         PIC X VALUE "N".
       01  NUMERO      PIC 9(9) VALUE 0.
       01  TOTAL       PIC 9(12) VALUE 0.
       01  LIMPIO      PIC 9(9).

       PROCEDURE DIVISION.

           OPEN INPUT ARCHIVO-IN
           DISPLAY "FS tras OPEN: " FS

           PERFORM UNTIL FIN = "S"
               READ ARCHIVO-IN
                   AT END
                       MOVE "S" TO FIN
                   NOT AT END
                       MOVE REG-IN TO LIMPIO
                       MOVE LIMPIO TO NUMERO
                       ADD NUMERO TO TOTAL
               END-READ
           END-PERFORM

           CLOSE ARCHIVO-IN

           DISPLAY "========================="
           DISPLAY "       SUMA TOTAL = " TOTAL
           DISPLAY "========================="

           STOP RUN.
       END PROGRAM SUM-RECORDS.
