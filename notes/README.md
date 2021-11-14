---
---

# Programování ve Fortranu


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

# Struktua progamu

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

# Vstupně/výstupní operace.

Výpis do konzole (standardního výstupu)


    print

Čtení z konzole (standardního vstupu)
    read

Formátování výstupu.



# Standardní datové typy a literály

Máme pět základních (zabudovaných) datových typů.

1. integer(kind)
2. real(kind)
3. complex(kind) (softwarová implementace)
4. logical(kind)
5. character(length)

6. record/struktura

Číselné: integer, real, complex
Znakové: character

Každý datový typ mlže mít atributy a kind.

Typové konverze

implicitní typování (`implicit none`)

Platnost je pro programovou jednotku, modul, program

# Struktura programu

...

# Operátory

## Logické

`.and.`, `.or.`, `.not.`, `.eqv.`, `.neqv.`



## Realtional

Relační nebo porovnávací operátory. Fortran 90 má šest relačních operátorů:

- `<`
- `<=`
- `>`
- `>=`
- `==`
- `/=`

## Atitmetické

# Numbers

Jak již bylo poznamenáno, síla Fortranu se projeví při numercikých výpočtech. Proto se podrobně podíváme na možnosti, které nám nabízejí číselné datové typy a přidružené funkce. Zejména se podíváme na práci s reálnými a komplexními čísly, protože znalost chování a možností čísel s desetinou tečkou (*floating point arithemic*) je jednou ze základních nějdůležitějších znalostí pro pochopení mnoha numercických operací a metod.

## Reprezentace čísel v počítači

- U čísel s desetinnou tečkou může záležet na pořadí operací.
- Některé početní operace nemohou být reprezentovány přesně, kvůli způsobu uložení čísel.
- Celá čísla uložena do typu s plovoucí desetinnou tečkou jsou reprezentována vždy přesně.

Nejběžnější reprezentace je pomocí pohyblivé řádové čárky (*floating point arithmentic*) danou standardem IEEE.

Pro uložení se používá
- mantisa M
- základ  B
- exponent E


Např. $0.01 \mathrm{(DEC)} = \pm 0.000 000 101 000 111 101 $

Takto je číslo 0.01 uloženo podle 32 bitového standardu tzn. *single precision* neboli 4 byty

```
      1. byte                  2. byte               3. byte          4. byte

|0|0|1|1| | | | |    |
 ^
znaménkový bit

```

Poznámka: Existují i jiné způsoby uložení čísel, např. pomocí pevné řádové tečky (čárky) tzv. *fized point*.


## Co nabízí Fortran?

Fortran umožňuje explicitně nastavit počet bytů čísla.

## Porovnání s Python/Julia


# Větvení

pro větvení programu na základě podmínky nabízí Fortran konstruce`

- `if ...`
- `if [...] end if`
- `if [...] else [...] end if`

# Iteration aka Loops

Pro opakování nejaké bloku kódu použijeme cyklu/smyčky.

- `for [...] end for`
- `forall [...] end forrall`



# Ukazatel *pointer*

Proměnná s atributem `pointer` ukazuje na něajký cíl.

pojmenovaný

    real, pointer :: p,
    real, target :: x = 1
    p => x
    r => x

nepojmenovaný

Jsou dvě cesty jak nulovat ukzatel.
- `NULLIFY` fortan 90
- `NULL` fortran 95

Přiřazovací příkaz pro ukazatele `=>`.
Fortna má automatickou deerferenci a proto existuje `=>`.
Pomocí rovnítka přistupujeme k cíli = dereference.

## Problematická situace.

1. Neinicializovaný ukazatel. Můžeme nastavit na NULL a testvat.
2. Únik paměti, *memory leak*
3. Vysící ukazatel *dangling pointer*
4. Dvojí dealokace (*double free*)
    - U intel komp. může spadnout bez výpisu.

```fortran
! Uvolnění neboli dealokace ukazatele.
deallocate(p)

if (associated(p))
    print *, p
end

