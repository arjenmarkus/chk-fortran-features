! chk_unused_variable.f90
!     Check: does the compiler report unused variables?
!
!     NOte: most probably just a warning
!
program chk_unused_variable
    implicit none

    integer :: not_used, used

    used = 1
    not_used = used

    write( *, '(a)' ) 'If the compiler issues a warning about "not_used", it report unused variables'
end program chk_unused_variable
