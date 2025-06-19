! chk_string_varying_array_arg.f90 --
!     Check that an explicit string length may be specified for literal strings of different lengths
!
program chk_varying_string_array_arg
    implicit none

    call write_string_length( [character(len=4):: 'A', 'BB', 'CCC'] )

contains
subroutine write_string_length( array )
    character(len=*), dimension(:) :: array

    write(*,*) 'Length of the strings:', len(array(1))
    if ( len(array(1)) == 4 ) then
        write(*,*) 'Length is as expected'
    else
        write(*,*) 'Unexpected length - should have been 4!'
    endif

end subroutine write_string_length

end program chk_varying_string_array_arg
