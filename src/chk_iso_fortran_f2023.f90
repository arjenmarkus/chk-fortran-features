! chk_iso_fortran_f2023.f90
!     Check: report the various storage units from the ISO_FORTRAN_ENV module that are new in Fortran 2023
!
program chk_iso_fortran_f2023
    use iso_fortran_env

    implicit none

    write( *, '(a,i5,a)'  ) 'New kinds - logicals:'
    write( *, '(a,i5,a)'  ) '    LOGICAL8  ', logical8,   merge( '                ', ' - not supported', logical8   >   0 )
    write( *, '(a,i5,a)'  ) '    LOGICAL16 ', logical16,  merge( '                ', ' - not supported', logical16  >   0 )
    write( *, '(a,i5,a)'  ) '    LOGICAL32 ', logical32,  merge( '                ', ' - not supported', logical32  >   0 )
    write( *, '(a,i5,a)'  ) '    LOGICAL64 ', logical64,  merge( '                ', ' - not supported', logical64  >   0 )
    write( *, '(/,a)'     ) 'New kinds - reals:'
    write( *, '(a,i5,a)'  ) '    REAL16 ', real16,  merge( '                ', ' - not supported', real16  >   0 )

end program chk_iso_fortran_f2023
