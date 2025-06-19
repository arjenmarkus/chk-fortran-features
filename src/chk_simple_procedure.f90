! chk_simple_procedure.f90 --
!     Check: does the compiler support the Fortran 2023 concept of simple procedures?
!
program chk_simple_procedure
    implicit none

    real :: x, y

    x = 2.0

    call just_calculate( x, y )

    write( *, '(a,g10.4)' ) 'Result of the simple function: ', y

contains

simple subroutine just_calculate( a, b )
    real, intent(in)  :: x
    real, intent(out) :: y

    y = x ** 2

end subroutine just_calculate

end program chk_simple_procedure
