FC = gfortran
FFLAGS = -g -Og

all: test.x backtrace.o

backtrace.o: backtrace.F90
	$(FC) $(FFLAGS) -c $< -o $@

test.x: test.F90
	$(FC) $(FFLAGS) $< -o $@

clean:
	-rm -f test.x a.out *.o
	-rm -rf *.dSYM
