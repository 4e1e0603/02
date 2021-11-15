! -*- coding: utf-8 -*-
!
! PROGRAM:
!   Random walk simulation
!
! See README file for more information.
!
module random_walk

    implicit none

    private

        !! The position on 2-dimensional lattice.
        type, public :: position
            real :: x = 0.0;
            real :: y = 0.0;
        end type

    public :: simple_random_walk_2D, update_position

    contains

    ! pure
    function update_position(random, current) result(updated)
        !! Update the current position.
        !!
        !!            N
        !!          W o E
        !!            S
        !!
        !! @param random  The random number.
        !! @param current The current position.
        !! @return output The updated position.
        !!
        implicit none

        real,           intent(in)  :: random
        type(position), intent(in)  :: current
        type(position)              :: updated

        updated % x = current % x
        updated % y = current % y

        if (random >= 0.0 .and. random < 0.25) then
            updated % x = (current % x) - 1 ! W
            ! print *, "x - 1"
        end if

        if (random >= 0.25 .and. random < 0.5) then
            updated % x = (current % x) + 1 ! E
            ! print *, "x + 1"
        end if

        if (random >= 0.5 .and. random < 0.75) then
            updated % y = (current % y) - 1 ! S
            ! print *, "y - 1"
        end if

        if (random >= 0.75 .and. random < 1.0) then
            updated % y = (current % y) + 1 ! E
            ! print *, "y + 1"
        end if

    end function

    ! pure
    function simple_random_walk_2D(steps, trials, randoms) result(walks)
        !! Realize 2-dimensional simple random walk on ℤ for the given number of steps and trials.
        !!
        !! @param steps   The number of random walk steps.
        !! @param trials  The total number of random walk experiments.
        !! @param randoms The array with random numbers with size = (trials, steps)
        !! @return        The  `x`, `y` position coordinates and Euclidean distance from the origin.
        !!
        implicit none

        integer, intent(in) :: steps, trials            ! The input variable.
        real, dimension(:,:,:), allocatable :: walks    ! The output array for (x,y,d).

        real, intent(in)    :: randoms(trials, steps)   ! The random numbers.
        type(position)      :: current                  ! The current position (0,0).
        integer             :: trial, step              ! The current trial and step.

        allocate(walks(1:trials, 1:steps, 1:3))         ! Allocate the output array.

        do trial = 1, trials
            ! Reset the position before each run.
            current % x = 0.0
            current % y = 0.0

            do step = 1, steps
                current = update_position(randoms(trial, step), current)
                ! Save the position and distance.
                walks(trial, step, 1) = current % x
                walks(trial, step, 2) = current % y
                walks(trial, step, 3) = sqrt((current % x) ** 2 + (current % y) ** 2)
            end do
        end do

    end function

end module
