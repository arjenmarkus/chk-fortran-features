! chk_wrong_interface_case1.f90 --
!     Check if the compiler detects an interface mistake in the call to a subroutine
!     that has no explicit interface.
!     Case 1: subroutine defined in the source code before the using program
!
subroutine print_text( string )
    character(len=*), intent(in) :: string

    write(*, '(a)' ) trim(string)
end subroutine print_text

program chk_wrong_interface_case1
    implicit none

    write( *, '(a)' ) 'Subroutine defined in source code before using program'
    write( *, '(a)' ) 'Apparently, the compiler accepts the incorrect call'

    call print_text( 'Some text to be printed', 2 )

end program chk_wrong_interface_case1
