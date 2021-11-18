! -*- coding: utf-8 -*-

!! Randowm walk 1D simulation module.
!! Randowm walk 1D simulation module.

module random_walk_1d
    implicit none

    private

    ! type, public :: state
    !     real :: t = 0.0;
    !     real :: x = 0.0;
    ! end type

    ! public :: simulate
    ! pure function simulate() result(walks)
    !   real, dimension(:,:,:), allocatable :: walks
    !   allocate(walks(1:trials, 1:steps, 1:3))     ! Allocate the output array.
    ! end function

end module


module random_walk_2d
    implicit none

    private

    !! The state on 2-dimensional lattice.
    type, public :: state ! state
        real :: t = 0.0
        real :: x = 0.0;
        real :: y = 0.0;
    end type

    public :: simulate, update

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

    pure function simulate(trials, steps, randoms) result(walks)
        !! Realize 2-dimensional simple random walk on ℤ for the given number of steps and trials.
        !!
        !! @param steps   The number of random walk steps.
        !! @param trials  The total number of random walk experiments.
        !! @param randoms The array with random numbers with size = (trials, steps)
        !! @return        The coordinates and distance from origin.
        !!
        implicit none

        integer, intent(in) :: steps, trials
        real, dimension(:,:,:), allocatable :: walks

        type(state)      :: current                 ! The current state (0, 0).
        real, intent(in) :: randoms(trials, steps)  ! The random numbers.
        integer          :: trial, step             ! The current trial and step.

        allocate(walks(1:trials, 1:steps, 1:3))     ! Allocate the output array.

        ! $OMP PARALLEL DO PRIVATE(current)
        ! or `do concurrent (trial = 1:trials) private(current)`
        do trial = 1, trials
            ! Reset the state before each run!
            current%x = 0.0
            current%y = 0.0

            do step = 1, steps
                current = update(random=randoms(trial, step), current=current)
                ! Save the state and distance.
                walks(trial, step, 1) = current%x
                walks(trial, step, 2) = current%y
                walks(trial, step, 3) = sqrt( ((current%x) ** 2) + ((current%y) ** 2) )
            end do
        end do
        ! $OMP END PARALLEL DO
    end function

end module
