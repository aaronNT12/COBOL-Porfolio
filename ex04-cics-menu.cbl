      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX04-CICS-MENU.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-OPCION     PIC 9.
       01  WS-MSG        PIC X(50).

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM PANTALLA-MENU
           PERFORM LEER-OPCION
           PERFORM PROCESAR-OPCION
           STOP RUN.

       PANTALLA-MENU.
           DISPLAY "=====================================================".
           DISPLAY "                SIMULACION CICS: MENU                ".
           DISPLAY "=====================================================".
           DISPLAY "   [1] ALTA DE CLIENTE".
           DISPLAY "   [2] CONSULTA DE CLIENTE".
           DISPLAY "   [3] MODIFICACION DE CLIENTE".
           DISPLAY "   [4] BAJA DE CLIENTE".
           DISPLAY "   [5] LISTADO COMPLETO".
           DISPLAY "   [0] SALIR".
           DISPLAY "-----------------------------------------------------".
           DISPLAY "   SELECCIONE UNA OPCION: ".
           .

       LEER-OPCION.
           ACCEPT WS-OPCION.
           .

       PROCESAR-OPCION.
           EVALUATE WS-OPCION
               WHEN 1
                   MOVE "OPCION 1: ALTA DE CLIENTE" TO WS-MSG
                   PERFORM MOSTRAR-MENSAJE
               WHEN 2
                   MOVE "OPCION 2: CONSULTA DE CLIENTE" TO WS-MSG
                   PERFORM MOSTRAR-MENSAJE
               WHEN 3
                   MOVE "OPCION 3: MODIFICACION DE CLIENTE" TO WS-MSG
                   PERFORM MOSTRAR-MENSAJE
               WHEN 4
                   MOVE "OPCION 4: BAJA DE CLIENTE" TO WS-MSG
                   PERFORM MOSTRAR-MENSAJE
               WHEN 5
                   MOVE "OPCION 5: LISTADO COMPLETO" TO WS-MSG
                   PERFORM MOSTRAR-MENSAJE
               WHEN 0
                   MOVE "FIN DEL PROGRAMA." TO WS-MSG
                   PERFORM MOSTRAR-MENSAJE
               WHEN OTHER
                   MOVE "OPCION INVALIDA." TO WS-MSG
                   PERFORM MOSTRAR-MENSAJE
           END-EVALUATE.
           .

       MOSTRAR-MENSAJE.
           DISPLAY "-----------------------------------------------------".
           DISPLAY WS-MSG.
           DISPLAY "-----------------------------------------------------".
           .
