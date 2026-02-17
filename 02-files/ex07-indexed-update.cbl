      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
               IDENTIFICATION DIVISION.
       PROGRAM-ID. INDEXED-UPDATE.

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
           05 ID-CLIENTE  PIC 9(4).
           05 NOMBRE      PIC X(20).

       WORKING-STORAGE SECTION.
       01  FS             PIC XX.
       01  BUSCADO        PIC 9(4).
       01  NUEVO-NOMBRE   PIC X(20).

       PROCEDURE DIVISION.


       DISPLAY "ID del cliente a modificar: ".
       ACCEPT BUSCADO.

       OPEN I-O FICHERO.

       READ FICHERO
           KEY IS BUSCADO
           INVALID KEY
               DISPLAY "No existe el cliente con ID " BUSCADO
           NOT INVALID KEY
               DISPLAY "Cliente encontrado: " NOMBRE
               DISPLAY "Nuevo nombre: "
               ACCEPT NUEVO-NOMBRE

               MOVE NUEVO-NOMBRE TO NOMBRE
               REWRITE REG-CLIENTE
                   INVALID KEY
                       DISPLAY "Error al actualizar (clave duplicada)."
                   NOT INVALID KEY
                   DISPLAY "Registro actualizado correctamente."
               END-REWRITE
           END-READ.

           CLOSE FICHERO.
            STOP RUN.
       END PROGRAM INDEXED-UPDATE.
