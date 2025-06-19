! chk_compiler_version.f90
!     Check: does the compiler support the COMPILER_VERSION and COMPILER_OPTIONS intrinsic functions?
!
program chk_compiler_version
    use, intrinsic :: iso_fortran_env

    implicit none

    write( *, '(2a)' ) 'Compiler version: ', compiler_version()
    write( *, '(2a)' ) 'Compiler options: ', compiler_options()

end program chk_compiler_version
