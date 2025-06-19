! chk_cray_pointer.f90 --
!     Check if the compiler supports Cray pointers (a well-known widespread extension.
!     (NOte: only the syntax is checked, not actual use)
!
program chk_cray_pointer
    implicit none

    integer :: y

    pointer (x, y)

    write( *, '(a)' ) 'The compiler supports at least the syntax of Cray pointers'
end program chk_cray_pointer
