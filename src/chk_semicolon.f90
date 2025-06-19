! chk_semicolon.f90 --
!     Check if list-directed input uses both a comma and a semicolon as a separator
!     - some compilers use this as an extension
!
program chk_semicolon
    implicit none

    integer           :: x, y, ierr
    character(len=20) :: text

    x = -1
    y = -1

    text = '1;2,3'

    write( *, '(3a)' ) 'Reading the string "', trim(text), '" (note the semicolon):'
    read( text, *, iostat = ierr ) x, y

    if ( ierr /= 0 ) then
        write( *, '(a)' ) 'With list-directed input semicolons (;) are not accepted'
    else
        write( *, '(a)' ) 'List-directed input accepts semicolons (;) in the same way as commas'
        write( *, '(a)' ) 'Note: this is an extension'
    endif
end program chk_semicolon
