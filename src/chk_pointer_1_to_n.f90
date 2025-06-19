! chk_pointer_1_to_n.f90 --
!     Check if the compiler allows n-dimensional pointers to point to one-dimensional arrays
!
!     Note:
!     Extend this to parray(1:20,:) => array? Or to parray(1:20,1:20) => array - violating array bounds
!
program chk_pointer_1_to_n
    implicit none

    real, dimension(100), target  :: array
    real, dimension(:,:), pointer :: parray

    parray(1:10,1:10) => array
    array      = 0.0
    array(100) = 1.0
    write( *, '(a,2i5)'   ) 'Pointer shape:    ', shape(parray)
    write( *, '(a,2f5.2)' ) '    last element: ', parray(10,10), array(100)

    !
    ! This is NOT allowed - so no testing
    !
    !     parray(1:10,:) => array

end program chk_pointer_1_to_n
