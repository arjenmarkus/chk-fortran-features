! chk_extra_long_line.f90 --
!     Check if the compiler supports lines in the source that are longer than 132 characters.
!     (This is an extension supported at least by Intel Fortran)
!
program chk_extra_long_line
    implicit none

    write( *, '(a)' ) 'This line in the source of the program exceeds the maximum length prescribed by the Fortran standard for free-form source'
end program chk_extra_long_line
