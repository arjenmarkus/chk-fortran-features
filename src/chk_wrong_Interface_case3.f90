! chk_wrong_interface_case3.f90 --
!     Check if the compiler detects an interface mistake in the call to a subroutine
!     that has no explicit interface.
!     Case 3: the compiler should check on this because of the "external" clause!
!

subroutine print_text( string )
    character(len=*), intent(in) :: string

    write( *, '(a)' ) trim(string)
end subroutine print_text

program chk_wrong_interface_case3
    implicit none (type, external)

    write( *, '(a)' ) 'Subroutine is external and that is not allowed'
    write( *, '(a)' ) 'Apparently, the compiler accepts the incorrect call'

    call print_text( 'Some text to be printed' )

end program chk_wrong_interface_case3
