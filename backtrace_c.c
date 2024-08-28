#include <stdio.h>
#include <stdlib.h>

#include <execinfo.h>

#define _GNU_SOURCE
#include <dlfcn.h>

#define MAX_DEPTH 100

void c_backtrace(void)
{
    void* pointers[MAX_DEPTH];
    const int depth = backtrace(pointers, MAX_DEPTH);

    char** symbols = NULL;
    symbols = backtrace_symbols(pointers, depth);
    if (symbols != NULL) {
        for (int i=0; i<depth; i++) {
            fprintf(stderr, "%s\n", symbols[i]);
            Dl_info info;
            int rc = dladdr(pointers[i], &info);
            if (rc) fprintf(stderr, "\t%p %s %s\n", pointers[i], info.dli_fname, info.dli_sname);
        }
    }
    free(symbols);
}
