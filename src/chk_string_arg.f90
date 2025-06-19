! chk_string_arg.f90 --
!     Does the compiler check for the match between actual and dummy arguments
!     concerning the string length?
!
module string_arg
    implicit none

contains
subroutine print_arg( string )
    character(len=20) :: string

    write(*,*) 'String: >', string, '<'
end subroutine print_arg
end module string_arg

program chk_string_arg
    use string_arg
    implicit none

    character(len=10) :: string10
    character(len=30) :: string30

    string10 = '....5...10'
    string30 = '....5...10....5...20....5...30'

    call print_arg( string10 )
    call print_arg( string30 )
end program chk_string_arg
