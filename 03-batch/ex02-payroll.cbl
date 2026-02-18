       ******************************************************************
      *Author: AARON
      * Date: 18-02-2026
      * Purpose:
      * Tectonics: cobc
       ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYROLL.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE ASSIGN TO "empleados.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-REG.
           05 EMP-ID           PIC 9(4)
           05 EMP-NOMBRE       PIC X(20).
           05 EMP-HORAS        PIC 9(3).
           05 EMP-TARIFA       PIC 9(4)V99.

       WORKING-STORAGE SECTION.
       01 FS                PIC XX.
       01 FIN               PIC X VALUE "N".
       01 SALARIO           PIC 9(7)V99 VALUE 0.
       01 TOTAL-PAYROLL     PIC 9(9)V99 VALUE 0.

       PROCEDURE DIVISION.

           OPEN INPUT EMP-FILE
           DISPLAY "FS tras OPEN: " FS

           PERFORM UNTIL FIN = "S"
               READ EMP-FILE
                   AT END
                       MOVE "S" TO FIN
                   NOT AT END
                       COMPUTE SALARIO = EMP-HOURS * EMP-RATE
                       ADD SALARIO TO TOTAL-PAYROLL

                       DISPLAY "Empleado: " EMP-NAME
                       DISPLAY "  Horas: " EMP-HOURS
                       DISPLAY "  Tarifa: " EMP-RATE
                       DISPLAY "  Salario: " SALARIO
                       DISPLAY "---------------------------"
               END-READ
           END-PERFORM

           CLOSE EMP-FILE

           DISPLAY "==============================="
           DISPLAY " TOTAL NÓMINA = " TOTAL-PAYROLL
           DISPLAY "==============================="

           STOP RUN.
