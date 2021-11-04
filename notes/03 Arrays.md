# Pole *Arrays*

Fortran je jazyk zaměřený na práci s vektory, maticemi a tenzory, které jsou realizované pomocí pole.
U pole rozeznáváme počet dimenzí (*rank*), velikost (*size*) a tvar (*shape*), který můžeme chápat jako *rank* + *size*.
U pole můžeme dále určit jeho dolní a horní mez (*lbound* a *ubound*). Pokud mají pole stejný tvar, hovoříme o podobných polích (*conformable arrays*).

Pole je vlastně atribut datového typu tzn. že máme např pole celých čísel, nebo pole rálných čísel atd.

Rozeznáváme pole statické a dynamické. V případě statického pole je jeho velikost známa již v době překladu a naopka u dynamického pole máme možnost měnit jho velikost při běhu programu. Je jasné, že statické pole  a výpočty nad ním je možné lépe optimalizovat, protože překladač má dostatek informací v době překladu programu.

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