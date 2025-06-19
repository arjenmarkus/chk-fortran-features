! chk_non_recursive.f90 --
!     Check if the compiler supports the non_recursive keyword (F2018 feature)
!
program chk_non_recursive
    implicit none

    call print_text( 'The non_recursive keyword is supported' )

contains
non_recursive subroutine print_text( msg )
    character(len=*), intent(in) :: msg

    write(*,*) msg
end subroutine print_text
end program chk_non_recursive
