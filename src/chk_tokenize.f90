! chk_tokenize.f90 --
!     Check if the compiler supports the tokenize intrinsic subroutine
!
!     Code adapted from Modern Fortran explained
!
program chk_tokenize
    implicit none

    character(len=:), allocatable :: string
    character(len=1)              :: set    = ' '
    character(len=:), allocatable :: token(:)
    integer, allocatable          :: first(:), last(:)
    integer                       :: i

    !
    ! To avoid trailing blanks :)
    !
    string = 'Check   if the compiler supports the tokenize intrinsic subroutine'

    !
    ! First form
    !
    write(*,*) 'Fixed-length tokens:'
    call tokenize( string, set, token )

    do i = 1,size(token)
        write(*,*) '>', token(i), '<'
    enddo

    !
    ! Second form
    !
    write(*,*) ' '
    write(*,*) 'Variable-length substrings:'
    call tokenize( string, set, first, last )

    do i = 1,size(first)
        write(*,*) '>', string(first(i):last(i)), '<'
    enddo

end program chk_tokenize
