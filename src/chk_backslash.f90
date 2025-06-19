! chk_backslash.f90 --
!     Check if the compiler treats backslashes in literal strings as escape characters
!
!     Background:
!     In the past some compilers treated backslashes in the same way as C compilers would,
!     to introduce special characters. Somewhat annoying.
!
program chk_backslash
    implicit none

    write( *, '(a)' ) 'If a backslash is not treated as an escape character, ', &
                      'this program simply prints a backslash:'
    write( *, '(a)' ) '\'

end program chk_backslash
