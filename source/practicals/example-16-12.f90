
! vracení pole

! Automatické pole jako návratová hodnota.
function f(a, n, m) result(result)
    ! integer, parameter :: dp  = 4
    real result(m)
    integer n
    real a(n)
    result = a(1:m)
    ! predpoklady
    ! result (1: min(m,n)) = a(1:min(m,n))
end function

! Automatické pole
function f3(a) result(result)
    real a(:)
end function

! Vracíme alokovatelné pole
function f4(a) result(result)
    integer :: branch = 1
    real, allocatable :: result(:)
    real a(:)

    ! V modernim fortranu jsou tři cesty.
    select case (branch)
        case (1)
            allocate (result(size(a)))
            result = a
        case (2)
            allocate (result, source=a)
        case (3)
            result = a
    end select
end function

! function f5(a) result(result)
!     real, pointer :: result(:)
!     real, target a(:)
! end function
