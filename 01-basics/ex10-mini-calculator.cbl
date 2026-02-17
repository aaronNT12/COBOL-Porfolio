      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MINI-CALCULATOR.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  NUM1        PIC 9(4).
       01  NUM2        PIC 9(4).
       01  RESULTADO   PIC 9(6).
       01  OPERACION   PIC X(1).

       PROCEDURE DIVISION.

           DISPLAY "Itroduce el primer numero: ".
           ACCEPT NUM1.

           DISPLAY "Introduce el segundo numero: ".
           ACCEPT NUM2.

           DISPLAY "Operacion (+ - / *): ".
           ACCEPT OPERACION.

           EVALUATE OPERACION
               WHEN "+"
                   COMPUTE RESULTADO = NUM1 + NUM2
               WHEN "-"
                   COMPUTE RESULTADO = NUM1 - NUM2
               WHEN "*"
                   COMPUTE RESULTADO = NUM1 * NUM2
               WHEN "/"
                   IF NUM2 = 0
                       DISPLAY "Error: division por cero."
                       STOP RUN
                   ELSE
                       COMPUTE RESULTADO = NUM1 / NUM2
                   END-IF
               WHEN OTHER
                   DISPLAY "Operacion no validad."
                   STOP RUN
           END-EVALUATE

           DISPLAY "Resultado: " RESULTADO.

            STOP RUN.
       END PROGRAM MINI-CALCULATOR.
