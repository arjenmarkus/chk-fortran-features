! chk_minmax_nan.f90 --
!     Chekc: What happens if you have an array with a NaN?
!
program chk_minmax_nan
    use ieee_arithmetic

    implicit none

    real :: x(10)

    call random_number( x )

    x(3) = ieee_value( x(3), ieee_quiet_nan )

    write( *, '(a)' )    'MINLOC/MAXLOC in case of NaNs (should not be 3)'
    write( *, '(a,i5)' ) '    Location of minimum: ', minloc(x)
    write( *, '(a,i5)' ) '    Location of maximum: ', maxloc(x)
    write( *, '(a)' )    'MINVAL/MAXVAL in case of NaNs'
    write( *, '(a,f10.5)' ) '    Value of minimum: ', minval(x)
    write( *, '(a,f10.5)' ) '    Value of maximum: ', maxval(x)
end program chk_minmax_nan
