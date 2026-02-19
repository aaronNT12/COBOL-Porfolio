       ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose: Mini app CICS-SIM con bucle de menú
      * Tectonics: cobc
       ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX05-CICS-MINI-APP.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-OPCION     PIC 9.
       01  WS-ID         PIC 9(5).
       01  WS-NOMBRE     PIC X(30).
       01  WS-MSG        PIC X(50).

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM UNTIL WS-OPCION = 0
               PERFORM MENU-SEND
               PERFORM MENU-RECEIVE
               PERFORM MENU-DISPATCH
           END-PERFORM
           STOP RUN.

       MENU-SEND.
           DISPLAY "=====================================================".
           DISPLAY "                MINI APLICACION CICS-SIM             ".
           DISPLAY "=====================================================".
           DISPLAY "   [1] Capturar datos de cliente".
           DISPLAY "   [2] Mostrar mensaje de bienvenida".
           DISPLAY "   [0] Salir".
           DISPLAY "-----------------------------------------------------".
           DISPLAY "   Seleccione una opcion: ".
           .

       MENU-RECEIVE.
           ACCEPT WS-OPCION.
           .

       MENU-DISPATCH.
           EVALUATE WS-OPCION
               WHEN 1
                   PERFORM FORM-SEND
                   PERFORM FORM-RECEIVE
                   PERFORM FORM-SHOW
               WHEN 2
                   MOVE "Bienvenido a la mini-app CICS-SIM" TO WS-MSG
                   PERFORM SHOW-MSG
               WHEN 0
                   MOVE "Fin del programa." TO WS-MSG
                   PERFORM SHOW-MSG
               WHEN OTHER
                   MOVE "Opcion invalida." TO WS-MSG
                   PERFORM SHOW-MSG
           END-EVALUATE.
           .

       FORM-SEND.
           DISPLAY "=====================================================".
           DISPLAY "              FORMULARIO DE CLIENTE                  ".
           DISPLAY "=====================================================".
           DISPLAY "   ID (5 dígitos):        _____".
           DISPLAY "   Nombre:                ________________________________".
           DISPLAY "-----------------------------------------------------".
           DISPLAY "   Introduzca los datos".
           DISPLAY "-----------------------------------------------------".
           .

       FORM-RECEIVE.
           DISPLAY "ID: ".
           ACCEPT WS-ID.
           DISPLAY "Nombre: ".
           ACCEPT WS-NOMBRE.
           .

       FORM-SHOW.
           DISPLAY "-----------------------------------------------------".
           DISPLAY "DATOS CAPTURADOS:".
           DISPLAY "ID:     " WS-ID.
           DISPLAY "NOMBRE: " WS-NOMBRE.
           DISPLAY "-----------------------------------------------------".
           MOVE "Captura completada correctamente." TO WS-MSG.
           PERFORM SHOW-MSG.
           .

       SHOW-MSG.
           DISPLAY "-----------------------------------------------------".
           DISPLAY WS-MSG.
           DISPLAY "-----------------------------------------------------".
           .
