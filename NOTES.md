## Struktua progamu

- program
- module
- procedure
  - function
  - subroutine

```fortran
program <name>
  implicit none
  ! ... code ...
end program
```

```fortran
module <name>
    implicit none

    ! Specifikace datových typů, proměnných atd.

    contains;

    ! procedury.

end module
```

```fortran

```

## Základní příkazy

Vstup a výstup

větvení

opakování

```
for end for
```

```
forall end forrall
```

```
```

Volání funkce pomocé příkazu `call`


## Objektově orientované programování

Fortran 90 přinesl možnost lěpšího modulárního a také objektově orientovaného programováni.



# Skutečný průběh

__Glosář__

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

__Lekce 01__
Probrali jsem základní konstrukce Fortranu.
Vysvětlii jsem jaký je rozdíl mezi souborem s příponou `.f` a `.f90`.
Ukázali jsem si strukturu souboru: program, proměnná a konstanta, funkce, subrutina, modul. Probrali jsem zákaldní číselné a datové typy. Přeložili jsme pár ukázkových programů "hello world" v GNU Fortran (`gfortran`).

__Lekce 02 -- __
Čiselné a řetezcové konverze, načítaní a zápis do konzole.

__Lekce 03 -- Pole__

# Knihovny pro numerické výpočty

- IMKL
- LAPACK, BLAS
