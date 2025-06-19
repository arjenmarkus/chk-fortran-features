! chk_signed_zero.f90 --
!     Check if programs can rely on signed zeros
!
!     This program is inspired by a paper by W. Kahan about branch cuts for complex functions.
!     Using signed zeros (as defined in the IEEE arithmetic) a programmer can trust branch cuts
!     to do the right thing
!
program chk_signed_zero
    implicit none

    complex :: x, y
    complex :: lnx, lny

    !
    ! Construct complex numbers with a signed zero imaginary part
    !
    x = cmplx(-1.0,sign(0.0,1.0))
    y = cmplx(-1.0,sign(0.0,-1.0))

    !
    ! Check that the logarithms of these numbers lie on a different branch
    !
    lnx = log(x)
    lny = log(y)

    write( *, '(a)' ) 'Using signed zeros complex functions can be evaluated correctly at slits:'
    write( *, '(a,2f10.5,a,2f10.5,a)' ) 'Original: (', x, ') -- logarithm: (', log(x), ')'
    write( *, '(a,2f10.5,a,2f10.5,a)' ) 'Original: (', y, ') -- logarithm: (', log(y), ')'

    if ( imag(lnx) > 0.0 .and. imag(lny) < 0.0 ) then
        write( *, '(a)' ) 'The two logarithms lie on different branches - as required'
    else
        write( *, '(a)' ) 'The two logarithms do not lie on the correct branches'
    endif
end program chk_signed_zero
