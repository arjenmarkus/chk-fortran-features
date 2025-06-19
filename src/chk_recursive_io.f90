! chk_recursive_io.f90 --
!     Check if the compiler allows recursive I/O
!
!     Note:
!     This program checks the Fortran 2008 feature of recursive I/O, not the variations
!     the Fortran 2003 allows (internal reads/writes)
!
program chk_recursive_io
    implicit none

    integer :: lun, ierr
    real    :: x, y

    lun = 10
    x   = 1.0
    y   = 1.0

    open( lun,   file = 'chk_recursive_io.out' )
    open( lun+1, file = 'chk_recursive_io.dummy' )

    write( lun, '(2f10.3)', iostat = ierr ) x, f(y)

    if ( ierr /= 0 ) then
        write( *, '(a)' ) 'Recursive I/O (Fortran 2008 feature) to different file units is allowed'
    else
        write( *, '(a)' ) 'Recursive I/O (Fortran 2008 feature) seems not to be allowed'
    endif
contains
real function f(y)
    real, intent(in) :: y

    write(lun+1, '(a,f10.3)' ) 'Argument: ', y

    f = 2.0 * y
end function f
end program chk_recursive_io
