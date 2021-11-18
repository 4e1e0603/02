! -*- coding: utf-8 -*-

!! PROGRAM: Random walk simulation
!! VERSION: 0.1.0
!!
!! See README.md for more information.
!!
program random_walk_simulation

    use random_walk, only: simple_random_walk_2D, position, update_position

    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64

    implicit none

    type(position) :: current, updated

    integer :: step, trial
    integer :: steps, trials

    character(100) :: steps_arg
    character(100) :: trials_arg

    real, dimension(:,:,:), allocatable :: walks
    real, dimension(:,:), allocatable   :: randoms

    ! Make sure the right number of inputs have been provided.
    if(command_argument_count() .ne. 2) then
        write(*,*)'error, two command-line arguments required, stopping.'
        stop
    end if

    ! Read the command line arguments.
    call get_command_argument(1, trials_arg)
    call get_command_argument(2, steps_arg)

    ! Convert the arguments to integers.
    read(steps_arg, *) steps
    read(trials_arg, *) trials

    allocate(walks(1:trials, 1:steps, 1:3))
    allocate(randoms(1:trials, 1:steps))

    call random_number(randoms)

    walks = simple_random_walk_2D(trials=trials, steps=steps, randoms=randoms)

    ! TODO Make a subroutine with text and binary output flag.
    ! TODO `open(newunit=id, file='file_name')`
    ! Write the result to the standard output.
    do trial = 1, trials
        do step = 1, steps
            write(*,'(f0.1,a,f0.1,a,f0.4)')  &
                 walks(trial, step, 1), '|', &
                 walks(trial, step, 2), '|', &
                 walks(trial, step, 3)
        end do
        if (trial <= trials) then
            write(*, *)'---'
        end if
    end do

end program