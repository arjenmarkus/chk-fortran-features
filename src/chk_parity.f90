! chk_parity.f90 --
!     Check if the compiler supports the Fortran 2008 function parity
!
program chk_parity
    implicit none

    write( *, '(a,l)' ) 'The parity of [True,False,True] is ', parity((/.true.,.false.,.true./))
end program chk_parity
