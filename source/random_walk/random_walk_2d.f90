! -*- coding: utf-8 -*-

!! Module contains functions for randowm walk simulation.
!!
module random_walk

    implicit none

    private

    !! The position on 2-dimensional lattice.
    type, public :: position
        real :: x = 0.0;
        real :: y = 0.0;
    end type

    public :: simple_random_walk_2D, update_position, update_position_restricted

    contains

    pure function update_position(random, current) result(updated)
        !! Update the current position.
        !!
        !!    N     [0.0 ; 0.25) => go left  (x - 1, y) = West
        !!  W o E   [0.25 ; 0.5) => go right (x + 1, y) = East
        !!    S     [0.5 ; 0.75) => go down  (x, y - 1) = North
        !!          [0.75 ; 1.0) => go up    (x, y + 1) = South
        !!
        !! @param random  The random number.
        !! @param current The current position.
        !! @return output The updated position.
        !!
        implicit none

        real,           intent(in)  :: random
        type(position), intent(in)  :: current
        type(position)              :: updated

        if (random < 0.0 .or. random > 1.0) then
            ! RAISE ERROR OR RETURN 0?
        end if

        updated % x = current % x
        updated % y = current % y

        ! I decided not to use nested `if`s.
        if (random >= 0.0 .and. random < 0.25) then
            updated % x = (current % x) - 1
        end if

        if (random >= 0.25 .and. random < 0.5) then
            updated % x = (current % x) + 1
        end if

        if (random >= 0.5 .and. random < 0.75) then
            updated % y = (current % y) - 1
        end if

        if (random >= 0.75 .and. random < 1.0) then
            updated % y = (current % y) + 1
        end if

    end function

    function update_position_restricted(random, current, forbidden) result(updated)
        !! work-in-progress
        !!
        !! @forbidden The forbidden direction on of 'N', 'E', 'S', 'W!.
        real,           intent(in)  :: random
        type(position), intent(in)  :: current
        type(position)              :: updated
        character(len=1)            :: forbidden

        select case (forbidden)
          case ('N')
            print *, "North"
          case ('E')
            print *, "East"
          case ('S')
            print *, "South"
          case ('W')
            print *, "West"
          case default
            print *, "None"
        end select

    end function

    pure function simple_random_walk_2D(trials, steps, randoms) result(walks)
        !! Realize 2-dimensional simple random walk on ℤ for the given number of steps and trials.
        !!
        !! @param steps   The number of random walk steps.
        !! @param trials  The total number of random walk experiments.
        !! @param randoms The array with random numbers with size = (trials, steps)
        !! @return        The  `x`, `y` position coordinates and Euclidean distance from the origin.
        !!
        implicit none

        integer, intent(in) :: steps, trials            ! The input variable.
        real, dimension(:,:,:), allocatable :: walks    ! The output array for (x, y, d).

        real, intent(in)    :: randoms(trials, steps)   ! The random numbers.
        type(position)      :: current, updated         ! The current position (0, 0).
        integer             :: trial, step              ! The current trial and step.

        allocate(walks(1:trials, 1:steps, 1:3))         ! Allocate the output array.

        !                  DEFAULT (NONE) SHARED (...)
        ! $OMP PARALLEL DO PRIVATE(current)
        do trial = 1, trials ! vs `do concurrent (trial = 1:trials) private(current)`
            ! Reset the position before each run: is it save with `do concurrent`?
            current%x = 0.0
            current%y = 0.0

            do step = 1, steps
                current = update_position(random=randoms(trial, step), current=current)
                ! Save the position and distance.
                walks(trial, step, 1) = current%x
                walks(trial, step, 2) = current%y
                walks(trial, step, 3) = sqrt( ((current%x) ** 2) + ((current%y) ** 2) )
            end do
        end do
        ! $OMP END PARALLEL DO
    end function

end module
