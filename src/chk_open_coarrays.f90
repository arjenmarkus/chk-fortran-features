! chk_open_coarrays.f90 --
!     Check: does the compiler support opening different files on the same
!     unit in different images (requires coarrays)
!
program chk_open_coarrays
    implicit none

    integer :: lun = 10
    logical :: opened


    !
    ! For image 1, open the file
    !
    if ( this_image() == 1 ) then
        open( lun, file = 'chk_open_coarrays.out' )
    endif

    sync all

    if ( this_image() /= 1 ) then
        inquire( unit = lun, opened = opened )
        if ( opened ) then
            write( *, '(a)' ) 'A file opened in one image seems to be open in others as well'
        else
            write( *, '(a)' ) 'Files in different images are opened independently'
        endif
    endif

    sync all

    if ( this_image() == 1 ) then
        close( lun, status  = 'delete' )
    endif
end program chk_open_coarrays
