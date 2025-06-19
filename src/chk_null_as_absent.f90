! chk_null_as_absent.f90 --
!     Check if the compiler supports NULL() pointers as indicating a missing argument
!
program chk_null_as_absent
    implicit none

    integer :: x

    write( *, '(a)' ) 'Is the argument absent? (First yes, second no)'

    call check_arg( x )
    call check_arg( null() )

contains
subroutine check_arg( value )
    integer, optional :: value

    if ( present(value) ) then
        write( *, '(a)' ) '    The argument is present'
    else
        write( *, '(a)' ) '    No argument passed'
    endif
end subroutine check_arg

end program chk_null_as_absent
