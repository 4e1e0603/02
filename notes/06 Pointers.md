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
