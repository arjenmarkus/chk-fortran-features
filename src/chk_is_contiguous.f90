! chk_is_contiguous.f90 --
!     Check: does the compiler support the IS_CONTIGUOUS intrinsic function?
!
program chk_is_contiguous
    implicit none

    real, dimension(100),   target :: array
    real, dimension(10,10), target :: matrix
    real, dimension(:), pointer    :: parray
    real, dimension(:,:), pointer  :: pmatrix

    write( *, '(a,/)' ) 'Contiguous and non-contiguous arrays and sections:'

    write( *, '(a,a)' ) 'Plain array:                         ', report(is_contiguous(array))
    write( *, '(a,a)' ) 'Array section (stride 1):            ', report(is_contiguous(array(1:10)))
    write( *, '(a,a)' ) 'Array section (stride 2):            ', report(is_contiguous(array(1::2)))

    parray => array
    write( *, '(a,a)' ) 'Pointer to array:                    ', report(is_contiguous(parray))
    parray => array(1:10)
    write( *, '(a,a)' ) 'Pointer to array section (stride 1): ', report(is_contiguous(parray))
    parray => array(1::2)
    write( *, '(a,a)' ) 'Pointer to section (stride 2):       ', report(is_contiguous(parray))

    pmatrix => matrix(1:1,:)
    write( *, '(a,a)' ) 'Pointer to matrix section (1,:):     ', report(is_contiguous(pmatrix))

    pmatrix => matrix(:,1:1)
    write( *, '(a,a)' ) 'Pointer to matrix section (:,1):     ', report(is_contiguous(pmatrix))
contains

function report(condition )
    logical           :: condition

    character(len=14) :: report

    report = merge( 'contiguous    ', 'non-contiguous', is_contiguous(parray) )
end function report

end program chk_is_contiguous
