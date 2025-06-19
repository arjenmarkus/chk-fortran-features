! chk_enumeration_type.f90 --
!     Check if the compiler supports Fortran 2023's Fortran-style enumerations
!
!     Example inspired by MRC&B's book
!
program chk_enumeration_type
    implicit none

    integer :: i

    enumeration type :: season
        enumerator :: winter = 1, spring = 4, summer = 5, autumn = 2
    end enumeration type season

    type(season) :: my_season

    my_season = winter

    write(*,*) 'First number:', my_season
    do i = 1,4
        my_season = next( my_season )
        write(*,*) 'Next number:', my_season
    enddo

end program chk_enumeration_type
