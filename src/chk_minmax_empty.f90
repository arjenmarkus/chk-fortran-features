! chk_minmax_empty.f90 --
!     Check: what does the program return as the location of the minimum/maximum if the mask contains all false?
!
!     Note:
!     In the Intel Fortran oneAPI compiler (and its predecessor) the result could be 1 or 0, depending on the
!     option /assume:old_maxminloc (gives 1, default!) or /assume:noold_maxminloc (gives 0).
!
!     The gfortran compiler gives zero
!
!     AM: I think the /assume:noold_maxminloc option gives the right result for ifx and ifort
!
program chk_minmax_empty
    implicit none

    real    :: x(10)
    logical :: mask(10)

    call random_number( x )

    mask = x > 2.0

    write( *, '(a)' )    'The mask to minloc/maxloc is empty, but the function still returns a value:'
    write( *, '(a)' )    '    (Expected value: 0)'
    write( *, '(a,i5)' ) '    Location of minimum: ', minloc( x, mask )
    write( *, '(a,i5)' ) '    Location of maximum: ', maxloc( x, mask )

    ! For good measure ...

    write( *, '(a)' )    'In case of an empty array, the results are: '
    write( *, '(a)' )    '    (Expected value: 0)'
    write( *, '(a,i5)' ) '    Location of minimum: ', minloc( x(1:0) )
    write( *, '(a,i5)' ) '    Location of maximum: ', maxloc( x(1:0) )

end program chk_minmax_empty
