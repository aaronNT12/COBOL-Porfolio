      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. INDEXED-DELETE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHERO ASSIGN TO "cliente.idx"
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
       01  NOMBRE-TEXTO    PIC X(20).

       PROCEDURE DIVISION.

           DISPLAY "ID del cliente a eliminar: "
           ACCEPT BUSCADO

           OPEN I-O FICHERO

           READ FICHERO
               KEY IS BUSCADO
               INVALID KEY
                   DISPLAY "No existe cliente con ID: " BUSCADO
               NOT INVALID KEY
                   MOVE NOMBRE TO NOMBRE-TEXTO
                   DISPLAY "Cliente encontrado: " NOMBRE-TEXTO
                   DISPLAY "Eliminando registro..."

                   DELETE FICHERO
                       INVALID KEY
                           DISPLAY "Error al eliminar (clave no valida)."
                       NOT INVALID KEY
                           DISPLAY "Registro eliminado correctamente."
                   END-DELETE
           END-READ

           CLOSE FICHERO

           STOP RUN.
       END PROGRAM INDEXED-DELETE.
