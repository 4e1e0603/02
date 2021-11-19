! -*- coding: utf-8 -*-

!! Randowm walk (discrete time and space) simulation module.

module random_walk

    implicit none

    private

    !! The state on 2-dimensional lattice.
    type, public :: state
        real :: t = 0.0; ! time
        real :: x = 0.0; ! space
        real :: y = 0.0; ! space
    end type

    public :: update, simulate

    contains

    pure function update(random, current) result(updated)
        !! Update the current state.
        !!
        !!    N     [0.0 ; 0.25) => go left  (x - 1, y) = West
        !!  W o E   [0.25 ; 0.5) => go right (x + 1, y) = East
        !!    S     [0.5 ; 0.75) => go down  (x, y - 1) = North
        !!          [0.75 ; 1.0) => go up    (x, y + 1) = South
        !!
        !! @param random  The random number.
        !! @param current The current state.
        !! @return output The updated state.
        !!
        ! work-in-progress update-without-return
        ! character(len=1)         :: forbidden
        ! @forbidden The forbidden direction on of 'N', 'E', 'S', 'W!.
        ! select case (forbidden)
        ! case ('N')
        !     ! print *, "North"
        ! case ('E')
        !     ! print *, "East"
        ! case ('S')
        !     ! print *, "South"
        ! case ('W')
        !     ! print *, "West"
        ! case default
        !     ! print *, "None"
        ! end select
        implicit none

        real,        intent(in) :: random
        type(state), intent(in) :: current
        type(state)             :: updated

        if (random < 0.0 .or. random > 1.0) then
            ! RAISE ERROR OR RETURN 0?
        end if

        updated % x = current % x
        updated % y = current % y

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

    pure function metrics() result(outputs)
        real :: outputs(1)
        outputs = 0.0
    end function

    pure function simulate(trials, steps, randoms) result(outputs)
        ! @todo dimension = array, step_sizes = array
        !! Realize 2-dimensional simple random walk on ℤ for the given number of steps and trials.
        !!
        !! @param steps   The number of random walk steps.
        !! @param trials  The total number of random walk experiments.
        !! @param randoms The array with random numbers with size = (trials, steps)
        !! @return        The coordinates and distance from origin.
        !!
        implicit none

        integer, intent(in) :: steps, trials
        real, intent(in) :: randoms(trials, steps)
        real, dimension(:,:,:), allocatable :: outputs
        type(state) :: current
        integer :: trial, step

        allocate(outputs(1:trials, 1:steps, 1:3))

        ! $OMP PARALLEL DO PRIVATE(current)
        do trial = 1, trials

            current % x = 0.0
            current % y = 0.0

            do step = 1, steps
                current = update(random=randoms(trial, step), current=current)
                outputs(trial, step, :) = (/ current % x, current % y, sqrt((current % x) ** 2 + (current % y) ** 2) /)
            end do

        end do
        ! $OMP END PARALLEL DO
    end function

end module
