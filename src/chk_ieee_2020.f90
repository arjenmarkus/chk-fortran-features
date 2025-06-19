! chk_ieee_2020 --
!     Check: does the compiler support the new IEEE standard? (Additional functions)
!
program chk_ieee_2020
    use ieee_arithmetic

    implicit none

    real                   :: x, y

    x = 1.0
    y = 2.0

    write( *, '(a)'        ) 'IEEE max/min functions:'
    write( *, '(a,e14.6)'  ) '    Minimum:          ', ieee_min(x, y)
    write( *, '(a,e14.6)'  ) '    Maximum:          ', ieee_max(x, y)
    y = -2.0
    write( *, '(a,e14.6)'  ) '    Minimum mag:      ', ieee_min_mag(x, y)
    write( *, '(a,e14.6)'  ) '    Maximum mag:      ', ieee_max_mag(x, y)

end program chk_ieee_2020
