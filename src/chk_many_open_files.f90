! chk_many_open_files.f90 --
!     Check how many files a program can open (well, up to 1000 are tried)
!
program chk_many_open_files
    implicit none

    integer :: i, ierr

    write( *, '(a)' ) 'Opening a large number of scratch files ...'

    do i = 10,1010
        open( i, status = 'scratch', iostat = ierr )
        if ( ierr /= 0 ) then
            exit
        endif
        write( i, * ) i
    enddo

    if ( ierr /= 0 ) then
        write( *, '(a,i5)' ) 'Number of files that could be opened: ', i-1
    else
        write( *, '(a,i5)' ) 'At least 1000 files could be opened'
    endif
end program chk_many_open_files
