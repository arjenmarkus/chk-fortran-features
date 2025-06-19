! chk_reduce.f90 --
!     Check if the compiler supports the reduce intrinsic function
!
program chk_reduce
    implicit none

    real, dimension(100) :: array
    real                 :: x

    call random_number( array )

    x = reduce( array, select_max )

contains
real function select_max( a, b )
    real, intent(in) :: a, b

    select_max = max( a, b )

end function select_max

end program chk_reduce
