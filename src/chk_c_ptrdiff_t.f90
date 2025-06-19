! chk_c_cptrdiff_t.f90 --
!     Check if the compiler defines the C_PTRDIFF_T kind
!
program chk_c_ptrdiff_t
    use iso_c_binding

    implicit none

    integer(kind=c_ptrdiff_t) :: prtdiff

    write( *, '(a,i0)' ) 'Kind C_PTRDIFF_T defined: ', c_ptrdiff_t
end program chk_c_ptrdiff_t
