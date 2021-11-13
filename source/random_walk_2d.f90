! -*- coding: utf-8 -*-
!
! Program: Random walk simulation
!
! To simulate and analyze various types of random walks on the lattice in the plane (all steps are
! of the same length d = 1, but the direction is randomly chosen from a certain set of prescribed
! possibilities).
!
! 1. Simple random walk 2D
! steps in any of the four directions  with the same probability.
!
! 2. Random walk without immediate returns
! steps in three possible directions with the same probability, the first step is in any direction
!
! Refences:
! http://utf.mff.cuni.cz/vyuka/NTMF021/homeworks/HW_task_1.pdf

! Plot the mean distance vs number of steps (+ error bars given by standard deviation)
! Check that for every random walks dependence is of the form $R(n) = c n^{\alpha}$


module random_walk

    implicit none

    private

    public :: simple_random_walk_2D ! random_walk_simulation

    contains

    ! Evolve the coordinate value based on the given random value.
    ! (This is a helper procedure.)
    subroutine evolve_coordinate(r, c)
        implicit none

        real, intent(in) :: r  ! The random value between [0,1]
        real, intent(out) :: c ! The coordinat's current value.

        if (r >= 0.5) then
            c = c + 1
        else
            c = c - 1
        end if

    end subroutine


    ! Realize 2-dimensional simple random walk on ℤ for the given number of steps.
    ! Computes the `x`, `y` coordinates and Euclidean distance from the origin,
    function simple_random_walk_2D(steps, trials) result(values)
        implicit none

        integer, intent(in) :: steps, trials            ! The input variable.
        real, dimension(:,:,:), allocatable :: values   ! The output variable for (x,y,d) values.

        real :: rvalue                                  ! The random value.
        real :: x, y                                    ! The coordinates.
        integer :: step, trial                          ! A current step.

        allocate(values(1:trials,1:steps,1:3))          ! Set the size of the output array.
                                                        ! We store coordinates as [x, y, ..., x, y].
        do trial = 1, trials
            x = 0.0
            y = 0.0
            do step = 1, steps

                ! The `x` coordinate direction choice.
                call random_number(rvalue)
                call evolve_coordinate(rvalue, x)

                ! The `y` coordinate direction choice.
                call random_number(rvalue)
                call evolve_coordinate(rvalue, y)

                 ! Save the `(x, y, d)` coordinates and calculate Euclidean distance
                values(trial, step, 1) = x
                values(trial, step, 2) = y
                values(trial, step, 3) = sqrt(x ** 2 + y ** 2)

            end do
        end do

    end function

end module


! TODO Simple command line interface.

program random_walk_simulation

    use random_walk, only: simple_random_walk_2D

    implicit none

    integer :: step, trial
    integer, parameter :: STEPS = 10, TRIALS = 10

    real :: walk(1:TRIALS, 1:STEPS, 1:3)

    walk = simple_random_walk_2D(TRIALS, STEPS)

    do trial = 1, TRIALS
        do step = 1, STEPS
            ! print '((f5.1) "," (f5.1) "," (f5.1))', walk(trial, step, 1), walk(trial, step, 2), walk(trial, step, 3)
            write(*, *) walk(trial, step, 1), walk(trial, step, 2), walk(trial, step, 3)
        end do
        ! print '(A)', new_line('')
        write(*, *) ''  ! this gives you the line break
    end do

end program