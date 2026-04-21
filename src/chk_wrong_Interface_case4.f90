! chk_wrong_interface_case4.f90 --
!     Check if the compiler detects an interface mistake in the call to a subroutine
!     that has no explicit interface.
!     Case 4: the compiler should check on this!
!

subroutine print_text( string )
    character(len=*), intent(out) :: string

    string = 'XYZ'
    write( *, '(a)' ) trim(string)
end subroutine print_text

program chk_wrong_interface_case4
    implicit none

    write( *, '(a)' ) 'The subroutine would change the constant string'
    write( *, '(a)' ) 'Apparently, the compiler accepts the incorrect call'

    call print_text( 'Some text to be printed' )

end program chk_wrong_interface_case4
