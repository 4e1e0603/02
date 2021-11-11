# Přehled

- Překladače
  - gfortran GNU
  - ifort Intel
- struktura programu
  - `module`
  - `program name`
  - `subroutine name(arguments)`
  - `function name(arguments)`
  - `use`
  - `contains`

- proměnné a základní datové typy
  - číselné: `complex(kind), integer(kind), real(kind)`
  - znakové: `character(length)`
  - logické: `logical(kind)`
  - konverze: `implicit none`
- pole
    - 1D, 2D, 3D atd.

- Výrazy a operátory
  - aritmetické
  - relační
  - logické (boolovské)
  - znakové
  - vlastní (definované)
  -

- vstup a výstup
  - čtení a zápis ze/z konzole (standardní vstup)
    - `print`
  - čtení a zápis ze/z souboru

- Větvění (conditions)
  - `if (condition) then; ...; elseif (condition) then; ...; else; ...; endif`
  - `select case`
  - `where`

- Opakování (cycles/loops)
  - `do i=min, i=max, stride;...; enddo`
  - `do while(condition);...; enddo`
  - do;...;enddo
  - `forall ();...; end forall`

- Funkce vlastní a volání podprogramu `call`
- Testování
  - http://fortranwiki.org/fortran/show/Unit+testing+frameworks

---
title: Programování ve Fortranu
---

# Fortran

