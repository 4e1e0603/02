# Programming in Fortran

- The notes from lectures are in `notes` directory.
- The codes based on lectures are in `source` directory.
- The codes created on practicals are located in `practicals` directory.

## Build

At this moment, you can manually compile each example as

    gfortran source/<file_name.f90> -o build/<file_name>

We are working on Make/CMake support.

## Lectures (Jak šel čas)

__Lesson 01__: Fundamentals

Probrali jsem základní konstrukce Fortranu. Vysvětlii jsem jaký je rozdíl mezi souborem s příponou `.f` a `.f90`.
Ukázali jsem si strukturu souboru: program, proměnná a konstanta, funkce, subrutina, modul. Probrali jsem zákaldní číselné a datové typy. Přeložili jsme pár ukázkových programů *hello world* v GNU Fortran (`gfortran`).

__Lesson 02__: Literals, Types, Numbers, and Floating-point arithmetic.

číselné a řetězové literály a konverze (přetypování), přesnost při práci s desetinnými čísly (*floatiing point*)
Čiselné a řetezcové konverze, načítaní a zápis do konzole.

__Lesson 03__: Pointers and arrays

Probrali jsme práci s ukazateli: deklarace ukazatale, alokace ukazatele, dealokace ukazatele, ukazatel na skalár, ukazatel na pole.
Ukázali jsem si jaké problémy mohou nastat při práci s ukazateli.

__Lesson 04__: ...

...

__Lekce_XX__: Numerical libraries (IMKL, LAPACK, BLAS)

...
