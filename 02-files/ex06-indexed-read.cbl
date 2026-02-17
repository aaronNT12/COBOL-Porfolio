      ******************************************************************
      * Author:AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
             IDENTIFICATION DIVISION.
       PROGRAM-ID. INDEXED-READ.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHERO ASSIGN TO "clientes.idx"
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
       01  BUSCADO         PIC 9(4).
       01  ID-TEXTO        PIC X(4).     *> Para mostrar el ID correctamente

       PROCEDURE DIVISION.

           DISPLAY "Introduce ID a buscar: "
           ACCEPT BUSCADO

           OPEN INPUT FICHERO

           READ FICHERO
               KEY IS BUSCADO
               INVALID KEY
                   DISPLAY "No existe el cliente con ID " BUSCADO
               NOT INVALID KEY
                   MOVE ID-CLIENTE TO ID-TEXTO
                   DISPLAY "Cliente encontrado:"
                   DISPLAY "ID: " ID-TEXTO
                   DISPLAY "Nombre: " NOMBRE
           END-READ

           CLOSE FICHERO

           STOP RUN.
       END PROGRAM INDEXED-READ.
