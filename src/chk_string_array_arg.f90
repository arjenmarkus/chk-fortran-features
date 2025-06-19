! chk_string_array_arg.f90 --
!     Check what string length is used when an array of different literal strings is passed
!
program chk_string_array_arg
    implicit none

    call write_string_length( ['A', 'BB', 'CCC'] )

contains
subroutine write_string_length( array )
    character(len=*), dimension(:) :: array

    write(*,*) 'Length of the strings:', len(array(1))

end subroutine write_string_length

end program chk_string_array_arg
