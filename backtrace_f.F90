module backtrace_m

    interface
        pure subroutine c_backtrace() bind(C,name="c_backtrace")
            implicit none
        end subroutine c_backtrace
    end interface

    contains

    subroutine fortran_backtrace
        implicit none
        call c_backtrace
    end subroutine fortran_backtrace

end module backtrace_m

subroutine backtrace
    use backtrace_m
    implicit none
    call fortran_backtrace    
end subroutine backtrace
