! chk_inverse_hyperbolic.f90 --
!     Check: does the compiler support the inverse hyperbolic functions for real arguments?
!
program chk_inverse_hyperbolic
    implicit none

    real, dimension(5) :: xsin = (/ -2.0,-0.9, 0.0, 0.9, 2.0 /)
    real, dimension(5) :: xcos = (/  1.0, 1.1, 1.9, 2.0, 3.0 /)
    real, dimension(5) :: xtan = (/ -0.9,-0.1, 0.0, 0.1, 0.9 /)

    write( *, '(a)'       ) 'Inverse hyperbolic functions:  '
    write( *, '(a,5f7.4)' ) 'asinh:     ', asinh(xsin)
    write( *, '(a,5f7.4)' ) 'acosh:     ', acosh(xcos)
    write( *, '(a,5f7.4)' ) 'atanh:     ', atanh(xtan)
end program chk_inverse_hyperbolic
