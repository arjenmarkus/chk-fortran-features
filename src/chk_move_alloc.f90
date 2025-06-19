! chk_move_alloc.f90
!     Check: does the compiler support the MOVE_ALLOC subroutine?
!
program chk_move_alloc
    implicit none

    real, dimension(:), allocatable :: a, b

    allocate( a(10) )

    call move_alloc( a, b )

    write( *, '(a)'   ) 'Move allocation:'
    write( *, '(a,a)' ) 'Array "a" should now not be allocated: ', merge( 'YES', 'NO ', allocated(a) )
    write( *, '(a,a)' ) 'Array "b" should now be allocated:     ', merge( 'YES', 'NO ', allocated(b) )
    write( *, '(a,i0)' ) 'Shape of array "b": ', shape(b)

end program chk_move_alloc
