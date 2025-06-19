! chk_location.f90 --
!     Check the Fortran 2008 extensions to the localisation functions
!
program chk_location
    implicit none

    real, dimension(5) :: array = (/ 1.0, 5.0, 3.0, 1.0, 5.0 /)

    write( *, '(a)' ) 'Location of maximum (using BACK=.true.): ', maxloc(array, back= .true.)
    write( *, '(a)' ) 'Location of minimum (using BACK=.true.): ', minloc(array, back= .true.)

    write( *, '(a)' ) 'Location of 3.0:                         ', findloc(array, 3.0)
end program chk_location
