#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>

extern double compute(double x);
extern double genFloat(double fMin, double fMax);

int main(int argc, char** argv) {
    srand(time(0));
    clock_t start, finish;
    clock_t total = 0;
    double x;
    double res;

    FILE* ifs = stdin;
    FILE* ofs = stdout;

    char isRandom = 0;

    if (argc == 3) {
        if (argv[1][0] != '%') {
            ifs = fopen(argv[1], "r");
        } else {
            isRandom = 1;
        }
        ofs = fopen(argv[2], "w");
    } else {
        printf("Wrong no. of arguments\n");
        return 0;
    }
    if (ifs == NULL) {
        printf("Failed to open file %s\n", argv[1]);
        return 0;
    }
    if (!isRandom) {
        int success = fscanf(ifs, "%lf", &x);
        if (!success) {
            printf("Failed to read file %s\n", argv[1]);
            return 0;
        }
        start = clock();
        res = compute(x);
        finish = clock();
        printf("%.10e\n", res);
        fprintf(ofs, "%.10e\n", res);
        fprintf(ofs, "time: %ld ms\n", finish - start);
    } else {
        for (int i = 0; i < 1000000; ++i) {
            x = genFloat(-200, 200);
            start = clock();
            res = compute(x);
            finish = clock();
            if (i < 100) {
                fprintf(ofs, "test no.%d:\n\n in: %f\n\n ", i, x);
                fprintf(ofs, "out: %.10e\n\n", res);
            }
            total += finish - start;
        }
        fprintf(ofs, "total random testing time: %ld ms", total);
    }
    return 0;
}