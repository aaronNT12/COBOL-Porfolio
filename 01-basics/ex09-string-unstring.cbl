      ******************************************************************
      * Author: AARON
      * Date: 17-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRING-UNSTRING.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  NOMBRE      PIC A(10)   VALUE "AARON".
       01  APELLIDO    PIC A(10)   VALUE "NAVEIRA".
       01  COMPLETO    PIC A(25).

       01  TEXTO        PIC X(20)   VALUE "UNO-DOS-TRES".
       01  PARTE1        PIC X(5).
       01  PARTE2        PIC X(5).
       01  PARTE3        PIC X(5).

       PROCEDURE DIVISION.

           *> --- STRING: unir nombre y apellido ---
           STRING NOMBRE DELIMITED BY SPACE
                  " "    DELIMITED BY SIZE
                  APELLIDO DELIMITED BY SPACE
                  INTO COMPLETO
           END-STRING.

           DISPLAY "Nombre completo: " COMPLETO.

           *> --- UNSTRING: separar por guiones ---

           UNSTRING TEXTO
               DELIMITED BY "-"
               INTO PARTE1
                    PARTE2
                    PARTE3
           END-UNSTRING.

           DISPLAY "Parte 1: " PARTE1
           DISPLAY "Parte 2: " PARTE2
           DISPLAY "Parte 3: " PARTE3


            STOP RUN.
       END PROGRAM STRING-UNSTRING.
