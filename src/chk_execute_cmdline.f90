! chk_execute_cmd_line.f90
!     Check: does the compiler support the execute_command_line routine?
!
!     Note:
!     To make it run, the program calls itself. For this it relies on both execute_command_line
!     and get_command_argument
!
program chk_execute_cmdline
    implicit none

    integer             :: ierr
    character(len=100)  :: cmd
    real, dimension(10) :: x

    if ( command_argument_count() == 0 ) then
        call get_command_argument( 0, cmd )

        write(*,'(2a)') 'Run self: ', trim(cmd)

        cmd = trim(cmd) // ' 1'
        call execute_command_line( cmd )
    else
        write( *, '(a)' ) 'Running self - execute_command_line works'
    endif

end program chk_execute_cmdline
