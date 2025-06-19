! chk_impure_elemental.f90 --
!     Check if the compiler supports IMPURE elemental subprograms (Fortran 2008)
!
!     Note:
!     Example taken from John Reid's "The New Features of Fortran 2008"
!
program chk_impure_elemental
    implicit none

    real, dimension(10) :: array
    real                :: partial_sum

    call random_number( array )

    partial_sum  = 0.0
    write( *, '(a,10f10.5)' ) 'Accumulative sum of 10 random numbers: ', accumulate(array, partial_sum)
contains
impure elemental function accumulate( a, partial )
    real, intent(in)    :: a
    real, intent(inout) :: partial
    real                :: accumulate

    partial    = partial + a
    accumulate = partial
end function accumulate
end program chk_impure_elemental
