      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DB-UPDATE.

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
       01  WS-NOMBRE           PIC X(30).
       01  WS-APELLIDO         PIC X(30).
       01  WS-EDAD             PIC 99.

       PROCEDURE DIVISION.

       MAIN-LOGIC.
           DISPLAY "ACTUALIZAR CLIENTE EXISTENTE".

           OPEN I-O CLIENTES
           IF FS NOT = "00"
               DISPLAY "ERROR AL ABRIR ARCHIVO. FS=" FS
               STOP RUN
           END-IF

           PERFORM PEDIR-ID
           PERFORM BUSCAR-REGISTRO

           IF FS = "00"
               PERFORM PEDIR-NUEVOS-DATOS
               PERFORM ACTUALIZAR-REGISTRO
           END-IF

           CLOSE CLIENTES
           DISPLAY "FIN DEL PROGRAMA."
           STOP RUN.

       PEDIR-ID.
           DISPLAY "INTRODUCE ID A MODIFICAR (5 dígitos): "
           ACCEPT WS-ID
       .

       BUSCAR-REGISTRO.
           MOVE WS-ID TO CLI-ID

           READ CLIENTES
               INVALID KEY
                   DISPLAY "NO EXISTE CLIENTE CON ID=" WS-ID
               NOT INVALID KEY
                   DISPLAY "CLIENTE ENCONTRADO. DATOS ACTUALES:"
                   DISPLAY "NOMBRE:    " CLI-NOMBRE
                   DISPLAY "APELLIDO:  " CLI-APELLIDO
                   DISPLAY "EDAD:      " CLI-EDAD
           END-READ
       .

       PEDIR-NUEVOS-DATOS.
           DISPLAY "NUEVO NOMBRE: "
           ACCEPT WS-NOMBRE
           DISPLAY "NUEVO APELLIDO: "
           ACCEPT WS-APELLIDO
           DISPLAY "NUEVA EDAD: "
           ACCEPT WS-EDAD
       .

       ACTUALIZAR-REGISTRO.
           MOVE WS-NOMBRE   TO CLI-NOMBRE
           MOVE WS-APELLIDO TO CLI-APELLIDO
           MOVE WS-EDAD     TO CLI-EDAD

           REWRITE CLIENTE-REG
           IF FS = "00"
               DISPLAY "REGISTRO ACTUALIZADO CORRECTAMENTE."
           ELSE
               DISPLAY "ERROR AL ACTUALIZAR. FS=" FS
           END-IF
       .

       END PROGRAM DB-UPDATE.
