# Programming in Fortran

- The notes from lectures are in `notes` directory.
- The codes based on lectures are in `source` directory.
- The codes created on practicals are located in `practicals` directory.

## Build

At this moment, you can manually compile each example as

    gfortran source/<file_name.f90> -o build/<file_name>

We are working on Make/CMake support.

## Manage

    python manage.py index   # works
    python manage.py clean   # works
    python manage.py release # todo

## Coding style

We do not repeat the name of the program or procedure after the `end`  unless it is very long script.

    program program_name
        implicit none
        ! code !
    end

    function function_name
        implicit none
        ! code !
    end

## Lectures

__Lesson 01__: Fundamentals

Probrali jsem základní konstrukce Fortranu. Vysvětlii jsem jaký je rozdíl mezi souborem s příponou `.f` a `.f90`.
Ukázali jsem si strukturu souboru: program, proměnná a konstanta, funkce, subrutina, modul. Probrali jsem zákaldní číselné a datové typy. Přeložili jsme pár ukázkových programů *hello world* v GNU Fortran (`gfortran`).

__Lesson 02__: Literals, Types, Numbers, and Floating-point arithmetic.

číselné a řetězové literály a konverze (přetypování), přesnost při práci s desetinnými čísly (*floatiing point*)
Čiselné a řetezcové konverze, načítaní a zápis do konzole.

__Lesson 03__: Pointers and arrays

Probrali jsme práci s ukazateli: deklarace ukazatale, alokace ukazatele, dealokace ukazatele, ukazatel na skalár, ukazatel na pole.
Ukázali jsem si jaké problémy mohou nastat při práci s ukazateli.

Přístup k kednomu prvku pole, přístup k více prvkům pole tzv. řez (*slice*).

Alokovatelné pole jsou bezpěčné, protože zanikají na konci procedury.



__Lesson 04__: ...

### Vnitřní procedury (*intrinsic procedures*)

Vnitřní procedury jsou a procedury  definované standardem a zabudované do implementace Fortranu. Rozeznáváme

- dotazovací funkce (*array inquiry functions*) vrací informace o vlastnostech pole jako
  - `shape(array)`
  - `size(array[,dim])`
  - `lbound(array[,dim])`, `ubound(array[,dim])`
  - `allocated(array)`

- prvkové funkce (*???*) vrací skalár nebo pole vyhodnocené prvek po prvku
  - `abs`, `dim`, `max`, `min`, `random_number`

-  multiplikační funkce jako skalární součin a maticové násobení
  - `dot_product`, `matmul`

- transformační funkce
  - `all`, `any`, `count`, `maxval`, `minval`, `product`, `sum`, `maxloc`, `minloc`

- manipulační funkce
  - `merge`, `pack`, __`reshape`__, `spread`, `cshift`, `eoshift`, `transpose`

### Vnější procedury (*external procedures*)

Všechny procedury, které nejsou definované standardem a tudíž musí být námi implementovány.
Jednoduše řečeno, vnitřní procedury odpovídají zabudovaným funkcím, v jiných jazycích se nacházejí v tzv. standardní knihovně
a vnější procedury jsou všechny ostatní ,které vytvoří programátor.

Dále rozlišujeme

- rekurzivní procedury (*recursive subroutine/function*)
- čisté procedury neboli čisté funkce (*pure function*), tj. funkce bez vedlejších efektů tak jak to známe z funkcionálních jazyků (verze 1995).
- prvkové procedury
- explicitní rozhraní (*explicit interface*)
- interface blok

__Lesson XX__ Tvoříme konzolový program

- Command Line Interface (CLI) a argumenty příkazového řádku
- Proměnné prostředí

__Lesson XX__ Vlastní datové typy, struktury

__Lesson XX__ Objekty a objektově orientované programování (verze 2003+)


__Lekce_XX__: Numerical libraries (IMKL, LAPACK, BLAS)

...

## Some useful tools and links

This will be later moved to standalone file in notes.

__Fortran žije!__
- https://insmart.cz/fortran-je-zpet-v-top-20/

__Format the source code ay.__
The `fprettify` is mordern Fortran auto formatter written in Python, similar to `black` or `gofmt`, `rustfmt` etc.
- https://github.com/pseewald/fprettify

__Unit testing of Fortran code__
- https://fortranwiki.org/fortran/show/Unit+testing+frameworks
I think that `Vegetables` seems promising.

__Generic programming__
- https://fortranwiki.org/fortran/show/Generic+programming

__Enumerations in Fortran__
- https://github.com/MichaelSiehl/How-to-Code-Enumerations-in-Fortran/

- https://github.com/pseewald