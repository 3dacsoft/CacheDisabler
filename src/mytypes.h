#include <ctype.h>
#include <stdlib.h>
typedef unsigned char byte;

#ifndef __cplusplus
typedef enum { true = 1, false = 0 } bool;
#endif

typedef struct 
{
    char brand[16];
    int maxIndex;
    byte type;
    byte family;
    byte model;
    byte stepping;
} cpuinfo;