Poznámky k předmětu _Programování ve Fortranu_. Tyto poznámky původně vznikaly v průběhu přednášky pod laskavým vedením [Ladislava Hanyka](http://geo.mff.cuni.cz/users/hanyk/) z katedry geofyziky na matematicko-fyzikální fakultě UK.

## Úvod a prostředí pro vývoj

Fortran je kompilovaný a staticky typovaný jazyk určený především pro numerické úlohy.
Je nutné mít na paměti, že jeho historie sahá velmi daleko a můžeme narazit na mnoho
programů, které jsou psané pro veri fortranu i desítky let starou typicky Fortran 77.
Jako každý jazyk se však i Fortran mění a jeho nejdnovější specifikace je 2018. Za
moderní verzi fortranu lze považovat verzi 90 či spíše 95 a výše. V této verzi uméí
fortran spoustu věcí, které by člověk čekal od moderního programovacího jazyka a
troufám si říci, že v čitelnosti si kolikrát nezadá any s Pythonem. většina numerických
úloh, které musí být vysoce výkonné tj, vektorizované anebo paralelizované buď používá
C++ nebo Fortran. Proto jazyk Frotran má stále a bude mít své místo pro specifické úlohy,
které potřebují být rychlé a kde se počítá každá milisekunda výpočtu a megabyte paměti.
Nenechte se odradit, moderní fortran je opravdu přívětivý jazyk a oproti C++, které potřebuje
šablony a metaprogramování pro spoustu pokročilých úloh (což sebou nese velkou kongnitivní zátěž)
zůstává frotran na pohled velmi čitelný a jednodychý. Osttaně jak se říka "right tool for right job".

### Proč Fortran?

Fortran vždy byl a zůstáva jazykem specializovaným na matematické výpočty. Prakticky to znamená, že kromě numerického programování se s ním mimo tuto doměnu zřejmě nestkáte. Tím se liší např od jazyků jako C a zejména C++, které jsou v mnoha ohledech jeho konkurentem v oblasti numerických výpočtů, ale setkáte se s nimi i v mnoha jiných doménách. Přesto všechno má, zejména moderní verze Fortranu, co nabídnout. Nejenže na mnoho úloh bude Fortran zřejmě stále optimálnější a to jak do výpočetní a paměťové náročnosti, tak i čitelnosti programu, než C++. Tam kde v C++ pro maximální výkon nastupují docela pokročilé partie jeho standardu, které často značně snižují čitelnost programu (viz template metaprogramming), tam si ve Fortranu vystačíte s jeho základními a zabudovanými funkcemi. Troufám si říci, že pěkně psaný Fortranovský kód si v čitelnosti nezadá ani s jazykem Python.

Kromě jiného se vyplatí znát Fortran jistě z historických důvodů. Za prvé mnoho knihoven pro numerickou lineární algebru je stále napsáno ve Fortran 77 a vyšší programovací jazyky se na ně často odvolávají a volají jejich rutiny. Za druhé jde o jazyk velmi jednoduchý a nezáludný a programy v něm napsané josu často psané v jednom stylu. porovnáme li to znovu např. s C++, co _code base_, to jiný styl, protože C++ je multiparadigmatický jazyk.

### Standardy a kompilátory Fortranu

- Fortran 1977 (Fortran 77)
- Fortran 1990 (Fortran 90)
- Fortran 1995 (Fortran 95)
- Fortran 2003 (Fortran 03)

Fortran je kompilovaný jazyk. Proto před spuštěním jakohokoliv programu, musíme zdrojový kód zkompilovat. Jde také o staticky typovaný jazyk, tzn. že kontrola typů se provádí při kompilaci programu.

Kompilaci jednoho souboru provedeme např. pomocé GNU Fortra kompilátru takto.

    gfrotran demo.f90

- Fortran je case insesitive tzn. že `program` je to samé co `Program` či dokoce `PROGRAM`.
- Pokračování řádku se zajistí pomocí znaku `&`. (Poznámka: Podobně v jazyku Python se používá zpětné lomítko `\`.)
- Příkazy se na řádku dají oddělit pomocí znaku `;`.  (Poznámka: Stejně tak v jazyku Python.)

## Instalace kompilátoru pod různými OS

TODO Windows a Ubuntu

Pokdu máme naistalován gfortran, můžeme se podívat, kde je umístěn.

V `cmd` zapíšeme příkaz

    where gfrotran

který např. vrací

    C:\Users\dlanda\gcc\bin\gfortran.exe

Pozor pro VS 2019:

## Jak použít CMake a Fortran

TODO

https://stackoverflow.com/questions/65771918/error-no-cmake-fortran-compiler-could-be-found-for-visual-studio-2019-fortran-s

## Pevný a volný formát

Fortran rozlišuje dva druhy souborů: 1) soubor s pevnou šířkou 2) ...

Většina kompilátorů pozná tuto konvenci z názvu souboru, kdy pro pevný formát volíme příponu `.f` nebo `,for` a pro volný formát přípony `f90` případně další `f95`, `f03` atd.

Pravidlo tedy zní, že pokud máme soubor s pevným formátem, pak použijem vždy příponu `.f` zatímco pro volný formát cokoliv jiného, co náš kompilátor podporuje. Přestože moderní fortran existuje již v mnoha verzích/standardech jako je Fortran 1990, 1995, 2003 atd, doporučuje se soubor splňující aspoň moderní standard z roku 1990 jednoduše uvádět s příponou `.f90`. Náš kompilátor a systém zřejmě pozná i `f95` nebo `f03`, ale bude lepší zůstat u jedné a ověřené přípony.

Pokud náš program vyžaduje jakoukoliv novější verzi, zřejmě se se vůbec nezkompiluje. Jako verzi kompilátoru náš projekt potřebuje uvedeme v sourboru README, nebo v komentáři na zaátku souboru.

Specifika starého pevného formátu.

- V případě pevného formátu, vše co je za XX sloupcem, je ignorováno.
- Mezery nejsou signifikantní. To znamená, že klíčové slovo `program` a `p r o g r a m` mají stejný význam.

Poznámka: Limitace na délku řádku souvisí s tím použitím děrných štítků .)

## Komentáře

Fortran umožňuje psát komentáře do zdrojového souboru pomocí znaku `!`. Vše uvedené na řádku za tímto znakem je chápáno jako komentář. Fortran neumožňuje tzv. vířádkové komentáře. Pokud tedy chceme zakomentovat několik řádků najednou, můsíme buď na začátek každého řádku zapsat znake `!` nebo využít funkci našeho textového editoru. většina editorů umožňuje označit a zakomentovat/odkomentovat celý blok textu. (Poznámka: Podobně budeme postupovat např. v jazyce Python).

```fortran
! Toto je komentář na začátku souboru.
program comment
! Komentář v kódu.
end program
```
