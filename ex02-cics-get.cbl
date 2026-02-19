      ******************************************************************
      * Author:AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX02-CICS-GET.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "CLIENTES.IDX"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS CLI-ID
               FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES
          RECORD CONTAINS 87 CHARACTERS.
       01 CLIENTE-REG.
           05 CLI-ID        PIC 9(5).
           05 CLI-NOMBRE    PIC X(30).
           05 CLI-APELLIDO  PIC X(30).
           05 CLI-SALDO     PIC 9(7)V99.
           05 FILLER        PIC X(13).

       WORKING-STORAGE SECTION.
       01 FS               PIC XX.
       01 WS-ID            PIC 9(5).
       01 WS-MSG           PIC X(50).

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "========================================"
           DISPLAY "      SIMULACION CICS: GET CLIENTE      "
           DISPLAY "========================================"

           OPEN INPUT CLIENTES
           IF FS NOT = "00"
               MOVE "ERROR AL ABRIR ARCHIVO" TO WS-MSG
               PERFORM MOSTRAR-MENSAJE
               STOP RUN
           END-IF

           PERFORM PEDIR-CLAVE
           PERFORM CICS-GET-SIM

           CLOSE CLIENTES
           DISPLAY "----------------------------------------"
           DISPLAY "FIN DE LA TRANSACCION."
           STOP RUN.

       PEDIR-CLAVE.
           DISPLAY "INTRODUCE ID DEL CLIENT
