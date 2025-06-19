! chk_conditional.f90 --
!     Check if the compiler supports the conditional expression form
!
program chk_conditional
    implicit none

    integer :: k

    k = 0
    write(*,*) '0 or -1?', (k > 0? k : -1)

end program chk_conditional
