! chk_unlimited_format --
!     Check: does the compiler support unlimited formats?
!
program chk_unlimited_format
    implicit none

    integer, dimension(10) :: array
    integer                        :: i

    write( *, '(a)' )      'Use an unlimited format:'

    array = (/ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 /)

    do i = 1,size(array)
        write( *, '(i5,a,*(i5))' ) i, ':', array(1:i)
    enddo
end program chk_unlimited_format
