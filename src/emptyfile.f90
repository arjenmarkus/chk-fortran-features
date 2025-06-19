! Does this program stop?
!
program test

 character(len=:), allocatable :: a
 a = IO_read('empty.txt')

 print*, len(a)
 print*, '#'//a//'#'

contains

function IO_read(fileName) result(fileContent)

  character(len=*),  intent(in) :: fileName
  character(len=:), allocatable :: fileContent
  integer ::  &
    fileLength, &
    fileUnit, &
    myStat

  inquire(file = fileName, size=fileLength)
  open(newunit=fileUnit, file=fileName, access='stream',&
       status='old', position='rewind', action='read',iostat=myStat)
  if(myStat /= 0) stop 1
  allocate(character(len=fileLength)::fileContent)

  write(*,*) 'length: ', fileLength

  do i = 1,10
      read(fileUnit,iostat=ierr) fileContent
      if ( ierr /= 0 ) then
          write(*,*) 'Stoppped at ', i
          exit
      endif
  enddo
  close(fileUnit)

end function IO_read

end program test
