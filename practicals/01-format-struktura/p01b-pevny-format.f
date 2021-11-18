! Formatovani zdrojoveho kodu: pevny format (obvykle pripony .f, .for)
! jedina moznost ve Fortranu 77, zachovana i ve Fortranu 90+

! delka radku az 72 znaku, nerovnocenne pozice
! radkovy komentar za c/C v 1. sloupci (ve Fortranu 90+ i za vykricnikem kdekoliv)
! navesti v 1.-5. sloupci
! neprazdny znak v 6. sloupci pro pokracovaci radek
! popisy a prikazy v 7.-72. sloupci
! komentar od 73. sloupce
! mezery bezvyznamne

C komentar
C navesti 1-5
C pokracovaci radek 6
C vlastni kod 7-72
C komentar 73-...

C234567                                                                 |--> ignorovany prostor
      PRO GRAMp01       ! bezvyznamne mezery
      INTEGER i
      REAL x,PI
      PARAMETER         ! inicializace symbolickych konstant v f77
     &  (PI=3.1415926,PI2=PI*2.)  ! pokracovaci radek (neprazdny znak v 6. sloupci)
      COMPLEX c
      DATA c/(-1.,0.)/  ! inicializace promenne v f77
      i=-1
      x=-1.
      print *,i,x,sqrt(x),sqrt(c)
      goto 99
99    continue          ! navesti v 1.-5. sloupci
      E N D             ! bezvyznamne mezery
