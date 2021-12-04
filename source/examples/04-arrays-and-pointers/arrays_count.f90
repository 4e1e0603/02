

program array_count
    implicit none

    integer                         :: i
    character(len=1), dimension(10) :: tab_char
    character(len=1), dimension(10) :: tab_char_no_alloc
    logical,          dimension(10) :: m
    integer :: noa

    do i = 1,10
        print *, 'Enter one character:'
        read  *, tab_char(i)
    end do

    print *, 'You have entered: ', tab_char

    m(:) = tab_char(:) /= 'a'

    print *, m

end program