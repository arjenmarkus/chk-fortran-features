! chk_interface_mismatch.f90
!     Check: does the compiler check interfaces for routines outside a module?
!
!     Note: most probably just a warning, but the program is likely to crash
!
!     Note: the purpose of this check is to see if the compiler looks at
!           interfaces in the same source file, but outside any module. It is
!           a matter of quality, not of standard compliance
!
subroutine arbitrary_args( arg1, arg2 )
    integer :: arg1, arg2

    arg1 = 1
    arg2 = 1
end subroutine arbitrary_args

program chk_interface_mismatch
    implicit none

    integer :: just_one

    open( 10, file = '_runtime_check_' ); write( 10, *) 'Started'

    write( *, '(a)' ) 'The compiler may issue a warning on interface mismatches'
    write( *, '(a)' ) 'Check the output'

    call arbitrary_args( just_one )

    close( 10, status = 'delete' )

end program chk_interface_mismatch
