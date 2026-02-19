      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX03-CICS-SEND.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ID        PIC 9(5).
       01  WS-NOMBRE    PIC X(30).
       01  WS-APELLIDO  PIC X(30).
       01  WS-EDAD      PIC 99.
       01  WS-MSG       PIC X(50).

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM SEND-SCREEN
           PERFORM RECEIVE-DATA
           PERFORM SHOW-CONFIRMATION
           STOP RUN.

       SEND-SCREEN.
           DISPLAY "=====================================================".
           DISPLAY "                SIMULACION CICS: SEND                ".
           DISPLAY "=====================================================".
           DISPLAY "   FORMULARIO DE CLIENTE".
           DISPLAY "   ----------------------".
           DISPLAY "   ID (5 dígitos):        _____".
           DISPLAY "   Nombre:                ________________________________".
           DISPLAY "   Apellido:              ________________________________".
           DISPLAY "   Edad:                  __".
           DISPLAY "-----------------------------------------------------".
           DISPLAY "   Introduzca los datos solicitados".
           DISPLAY "-----------------------------------------------------".
           .

       RECEIVE-DATA.
           DISPLAY "ID: ".
           ACCEPT  WS-ID.
           DISPLAY "Nombre: ".
           ACCEPT  WS-NOMBRE.
           DISPLAY "Apellido: ".
           ACCEPT  WS-APELLIDO.
           DISPLAY "Edad: ".
           ACCEPT  WS-EDAD.
           .

       SHOW-CONFIRMATION.
           DISPLAY "-----------------------------------------------------".
           DISPLAY "DATOS RECIBIDOS:".
           DISPLAY "ID:       " WS-ID.
           DISPLAY "NOMBRE:   " WS-NOMBRE.
           DISPLAY "APELLIDO: " WS-APELLIDO.
           DISPLAY "EDAD:     " WS-EDAD.
           DISPLAY "-----------------------------------------------------".
           MOVE "DATOS CAPTURADOS CORRECTAMENTE." TO WS-MSG.
           DISPLAY WS-MSG.
           .
