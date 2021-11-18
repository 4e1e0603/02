integer,parameter :: dp=8
integer i
real x
real(8) x8

print *,1_1,1_2,1_4,1_8
print *,int(1,1)
! print *,2_1**7_1-1_1,2**31-1
print *,huge(1_1),huge(1_2),huge(1_4),huge(1_8)
i=0
! print *,1/i
! print *,0/i

print *,1.,1e0,1._4,1e0_4 ! ne: 1_4
print *,1d0,1._8,1e0_8
print *,1._dp,1e0_dp
x=1e30
x=x**10
print *,x,1e300_8,real(x,8)
print *,huge(1._4),huge(1._8),huge(1._16)
print *,1./i,0./i

print *,1/3   ! integer divide
print *,1./3. ! single precision real divide
print *,1._8/3,1._8/3.,1._8/3._8
print *,0.3333333333333333333333333333,0.3333333333333333333333333333_dp
print *,real(0.333333333333333333333333,8)
x=1./10
print *,real(x,8)

print *,1/4*4,1/3+1/3+1/3   ! 0 0
print *,1/4*4.,1./3+1/3+1/3 ! 0. 0.3333333
print *,1./4*4,real(1./3+1./3+1./3,8) ! 0. 1.
print *,2**(-3),(1/2)**3,2**(-3.)

do x=0.,1.,0.1
  print *,x
enddo

do x8=0._8,1._8,0.1_8
  print *,x8
enddo

do x8=0.,1.,0.1
  print *,x8
enddo

do i=1,1000000000
  x=i
  if (int(x,4)/=i) then ! .ne., .not.(x.eq.i)
    print *,i,x,real(i,4),real(x,4)-real(i,4)
    exit
  endif
enddo

end
