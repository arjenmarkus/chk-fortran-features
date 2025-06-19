! chk_split.f90 --
!     Check if the compiler supports the split intrinsic subroutine
!
!     Code adapted from Modern Fortran explained
!
program chk_split
    implicit none

    character(len=100) :: string = 'Check   if the compiler supports the split intrinsic subroutine'
    character(len=1)   :: set    = ' '
    integer            :: bgn, end

    bgn = 0

    do
        call split( string, set, end )

        write(*,*) '>', string(bgn+1:end), '<'

        if ( end > len(string) ) then
            exit
        endif

        bgn = end
    enddo

end program chk_split
