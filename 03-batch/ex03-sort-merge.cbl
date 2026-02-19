      ******************************************************************
      * Author: AARON
      * Date: 19-02-2026
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX03-SORT-MERGE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
               SELECT ARCH-A ASSIGN TO "a.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.
               SELECT ARCH-B ASSIGN TO "b.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.
               SELECT ARCH-SORTED ASSIGN TO "ordenado.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.
               SELECT ARCH-MERGED ASSIGN TO "fusionado.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  ARCH-A.
       01  REG-A       PIC X(50).

       FD  ARCH-B.
       01  REG-B       PIC X(50).

       FD  ARCH-SORTED.
       01  REG-SORTED  PIC X(50).

       FD  ARCH-MERGED.
       01  REG-MERGED  PIC X(50).

      *----------------------------------------------------------------*
      *    SD PARA SORT Y MERGE ( OBLIGATORIO)                         *
      *----------------------------------------------------------------*

       SD  SORT-WORK.
       01  SORT-REG        PIC X(50).

       WORKING-STORAGE SECTION.

       01  WS-REG      PIC X(50).

       PROCEDURE DIVISION.

      ******************************************************************

      *    PRIMERA PARTE: ORDENAR ARCHIVO ARCH-A

      ******************************************************************

           DISPLAY "Ordenando archivo A..."

           SORT ARCH-SORTED
               ON ASCENDING KEY WS-REG
               USING ARCH-A
               GIVING ARCH-SORTED
           DISPLAY "Archivo A ordenado en 'ordenado.txt'."

      ******************************************************************

      *    SEGUNDA PARTE: FUSIONAR ARCHIVO A Y B

      ******************************************************************

           DISPLAY "Fusionando archivos A y B..."


           MERGE ARCH-SORTED
               ON ASCENDING KEY WS-REG
               USING ARCH-A ARCH-B
               GIVING ARCH-MERGED

           DISPLAY "Archivos fusionados en 'fusionado.txt'"


            STOP RUN.
       END PROGRAM EX03-SORT-MERGE.
