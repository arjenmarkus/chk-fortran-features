! chk_wrong_interface_case2.f90 --
!     Check if the compiler detects an interface mistake in the call to a subroutine
!     that has no explicit interface.
!     Case 2: subroutine defined in the source code after the using program
!

program chk_wrong_interface_case2
    implicit none

    write( *, '(a)' ) 'Subroutine defined in source code after using program'
    write( *, '(a)' ) 'Apparently, the compiler accepts the incorrect call'

    call print_text( 'Some text to be printed', 2 )

end program chk_wrong_interface_case2

subroutine print_text( string )
    character(len=*), intent(in) :: string

    write( *, '(a)' ) trim(string)
end subroutine print_text
