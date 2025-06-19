! chk_assumed_rank.f90 --
!     Check if the compiler supports the assumed rank construct
!
program chk_assumed_rank
    implicit none

    integer                :: scalar
    integer, dimension(10) :: array1d

    call print_rank( scalar  )
    call print_rank( array1d )

contains
subroutine print_rank( a )
    integer, dimension(..) :: a

    select rank (a)
        rank(0)
            write( *, '(a)' ) 'The argument is a scalar'

        rank(1)
            write( *, '(a)' ) 'Rank of argument is 1'

        rank default
            write( *, '(a)' ) 'Rank of argument is something other than 0 or 1'

    end select

end subroutine print_rank
end program chk_assumed_rank
