#include <stdio.h>
#include <stdlib.h>

#include <execinfo.h>

#define MAX_DEPTH 100

void c_backtrace(void)
{
    void* pointers[MAX_DEPTH];
    const int depth = backtrace(pointers, MAX_DEPTH);

    char** symbols = NULL;
    symbols = backtrace_symbols(pointers, depth);
    if (symbols != NULL) {
        for (int i=0; i<depth; i++) {
            fprintf(stderr, "%p %s\n", pointers[i], symbols[i]);
        }
    }
    free(symbols);
}
