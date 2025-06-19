! chk_compiler_info.f90 --
!     Check if the compiler supports the compiler_options and compiler_version functions
!
program chk_compiler_info
    use, intrinsic :: iso_fortran_env

    implicit none

    write( *, '(a)'  ) 'Compiler information:'
    write( *, '(2a)' ) '    Version:      ', compiler_version()
    write( *, '(2a)' ) '    Options used: ', compiler_options()

end program chk_compiler_info
