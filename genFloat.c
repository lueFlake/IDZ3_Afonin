#include <time.h>
#include <stdlib.h>

double genFloat(double fMin, double fMax) {
    double f = (double)rand() / RAND_MAX;
    return fMin + f * (fMax - fMin);
}