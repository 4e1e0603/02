---
title: Fortran
author: David Landa
category: programming
---


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

# Vstupně/výstupní operace.

Výpis do konzole (standardního výstupu)


    print

Čtení z konzole (standardního vstupu)
    read

Formátování výstupu.
