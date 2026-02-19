      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
            IDENTIFICATION DIVISION.
       PROGRAM-ID. DB-TRANSACTION-SIM.

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
       01  CONFIRMACION        PIC X.
       01  TRANS-EN-CURSO      PIC X VALUE "N".

       PROCEDURE DIVISION.

       MAIN-LOGIC.
           DISPLAY "SIMULACION DE TRANSACCION SOBRE ARCHIVO INDEXADO".

           OPEN I-O CLIENTES
           IF FS NOT = "00"
               DISPLAY "ERROR AL ABRIR ARCHIVO. FS=" FS
               STOP RUN
           END-IF

           PERFORM INICIAR-TRANSACCION
           PERFORM PEDIR-ID
           PERFORM LEER-REGISTRO

           IF FS = "00"
               PERFORM MOSTRAR-REGISTRO
               PERFORM PEDIR-NUEVOS-DATOS
               PERFORM CONFIRMAR-TRANSACCION
           END-IF

           PERFORM FINALIZAR-TRANSACCION

           CLOSE CLIENTES
           DISPLAY "FIN DEL PROGRAMA."
           STOP RUN.

       INICIAR-TRANSACCION.
           DISPLAY "---------------------------------------------"
           DISPLAY "INICIANDO TRANSACCION..."
           MOVE "S" TO TRANS-EN-CURSO
           DISPLAY "TRANSACCION INICIADA."
           DISPLAY "---------------------------------------------"
       .

       PEDIR-ID.
           DISPLAY "INTRODUCE ID A MODIFICAR (5 dígitos): "
           ACCEPT WS-ID
       .

       LEER-REGISTRO.
           MOVE WS-ID TO CLI-ID

           READ CLIENTES
               INVALID KEY
                   DISPLAY "NO EXISTE CLIENTE CON ID=" WS-ID
               NOT INVALID KEY
                   CONTINUE
           END-READ
       .

       MOSTRAR-REGISTRO.
           DISPLAY "REGISTRO ACTUAL:"
           DISPLAY "NOMBRE:    " CLI-NOMBRE
           DISPLAY "APELLIDO:  " CLI-APELLIDO
           DISPLAY "EDAD:      " CLI-EDAD
       .

       PEDIR-NUEVOS-DATOS.
           DISPLAY "NUEVO NOMBRE: "
           ACCEPT WS-NOMBRE
           DISPLAY "NUEVO APELLIDO: "
           ACCEPT WS-APELLIDO
           DISPLAY "NUEVA EDAD: "
           ACCEPT WS-EDAD
       .

       CONFIRMAR-TRANSACCION.
           DISPLAY "¿CONFIRMAR TRANSACCION? (S/N): "
           ACCEPT CONFIRMACION
           MOVE FUNCTION UPPER-CASE(CONFIRMACION) TO CONFIRMACION

           IF CONFIRMACION = "S"
               PERFORM APLICAR-CAMBIOS
           ELSE
               DISPLAY "TRANSACCION CANCELADA. NO SE APLICARON CAMBIOS."
           END-IF
       .

       APLICAR-CAMBIOS.
           MOVE WS-NOMBRE   TO CLI-NOMBRE
           MOVE WS-APELLIDO TO CLI-APELLIDO
           MOVE WS-EDAD     TO CLI-EDAD

           REWRITE CLIENTE-REG
           IF FS = "00"
               DISPLAY "CAMBIOS APLICADOS (COMMIT SIMULADO)."
           ELSE
               DISPLAY "ERROR AL APLICAR CAMBIOS. FS=" FS
           END-IF
       .

       FINALIZAR-TRANSACCION.
           IF TRANS-EN-CURSO = "S"
               DISPLAY "FINALIZANDO TRANSACCION..."
               MOVE "N" TO TRANS-EN-CURSO
               DISPLAY "TRANSACCION FINALIZADA."
           END-IF
       .

       END PROGRAM DB-TRANSACTION-SIM.
