! chk_c_enum.f90 --
!     Check if the compiler supports Fortran 2018's C-style enums
!
!     Example inspired by MRC&B's book
!
program chk_c_enum
    implicit none

    enum, bind(c)
        enumerator :: winter = 1, spring = 4, summer = 5, autumn = 2
    end enum

    integer :: my_season

    my_season = winter

    write(*,*) 'Number given to "winter":', my_season
end program chk_c_enum
