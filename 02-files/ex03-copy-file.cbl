      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
              IDENTIFICATION DIVISION.
       PROGRAM-ID. COPY-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO-IN  ASSIGN TO "entrada.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ARCHIVO-OUT ASSIGN TO "salida.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  ARCHIVO-IN.
       01  REG-IN  PIC X(80).

       FD  ARCHIVO-OUT.
       01  REG-OUT PIC X(80).

       WORKING-STORAGE SECTION.
       01  FIN-ARCHIVO PIC X(1) VALUE "N".

       PROCEDURE DIVISION.

           OPEN INPUT ARCHIVO-IN
                OUTPUT ARCHIVO-OUT.

           PERFORM UNTIL FIN-ARCHIVO = "S"
               READ ARCHIVO-IN
                   AT END
                       MOVE "S" TO FIN-ARCHIVO
                   NOT AT END
                       MOVE REG-IN TO REG-OUT
                       WRITE REG-OUT
               END-READ
           END-PERFORM.

           CLOSE ARCHIVO-IN ARCHIVO-OUT.

           DISPLAY "Copia completada.".

           STOP RUN.
       END PROGRAM COPY-FILE.
