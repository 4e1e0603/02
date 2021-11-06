# Programování ve Fortranu

Lectures: see the `notes` directory.
Examples: see the `source` directory.


Installation of gfortran on Windows ...

In `cmd` locating the gfortran.exe

    where gfrotran

gives

    C:\Users\dlanda\gcc\bin\gfortran.exe

Pozor pro VS 2019:

https://stackoverflow.com/questions/65771918/error-no-cmake-fortran-compiler-could-be-found-for-visual-studio-2019-fortran-s


## Build

```shell
cmake -B build
cmake --build build
```

or

```shell
gfortran source/<file_name.f90> -o build/<file_name>
```

## Lectures (Jak šel čas)

__Lekce 01__: Základní konstrukce

Probrali jsem základní konstrukce Fortranu. Vysvětlii jsem jaký je rozdíl mezi souborem s příponou `.f` a `.f90`.
Ukázali jsem si strukturu souboru: program, proměnná a konstanta, funkce, subrutina, modul. Probrali jsem zákaldní číselné a datové typy. Přeložili jsme pár ukázkových programů *hello world* v GNU Fortran (`gfortran`).

__Lekce 02__: číselné a řetězové literály a konverze (přetypování), přesnost při práci s desetinnými čísly (*floatiing point*)

Čiselné a řetezcové konverze, načítaní a zápis do konzole.

__Lekce 03__: Ukazatele a pole

Probrali jsme práci s ukazateli: deklarace ukazatale, alokace ukazatele, dealokace ukazatele, ukazatel na skalár, ukazatel na pole.
Ukázali jsem si jaké problémy mohou nastat při práci s ukazateli.

__Lekce_XX__: Knihovny pro numerické výpočty (IMKL, LAPACK, BLAS)

...

__Slovníček__

- attribut
- literál
- inicializační výraz
- standardní typ
- odvozený typ
- modul
- subrutina
- procedura
- funkce
- program
- implicitní typování
- přetypování
- skalár
- pole
  - statické
  - dynamické
  - alokovatelné
- typ
- podtyp *kind*
- délka *len*


## Odkazy

Poznámky od doc. L. Hanyka
- http://geo.mff.cuni.cz/users/hanyk/
- http://geo.mff.cuni.cz/users/hanyk/NPRF017/index.htm
- http://geo.mff.cuni.cz/users/hanyk/NGEO022/index.htm
- http://geo.mff.cuni.cz/users/hanyk/NPRF039/index.htm

Různé zdroje dostupné online.
- https://annefou.github.io/Fortran/
