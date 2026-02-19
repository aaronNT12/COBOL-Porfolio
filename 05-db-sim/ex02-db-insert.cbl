      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
             IDENTIFICATION DIVISION.
       PROGRAM-ID. DB-INSERT.

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
           05 CLI-ID        PIC 9(5).
           05 CLI-NOMBRE    PIC X(30).
           05 CLI-APELLIDO  PIC X(30).
           05 CLI-EDAD      PIC 99.
           05 FILLER        PIC X(13).

       WORKING-STORAGE SECTION.
       01  FS               PIC XX.
       01  WS-ID            PIC 9(5).
       01  WS-NOMBRE        PIC X(30).
       01  WS-APELLIDO      PIC X(30).
       01  WS-EDAD          PIC 99.

       PROCEDURE DIVISION.

       MAIN-LOGIC.
           DISPLAY "INSERTAR NUEVO CLIENTE EN ARCHIVO INDEXADO".

           OPEN I-O CLIENTES
           IF FS NOT = "00"
               DISPLAY "ERROR AL ABRIR ARCHIVO. FS=" FS
               STOP RUN
           END-IF

           PERFORM LEER-DATOS-USUARIO
           PERFORM INTENTAR-INSERTAR

           CLOSE CLIENTES
           DISPLAY "FIN DEL PROGRAMA."
           STOP RUN.

       LEER-DATOS-USUARIO.
           DISPLAY "ID (5 dígitos): "
           ACCEPT WS-ID
           DISPLAY "Nombre: "
           ACCEPT WS-NOMBRE
           DISPLAY "Apellido: "
           ACCEPT WS-APELLIDO
           DISPLAY "Edad: "
           ACCEPT WS-EDAD
       .

       INTENTAR-INSERTAR.
           MOVE WS-ID        TO CLI-ID
           MOVE WS-NOMBRE    TO CLI-NOMBRE
           MOVE WS-APELLIDO  TO CLI-APELLIDO
           MOVE WS-EDAD      TO CLI-EDAD

           WRITE CLIENTE-REG
           IF FS = "00"
               DISPLAY "REGISTRO INSERTADO CORRECTAMENTE."
           ELSE
               IF FS = "22"
                   DISPLAY "ERROR: CLAVE DUPLICADA. NO SE INSERTO."
               ELSE
                   DISPLAY "ERROR AL INSERTAR. FS=" FS
               END-IF
           END-IF
       .

       END PROGRAM DB-INSERT.
