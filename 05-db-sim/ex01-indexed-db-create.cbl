      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DB-CREATE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
               SELECT CLIENTES-ASSIGN TO "CLIENTES.IDX"
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
           05 CLIE-EDAD        PIC 99.
           05 FILLER           PIC X(13).

       WORKING-STORAGE SECTION.
       01  FS                  PIC XX.
       01  FIN                 PIC X VALUE "N".

       01  REGISTRO-INICIAL.
           05 R-ID             PIC 9(5).
           05 R-NOMBRE         PIC X(30).
           05 R-APELLIDO       PIC X(30).
           05 R-EDAD           PIC 99.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "CREANDO ARCHIVO INDEXADO CLIENTES...".

           OPEN OUTPUT CLIENTES
           IF FS NOT = "00"
               DISPLAY "ERROR AL CREAR ARCHIVO. FS=" FS
               STOP-RUN
           END-IF

           PERFORM CARGAR-REGISTROS

           CLOSE CLIENTES
           DISPLAY "ARCHIVO CREADO CORRECTAMENTE."
           STOP RUN.

       CARGAR REGISTROS.
           MOVE 00001 TO R-ID
           MOVE "JUAN" TO R-NOMBRE
           MOVE "PEREZ" TO R-APELLIDO
           MOVE 30 TO R-EDAD
           PERFORM ESCRIBIR-REGISTRO

           MOVE 00002 TO R-ID
           MOVE "ANA" TO R-NOMBRE
           MOVE "GARCIA" TO R-APELLIDO
           MOVE 25 TO R-EDAD
           PERFORM ESCRIBIR-REGISTRO

           MOVE 00003 TO R-ID
           MOVE "CARLOS" TO R-NOMBRE
           MOVE "LOPEZ" TO R-APELLIDO
           MOVE 40 TO R-EDAD
           PERFORM ESCRIBIR-REGISTRO.

       ESCRIBIR-REGISTRO.
           MOVE R-ID       TO CLI-ID
           MOVE R-NOMBRE   TO CLI-NOMBRE
           MOVE R-APELLIDO TO CLI-APELLIDO
           MOVE R-EDAD     TO CLIE-EDAD

           WRITE CLIENTE-REG
           IF FS NOT = "00"
               DISPLAY "ERROR AL ESCRIBIR REGISTRO. FS=" FS
           END-IF.

       END PROGRAM DB-CREATE.
