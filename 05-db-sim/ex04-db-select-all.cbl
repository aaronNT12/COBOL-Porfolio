      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
             IDENTIFICATION DIVISION.
       PROGRAM-ID. DB-SELECT-ALL.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "CLIENTES.IDX"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS CLI-ID
               FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD  CLIENTES
           RECORD CONTAINS 80 CHARACTERS.
       01  CLIENTE-REG.
           05 CLI-ID           PIC 9(5).
           05 CLI-NOMBRE       PIC X(30).
           05 CLI-APELLIDO     PIC X(30).
           05 CLI-EDAD         PIC 99.
           05 FILLER           PIC X(13).

       WORKING-STORAGE SECTION.
       01  FS                  PIC XX.
       01  FIN-ARCHIVO         PIC X VALUE "N".

       PROCEDURE DIVISION.

       MAIN-LOGIC.
           DISPLAY "LISTADO COMPLETO DE CLIENTES".

           OPEN INPUT CLIENTES
           IF FS NOT = "00"
               DISPLAY "ERROR AL ABRIR ARCHIVO. FS=" FS
               STOP RUN
           END-IF

           PERFORM LEER-PRIMER-REGISTRO

           PERFORM UNTIL FIN-ARCHIVO = "S"
               PERFORM MOSTRAR-REGISTRO
               PERFORM LEER-SIGUIENTE
           END-PERFORM

           CLOSE CLIENTES
           DISPLAY "FIN DEL LISTADO."
           STOP RUN.

       LEER-PRIMER-REGISTRO.
           READ CLIENTES
               AT END
                   MOVE "S" TO FIN-ARCHIVO
               NOT AT END
                   CONTINUE
           END-READ
       .

       LEER-SIGUIENTE.
           READ CLIENTES
               AT END
                   MOVE "S" TO FIN-ARCHIVO
               NOT AT END
                   CONTINUE
           END-READ
       .

       MOSTRAR-REGISTRO.
           DISPLAY "-----------------------------------------------"
           DISPLAY "ID:        " CLI-ID
           DISPLAY "NOMBRE:    " CLI-NOMBRE
           DISPLAY "APELLIDO:  " CLI-APELLIDO
           DISPLAY "EDAD:      " CLI-EDAD
       .

       END PROGRAM DB-SELECT-ALL.
