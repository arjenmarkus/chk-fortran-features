! chk_pointer_simply_contiguous.f90 --
!     Check if the compiler allows the Fortran 2008 simply contiguous extension
!
program chk_pointer_simply_contiguous
    implicit none

    integer                              :: i1, i2, i3, i4
    integer, dimension(2,3,5,10), target :: array
    integer, dimension(:,:), pointer     :: parray

    ! Maps the first two dimensions of array into the first dimension of parray
    parray(1:6,1:4) => array(:,:,2:5,4)

    array         = 0.0
    do i4 = 1,10
        do i3 = 1,5
            do i2 = 1,3
                do i1 = 1,2
                    array(i1,i2,i3,i4) = i1 + 10*i2 + 100*i3 + 1000*i4
                enddo
            enddo
         enddo
    enddo

    write( *, '(a,2i5)'   ) 'Pointer shape:    ', shape(parray)
    write( *, '(a)'       ) '    Elements:'
    write( *, '(4x,6i5)'  ) parray
    write( *, '(a)'       ) '    Should match:'
    write( *, '(4x,6i5)'  ) ((((array(i1,i2,i3,i4) ,i1=1,2) ,i2=1,3) ,i3=2,5), i4=4,4)
end program chk_pointer_simply_contiguous
