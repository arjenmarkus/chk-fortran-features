! chk_recursive_default.f90 --
!     Check if the compiler support the Fortran 2018 feature that routines are recursive by default
!
!     Note:
!     Intel Fortran oneAPI accepts the code if you specify the option -standard-semantics.
!     gfortran 10.2.0 does not accept it.
!
program chk_recursive_default
    implicit none

    integer :: cnt

    cnt = 0
    call increase( cnt )

    write(*,*) 'Result of recursive increment: cnt = ', cnt

contains
subroutine increase( c )
    integer, intent(inout) :: c

    c = c + 1

    if ( c < 10 ) then
        call increase( c )
    endif
end subroutine increase
end program chk_recursive_default
