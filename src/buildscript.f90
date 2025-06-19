! buildscript.f90 --
!     Auxiliary program to write the batchfile and shell script that
!     run the specific checking programs
!
program buildscript
    implicit none

    integer :: ierr, k
    integer :: label
    integer :: lunin  = 10
    integer :: lunbat = 21
    integer :: lunscr = 22

    integer :: number_features    = 0
    integer :: number_diagnostics = 0
    integer :: number_probes      = 0
    integer :: number_extensions  = 0

    logical :: exists
    logical :: end_program

    character(len=80) :: line
    character(len=20) :: type_program
    character(len=20) :: redirect = ' >>features.out 2>&1'

    open( lunin, file = 'buildscript.set', status = 'old' , iostat = ierr )

    if ( ierr /= 0 ) then
        write(*,'(a)') 'Error opening the buildscript.set file - terminating this step'
        stop
    endif

    open( lunbat, file = 'runfeatures.bat' )
    open( lunscr, file = 'runfeatures.sh' )

    write( lunbat, '(a)' ) '@echo off'
    write( lunscr, '(a)' ) '#!/bin/sh'
    write( lunbat, '(2a)' ) 'echo Output of the checks >features.out'
    write( lunscr, '(2a)' ) 'echo Output of the checks >features.out'

    label = 0
    end_program = .false.

    do
        read( lunin, '(a)', iostat = ierr ) line

        if ( ierr /= 0 ) then
            exit
        endif

        !
        ! Remove "carriage return" - some compilers do not remove it
        ! automatically
        !
        k = index( line, char(13) )
        if ( k > 0 ) then
            line(k:) = ' '
        endif

        !
        ! Handle the contents
        !
        if ( line(1:1) == '#' ) then
            cycle
        endif

        if ( line == ' ' .and. end_program ) then
            end_program = .false.
            write( lunbat, '(a,i0)'  ) ':skip', label
            write( lunscr, '(a)'     ) 'fi'
            cycle
        endif

        if ( line(1:1) == '@' ) then
            end_program = .true.
            read(  lunin, * ) type_program
            select case ( type_program )
                case( 'FEATURE' )
                    number_features = number_features + 1
                case( 'DIAGNOSTIC' )
                    number_diagnostics = number_diagnostics + 1
                case( 'EXTENSION' )
                    number_extensions = number_extensions + 1
                case( 'PROBE' )
                    number_probes = number_probes + 1
                case default
                    write( *, '(2a)' ) 'Error: unknown program type - ', trim(type_program)
            end select

            inquire( file = trim(line(2:))//'.f90', exist = exists )
            if ( .not. exists ) then
                write( *, '(a,a)' ) 'Problem: the file does not exist - ', trim(line(2:))
            endif

            write( lunbat, '(3a)' ) 'echo .', redirect
            write( lunscr, '(3a)' ) 'echo .', redirect
            write( lunbat, '(3a)' ) 'echo Check program: ', trim(line(2:))
            write( lunbat, '(3a)' ) 'echo Check program: ', trim(line(2:)), redirect
            write( lunscr, '(3a)' ) 'echo Check program: ', trim(line(2:))
            write( lunscr, '(3a)' ) 'echo Check program: ', trim(line(2:)), redirect
            write( lunbat, '(3a)' ) 'echo -------------', redirect
            write( lunscr, '(3a)' ) 'echo -------------', redirect
            write( lunbat, '(3a)' ) 'echo .', redirect
            write( lunscr, '(3a)' ) 'echo .', redirect
            write( lunbat, '(4a)'  ) 'call compile ', trim(line(2:)), ' %1 %2 %3 %4 %5 %6 %7 %8', redirect
            write( lunscr, '(4a)' ) './compile ', trim(line(2:)), ' $1 $2 $3 $4 $5 $6 $7 $8', redirect
            write( lunbat, '(a,a)' ) 'echo .', redirect
            write( lunscr, '(a,a)' ) 'echo .', redirect

            label = label + 1
            write( lunbat, '(3a,i0)' ) 'if not exist ', trim(line(2:)), '.exe goto next', label
            write( lunbat, '(3a)'    ) trim(line(2:)), '.exe', redirect
            write( lunbat, '(a,i0)'  ) 'goto skip', label
            write( lunbat, '(a,i0)'  ) ':next', label

            write( lunscr, '(3a)'    ) 'if [ -f ', trim(line(2:)), '.exe ]; then'
            write( lunscr, '(3x,4a)' ) './', trim(line(2:)), '.exe', redirect
            write( lunscr, '(a)'     ) 'else'
        else
            write( lunbat, '(3a)'   ) '   echo ', trim(line), redirect
            write( lunscr, '(4a)'    ) '   echo ''', trim(line), '''', redirect
        endif

    enddo

    write( lunbat, '(a,i0)'  ) ':skip', label
    write( lunscr, '(a)'  ) 'fi'

    write( *, '(/,a,i0,a)' ) 'Number of tests to run: ', label
    write( *, '(a,i0,a)' )   '    Number of feature checks:                 ', number_features
    write( *, '(a,i0,a)' )   '    Number of diagnostic checks:              ', number_diagnostics
    write( *, '(a,i0,a)' )   '    Number of checks on behaviour/properties: ', number_probes
    write( *, '(a,i0,a)' )   '    Number of checks on compiler extensions:  ', number_extensions
end program buildscript
