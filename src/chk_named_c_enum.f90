! chk_named_c_enum.f90 --
!     Check if the compiler supports Fortran 2023's C-style enums that can be given a name
!
!     Example inspired by MRC&B's book
!
program chk_named_c_enum
    implicit none

    enum, bind(c) :: season
        enumerator :: winter = 1, spring = 4, summer = 5, autumn = 2
    end enum season

    type(season) :: my_season

    my_season = winter

    write(*,*) 'Number given to "winter":', my_season
end program chk_named_c_enum
