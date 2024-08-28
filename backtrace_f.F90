module backtrace_m
    interface
        pure subroutine c_backtrace() bind(C,name="c_backtrace")
            implicit none
        end subroutine c_backtrace
    end interface
end module backtrace_m

subroutine backtrace
    use backtrace_m
    implicit none
    call c_backtrace    
end subroutine backtrace
