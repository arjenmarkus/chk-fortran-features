! chk_pointer_rank --
!     Check: can we associate a 2D pointer with a 1D array? (F2003 feature)
!
program chk_pointer_rank
    implicit none

    integer, dimension(20), target             :: array
    integer, dimension(:,:), pointer           :: matrix
    integer                                    :: i

    write( *, '(a)' ) 'Associate a 2D pointer with a 1D array:'

    matrix(1:4,1:5) => array

    do i = 1,size(array)
        array(i) = i
    enddo

    write( *, '(4i5)' ) matrix

end program chk_pointer_rank
