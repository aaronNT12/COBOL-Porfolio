           ******************************************************************
       * Author: AARON
       * Date: 18-02-2026
       * Purpose: Mini base de datos indexada
       * Tectonics: cobc
       ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. MINI-DATABASE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DB ASSIGN TO "mini-db.idx"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS ID
               FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD  DB.
       01  REGISTRO.
           05 ID       PIC 9(4).
           05 NOMBRE   PIC X(20).

       WORKING-STORAGE SECTION.
       01  FS          PIC XX.
       01  OPCION      PIC 9.
       01  TEMP-ID     PIC 9(4).
       01  TEMP-NOMBRE PIC X(20).
       01  FINAL       PIC X VALUE "N".

       PROCEDURE DIVISION.

       MAIN-PROGRAM.
           PERFORM UNTIL FINAL = "S"
               DISPLAY "====================================="
               DISPLAY "           MINI BASE DE DATOS        "
               DISPLAY "====================================="
               DISPLAY "1. Insertar registro"
               DISPLAY "2. Buscar registro"
               DISPLAY "3. Listar registros"
               DISPLAY "4. Salir"
               DISPLAY "Opcion: "
               ACCEPT OPCION

               EVALUATE OPCION
                   WHEN 1
                       PERFORM INSERTAR
                   WHEN 2
                       PERFORM BUSCAR
                   WHEN 3
                       PERFORM LISTAR
                   WHEN 4
                       MOVE "S" TO FINAL
                   WHEN OTHER
                       DISPLAY "Opcion no valida."
               END-EVALUATE
           END-PERFORM.

           STOP RUN.

       *****************************************************************
       *   SECCION: INSERTAR
       *****************************************************************
       INSERTAR SECTION.

           OPEN I-O DB
               ON EXCEPTION
                   OPEN OUTPUT DB
                   CLOSE DB
                   OPEN I-O DB
           END-OPEN

           DISPLAY "ID: "
           ACCEPT TEMP-ID
           DISPLAY "Nombre: "
           ACCEPT TEMP-NOMBRE

           MOVE TEMP-ID TO ID
           MOVE TEMP-NOMBRE TO NOMBRE

           WRITE REGISTRO
               INVALID KEY
                   DISPLAY "Error: ID duplicado."
               NOT INVALID KEY
                   DISPLAY "Registro insertado."
           END-WRITE

           CLOSE DB.
           EXIT SECTION.

       *****************************************************************
       *   SECCION: BUSCAR
       *****************************************************************
       BUSCAR SECTION.

           OPEN INPUT DB.

           DISPLAY "ID a buscar: "
           ACCEPT TEMP-ID

           MOVE TEMP-ID TO ID

           READ DB
               INVALID KEY
                   DISPLAY "No existe este ID."
               NOT INVALID KEY
                   DISPLAY "ID: " ID
                   DISPLAY "Nombre: " NOMBRE
           END-READ

           CLOSE DB.
           EXIT SECTION.

       *****************************************************************
       *   SECCION: LISTAR
       *****************************************************************
       LISTAR SECTION.

           OPEN INPUT DB.

           START DB KEY >= 0000
               INVALID KEY
                   DISPLAY "Base de datos vacía."
                   CLOSE DB
                   EXIT SECTION
           END-START

           PERFORM UNTIL FS = "10"
               READ DB NEXT
                   AT END
                       MOVE "10" TO FS
                   NOT AT END
                       DISPLAY ID " - " NOMBRE
               END-READ
           END-PERFORM

           DISPLAY "Fin de la lista."
           CLOSE DB.
           EXIT SECTION.
