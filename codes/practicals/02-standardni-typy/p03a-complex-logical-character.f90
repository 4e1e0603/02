! Datove typy complex, logical, character
! Konverze mezi cisly a retezci

program p03
implicit none      ! potlaceni implicitni jmenne konvence, vynuceni explicitnich popisu promennych
integer,parameter :: sp=4,dp=8,length=50 ! pojmenovane konstanty
integer(sp) i4     ! podtyp (kind) jako pojmenovana konstanta
real(sp) r4
complex(sp) c4
complex*8 cc4      ! complex(4) totez co complex*8
real(dp) r8
complex(kind=dp) c8
complex*16 cc8
logical L          ! default: 4 byty
character CH1      ! default: 1 znak, 1 byte/1 znak
character(10) CH10 ! 10znakovy retezec
character(len=length) CH50 ! 50znakovy retezec
! character(len=length,kind=2) ch_utf8 ! 2bytove znaky neimplementovany

! typ complex
print *,(0.,1.),(0._8,1._8)                          ! complex(4),complex(8)
print *,cmplx(0._8,1._8),cmplx(0,1,kind=8)           ! complex(4),complex(8)
print *,cmplx(x=0,y=1,kind=4), cmplx((0.,1.),kind=8) ! complex(4),complex(8)

! cesta k single precision complex odmocnine
print *,'sqrt(-1.)...'
i4=-1
! print *,sqrt(i4) ! nedefinovano, nelze prelozit
r4=-1.
c4=sqrt(r4)
print *,c4         ! (NaN,0.)
cc4=-1.            ! ekvivalentne: c4=(-1.,0.)
cc4=sqrt(cc4)
print *,cc4        ! (0.,-1.)

! cesta k double precision complex odmocnine
print *,'sqrt(-1._8)...'
r8=-1.
c8=sqrt(r8)
print *,c8         ! NaN
cc8=-1.            ! ekvivalentne: c8=(-1.,0.)
cc8=sqrt(cc8)
print *,cc8        ! (0.,-1.)

! typ logical
L=.false.
print *,'logical type'
print *,L,.not.L ! F T

! typ character
print *,'character type'
CH1='a'//"A"       ! retezeni (ne +), do CH1 se ulozi cast o staticke delce podle popisu
print *,CH1        ! a
CH10='a'//"A"      ! ulozi se 2 znaky+8 mezer
print *,CH10//'end'! aA........end
print *,trim(CH10),'end' ! aAend

! konverzni funkce znak <-> integer
print *,'conversions via ichar/char'
print *,ichar('0'),ichar('1'),ichar('A'),ichar('B'),ichar('a'),ichar('b') ! 48 49 65 66 97 98
print *,ichar('5')-48  ! 5
i4=5
print *,i4,char(i4+48) ! 5 5

! vstup a vystup klavesnice/obrazovka
print *,'standard input and standard output'
print *,'Zadejte integer:'
read *,i4
print *,i4
! totez
print *,'Zadejte integer:'
read (*,*) i4
write (*,*) i4

! konverze mezi cisly a retezci cestou read/write (retezce jako "vnitrni soubory")
print *,'conversions via internal files'
i4=1
r4=1.
write (CH50,*) i4,r4 ! zapis do retezce CH50
print *,'retezec: ',CH50
CH50='2 2e0'
read (CH50,*) i4,r4  ! nacitani z retezce CH50
print *,'cisla:   ',i4,r4

end program
