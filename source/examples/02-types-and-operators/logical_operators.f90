!
! Example:
!   Shows how to use logical operators: `.not.`, `.or.`, `.and.`, `.eqv.`, `.neqv.`
!
program example_logical_operators
    implicit none

    logical, parameter :: T = .true., F = .false.

    print *, (.not. T), (.not. F)
    print *, (T .or. F), (T .or. T), (F .or. F)
    print *, (T .and. F), (T .and. T), (F .and. F)
    print *, (T .eqv. F), (T .eqv. T), (F .eqv. F)
    print *, (T .neqv. F), (T .neqv. T), (F .neqv. F)

end program
