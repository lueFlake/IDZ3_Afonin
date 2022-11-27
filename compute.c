#include <math.h>
#include <stdio.h>
#include <stdlib.h>

double compute(double x) {
    double res = 0;
    double a = 1;
    for (int i = 1; fabs(a) > 1e-14; ++i) {
        res += a;
        a *= fabs(x) / i;
    }
    return x > 0 ? 1 / res : res;
}