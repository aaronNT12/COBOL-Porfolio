      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
               IDENTIFICATION DIVISION.
       PROGRAM-ID. INDEX-CREATED.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHERO  ASSIGN TO "clientes.idx"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS ID-CLIENTE
               FILE STATUS IS FS.
       DATA DIVISION.
       FILE SECTION.
       FD  FICHERO.
       01  REG-CLIENTE.
           05 ID-CLIENTE   PIC 9(4).
           05 NOMBRE       PIC X(20).

       WORKING-STORAGE SECTION.
       01  FS              PIC XX.
       PROCEDURE DIVISION.

           OPEN OUTPUT FICHERO.

           MOVE 1001 TO ID-CLIENTE.
           MOVE "ANA" TO NOMBRE.
           WRITE REG-CLIENTE.

           MOVE 1002 TO ID-CLIENTE.
           MOVE "PEDRO" TO NOMBRE.
           WRITE REG-CLIENTE.

           MOVE 1003 TO ID-CLIENTE.
           MOVE "LUCIA" TO NOMBRE.
           WRITE REG-CLIENTE.

           CLOSE FICHERO.

           DISPLAY "Archivo indexado creado. FS=" FS.

            STOP RUN.
       END PROGRAM INDEX-CREATED.
