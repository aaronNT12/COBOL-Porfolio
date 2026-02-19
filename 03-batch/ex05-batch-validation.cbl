      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
             IDENTIFICATION DIVISION.
       PROGRAM-ID. EX05-BATCH-VALIDATION.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCH-ENTRADA ASSIGN TO "datos.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ARCH-VALIDOS ASSIGN TO "validos.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ARCH-ERRORES ASSIGN TO "errores.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD ARCH-ENTRADA.
       01 REG-ENT.
           05 ENT-CODIGO     PIC 9(3).
           05 ENT-NOMBRE     PIC X(20).
           05 ENT-EDAD       PIC 9(2).
           05 ENT-SALARIO    PIC 9(7)V99.

       FD ARCH-VALIDOS.
       01 REG-VAL           PIC X(80).

       FD ARCH-ERRORES.
       01 REG-ERR           PIC X(120).

       WORKING-STORAGE SECTION.

       01 WS-FIN            PIC X VALUE "N".
       01 WS-ERROR          PIC X VALUE "N".
       01 WS-MENSAJE-ERR    PIC X(80).

       01 WS-LINEA          PIC X(120).

       PROCEDURE DIVISION.

       MAIN.
           OPEN INPUT ARCH-ENTRADA
                OUTPUT ARCH-VALIDOS ARCH-ERRORES

           PERFORM LEER-ENTRADA

           PERFORM UNTIL WS-FIN = "S"
               PERFORM VALIDAR-REGISTRO

               IF WS-ERROR = "N"
                   PERFORM GRABAR-VALIDO
               ELSE
                   PERFORM GRABAR-ERROR
               END-IF

               PERFORM LEER-ENTRADA
           END-PERFORM

           CLOSE ARCH-ENTRADA ARCH-VALIDOS ARCH-ERRORES
           STOP RUN.

       *--------------------------------------------------------------
       * LECTURA
       *--------------------------------------------------------------
       LEER-ENTRADA.
           READ ARCH-ENTRADA
               AT END MOVE "S" TO WS-FIN
           END-READ.

       *--------------------------------------------------------------
       * VALIDACIONES
       *--------------------------------------------------------------
       VALIDAR-REGISTRO.
           MOVE "N" TO WS-ERROR
           MOVE SPACES TO WS-MENSAJE-ERR

           IF ENT-CODIGO = 0
               MOVE "CODIGO INVALIDO" TO WS-MENSAJE-ERR
               MOVE "S" TO WS-ERROR
           END-IF

           IF ENT-NOMBRE = SPACES AND WS-ERROR = "N"
               MOVE "NOMBRE VACIO" TO WS-MENSAJE-ERR
               MOVE "S" TO WS-ERROR
           END-IF

           IF (ENT-EDAD < 18 OR ENT-EDAD > 65) AND WS-ERROR = "N"
               MOVE "EDAD FUERA DE RANGO" TO WS-MENSAJE-ERR
               MOVE "S" TO WS-ERROR
           END-IF

           IF ENT-SALARIO = 0 AND WS-ERROR = "N"
               MOVE "SALARIO INVALIDO" TO WS-MENSAJE-ERR
               MOVE "S" TO WS-ERROR
           END-IF.

       *--------------------------------------------------------------
       * GRABAR REGISTRO VALIDO
       *--------------------------------------------------------------
       GRABAR-VALIDO.
           STRING
               ENT-CODIGO " "
               ENT-NOMBRE " "
               ENT-EDAD " "
               ENT-SALARIO
               INTO WS-LINEA
           END-STRING
           WRITE REG-VAL FROM WS-LINEA.

       *--------------------------------------------------------------
       * GRABAR REGISTRO ERRONEO
       *--------------------------------------------------------------
       GRABAR-ERROR.
           STRING
               "ERROR: " WS-MENSAJE-ERR " | "
               ENT-CODIGO " "
               ENT-NOMBRE " "
               ENT-EDAD " "
               ENT-SALARIO
               INTO WS-LINEA
           END-STRING
           WRITE REG-ERR FROM WS-LINEA.