! Memory leak
allocate(p)
p = 1.0
p => null()
```

Statické pole si neze historicky omezení na velikost okolo 2GB.

Ukazatelová pole: ve Fortranu se moc nepoužívá.
Používá se dynamické pole, ale alokovatelné.


# Pole *Arrays*

Fortran je jazyk zaměřený na práci s vektory, maticemi a tenzory, které jsou realizované pomocí pole.
U pole rozeznáváme počet dimenzí (*rank*), velikost (*size*) a tvar (*shape*), který můžeme chápat jako *rank* + *size*.
U pole můžeme dále určit jeho dolní a horní mez (*lbound* a *ubound*). Pokud mají pole stejný tvar, hovoříme o podobných polích (*conformable arrays*).

Pole je vlastně atribut datového typu tzn. že máme např pole celých čísel, nebo pole rálných čísel atd.

Rozeznáváme pole statické a dynamické. V případě statického pole je jeho velikost známa již v době překladu a naopka u dynamického pole máme možnost měnit jho velikost při běhu programu. Je jasné, že statické pole  a výpočty nad ním je možné lépe optimalizovat, protože překladač má dostatek informací v době překladu programu.


- Pole je indexováno od 1 do N.
- Pole jsou uloženy po sloupcích => ???, narozdíl např. od jiných jazyků.
- Pole může být argumentem funkce.
- Pole může být návratovou hodnotou funkce.
- Sekce pole neboli indexování

__Pojmy__
- _rank_   Počet dimenzí např. 1, 2, 3, až 7 (maximální počet).
- _extent_ Počet prvků podél vybrané dimenze (3), (5) a (5)
- _shape_  Počet prvků všech vybraných dimenzí např. (3), (3,3)
- _size_   Počet prvků, které pole obsahuje

```fortran
array ([lower]:[upper][:stride], ...)
```

## Deklarace pole


## Funkce pro práci s polem *array intrinsic functions*

- `size(array[,dim])`
- `shape(array)`
- `count(logical_array[, dim])`
- `sum(array[,dim][,mask])`
- `any(logical_array[,dim]`
- `minval()`, `maxval()`
- `minloc()`, `maxloc()`


## Druhy polí

### Statické pole

Specifikace obsahuje celý tvar včetně konstantních (v době kompilace daných -- compile-time) mezích => má pevné meze.

    integer, parameter :: n1, n2
    real :: array(n1, n2)

### Dynamické pole

Specifikace vyjadřuje pomocí znaku `:` počet jeho dimenzí, ale meze se stanoví až za běhu (v run-time) příkaze `allocate`.
Mluvíme pak o __alokovatelných polích__
Mluvíme pak o __ukazatelových polích__

### Příklady

Deklarace 1D pole



Deklarace 2D pole

Deklarace 3D pole

## Odkazy

- http://www.mathcs.emory.edu/~cheung/Courses/561/Syllabus/6-Fortran/array4.html


# Funkce a procedury

Deklarace funkce

Deklarace procedury.

Volání funkce pomocí příkazu `call`

# Objektově orientované programování

Fortran 90 přinesl možnost lěpšího modulárního a také objektově orientovaného programováni.


# Pojmy (*Gloassary*)

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

# Odkazy (*Resources*)

- http://fortranwiki.org/
- https://fortran-lang.org/
- https://github.com/fortran-lang/stdlib
- https://www.tutorialspoint.com/fortran/
- http://geo.mff.cuni.cz/users/hanyk/NPRF017/

- Poznámky od doc. L. Hanyka
- http://geo.mff.cuni.cz/users/hanyk/
- http://geo.mff.cuni.cz/users/hanyk/NPRF017/index.htm
- http://geo.mff.cuni.cz/users/hanyk/NGEO022/index.htm
- http://geo.mff.cuni.cz/users/hanyk/NPRF039/index.htm

- https://riptutorial.com/fortran

Různé zdroje dostupné online.
- https://annefou.github.io/Fortran/

Online dokumentace GNU Fortran kompilátoru. Najdeme tam popis chování a nastavení kompilátoru, stejně jako
popis typů a funkcí Fortranu.
- https://gcc.gnu.org/onlinedocs/gfortran/

Online zdroej pro Intel Fortran (oneAPI) kompilátor.
- https://www.intel.com/content/www/us/en/developer/tools/oneapi/fortran-compiler.html#gs.f1z15o


# Questions/Answers

Jaký je rozdíl mezi zápisem / který způsob se preferuje a proč?

    integer :: array(10)
    integer, dimension(10) :: array

    integer, dimesion(10) :: array1, array2

    integer :: array(10, 10)
    integer, dimension(10, 10) :: array

Jak nastavit vlastní rozsah pole?

    ! 1D
    integer array(0:9)
    integer array(-5:5)

    ! 2D (pozor včetně nula)
    integer array(-5:5,10)


Jaké hodnoty mají proměnné, které nebyli inicalizovány?

    ! Note: The `i` variable was not set to any value, the 0 was set implicitly by compiler.
    ! gfortran provides some options for this. Integers can be intialized with -finit-integer=n where n is an integer.
    ! For real numbers you can use -finit-real=<zero|inf|-inf|nan|snan>.
    ! Together with -ffpe-trap=denormal this can be very helpful, to get uninitialized reals.


---
přebrat
---


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

## Lectures

__Lesson XX__ Tvoříme konzolový program

- Command Line Interface (CLI) a argumenty příkazového řádku
- Proměnné prostředí

__Lesson XX__ Vlastní datové typy, struktury

__Lesson XX__ Objekty a objektově orientované programování (verze 2003+)


__Lekce_XX__: Numerical libraries (IMKL, LAPACK, BLAS)

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


- TODO `Forall` Example

## Some useful tools and links

This will be later moved to a standalone file in notes.

__Fortran žije!__
- https://insmart.cz/fortran-je-zpet-v-top-20/

__Format the source code ay.__
The `fprettify` is a modern Fortran auto-formatter written in Python, similar to `black` or `gofmt`, `rustfmt` etc.
- https://github.com/pseewald/fprettify

__Unit testing of Fortran code__
- https://fortranwiki.org/fortran/show/Unit+testing+frameworks
I think that `Vegetables` seems promising.

__Generic programming__
- https://fortranwiki.org/fortran/show/Generic+programming

__Enumerations in Fortran__
- https://github.com/MichaelSiehl/How-to-Code-Enumerations-in-Fortran/

- https://github.com/pseewald

__Mistakes in Fortran 90+__
- http://www.cs.rpi.edu/~szymansk/OOF90/bugs.html#4

- https://milancurcic.com/2019/05/22/map-filter-reduce-in-fortran-2018.html

- https://github.com/Fortran-FOSS-Programmers

- https://riptutorial.com/Download/fortran.pdf