! ----------------------------------------------------------------------
! Wallclock timer
! Usage: call tic(); call task(); print *,toc()
! ----------------------------------------------------------------------
MODULE mTicToc

implicit none
private
public tic,toc
integer,parameter :: wp=8
real(wp) :: time

CONTAINS

subroutine tic()
integer count,count_rate
call system_clock(count,count_rate)
time=real(count,wp)/real(count_rate,wp)
end subroutine

real(wp) function toc()
integer count,count_rate
call system_clock(count,count_rate)
toc=real(count,wp)/real(count_rate,wp)-time
end function

END MODULE
