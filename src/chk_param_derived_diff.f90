! chk_param_derived_diff.f90 --
!     Check whether two variables of a parameterised derived type with different
!     length parameters can be distinguished.
!
program chk_param_derived_diff
    implicit none

    type matrix(real_kind,m,n)
        integer, kind :: real_kind
        integer, len  :: m, n
        real(kind=real_kind) :: values(m,n)
    end type matrix

    type(matrix(kind(1.0),10,20)) :: m
    type(matrix(kind(1.0),5,5))   :: n

    call compatible( m, n )

contains
subroutine compatible( mat1, mat2 )
    type(matrix(real_kind=kind(1.0),m=*,n=*))           :: mat1
    type(matrix(real_kind=kind(1.0),m=mat1%m,n=mat1%n)) :: mat2

    write(*,*) 'Matrices are seen as having compatible shapes'
    write(*,*) '    Matrix mat1: ', mat1%m, mat1%n
    write(*,*) '    Matrix mat2: ', mat2%m, mat2%n
    write(*,*) 'The interface check (at compile time) does not include the type parameters!'

end subroutine compatible

end program chk_param_derived_diff
