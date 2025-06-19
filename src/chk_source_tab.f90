! chk_source_tab.f90 --
!     Check: does the compiler accept source code with tabs?
!
program chk_source_tab
	implicit none

	integer :: x

	write( *, '(a)' ) 'As this program runs, the compiler accepts source code with tabs'
end program chk_source_tab
