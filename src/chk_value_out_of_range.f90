! chk_value_out_of_range.f90 --
!     Check if the compiler detects a problem with values that do not fit
!
!     flang, gfortran and ifx print an error when the large value comes from a parameter
!
program chk_value_out_of_range
    implicit none

    real, parameter :: y = 1.0e20
    integer         :: x

    x = y

    write( *, '(a)' )       'Original value contained in a parameter - program runs fine'
    write( *, '(a,e12.4)' ) 'Original value: ', y
    write( *, '(a,i12)'   ) 'Value of x:     ', x

    if ( x > 0 ) then
        write( *, '(a)' ) 'Overflow leads to a positive value'
        if ( x == huge(x) ) then
            write( *, '(a)' ) '   Note: equal to HUGE(0)'
        else
            write( *, '(a,i10)') '   Note: difference from HUGE(0): ', x - huge(x)
        endif
    elseif ( x < 0 ) then
        write( *, '(a)' ) 'Overflow leads to a negative value'
        if ( x == -huge(x) ) then
            write( *, '(a)' ) '   Note: equal to -HUGE(0)'
        else
            write( *, '(a,i10)' ) '   Note: difference from -HUGE(0): ', x + huge(x)
        endif
    else
        write( *, '(a)' ) 'Overflow leads to zero!'
    endif

end program chk_value_out_of_range
