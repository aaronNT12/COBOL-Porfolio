      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DB-DELETE.

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
       01  WS-ID               PIC 9(5).
       01  CONFIRMACION        PIC X.

       PROCEDURE DIVISION.

       MAIN-LOGIC.
           DISPLAY "BORRAR CLIENTE EXISTENTE".

           OPEN I-O CLIENTES
           IF FS NOT = "00"
               DISPLAY "ERROR AL ABRIR ARCHIVO. FS=" FS
               STOP RUN
           END-IF

           PERFORM PEDIR-ID
           PERFORM BUSCAR-REGISTRO

           IF FS = "00"
               PERFORM CONFIRMAR-BORRADO
               IF CONFIRMACION = "S"
                   PERFORM BORRAR-REGISTRO
               ELSE
                   DISPLAY "BORRADO CANCELADO POR EL USUARIO."
               END-IF
           END-IF

           CLOSE CLIENTES
           DISPLAY "FIN DEL PROGRAMA."
           STOP RUN.

       PEDIR-ID.
           DISPLAY "INTRODUCE ID A BORRAR (5 dígitos): "
           ACCEPT WS-ID
       .

       BUSCAR-REGISTRO.
           MOVE WS-ID TO CLI-ID

           READ CLIENTES
               INVALID KEY
                   DISPLAY "NO EXISTE CLIENTE CON ID=" WS-ID
               NOT INVALID KEY
                   DISPLAY "CLIENTE ENCONTRADO:"
                   DISPLAY "NOMBRE:    " CLI-NOMBRE
                   DISPLAY "APELLIDO:  " CLI-APELLIDO
                   DISPLAY "EDAD:      " CLI-EDAD
           END-READ
       .

       CONFIRMAR-BORRADO.
           DISPLAY "¿DESEA BORRAR ESTE REGISTRO? (S/N): "
           ACCEPT CONFIRMACION
           MOVE FUNCTION UPPER-CASE(CONFIRMACION) TO CONFIRMACION
       .

       BORRAR-REGISTRO.
           DELETE CLIENTES
           IF FS = "00"
               DISPLAY "REGISTRO BORRADO CORRECTAMENTE."
           ELSE
               DISPLAY "ERROR AL BORRAR. FS=" FS
           END-IF
       .

       END PROGRAM DB-DELETE.
