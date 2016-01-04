#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#ifdef _OPENACC
 #include <accelmath.h>
#endif
#include <dwa.h>

aplint8 *restrict buf = NULL;

void *mk(int ec) {
	int c = ceil(ec / 8.0);
	aplchar8 *restrict tgt = malloc(c * sizeof(aplchar8));
	buf = malloc(ec * sizeof(aplint8));
	#pragma acc enter data create(tgt[:c])
	
	#pragma acc kernels loop present(tgt[:c])
	for(int i = 0; i < c; i++) tgt[i] = -1;
	
	return tgt;
}

void *gk(aplchar8 *restrict io, aplchar8 *restrict G0, aplchar8 *restrict G1, aplchar8 *restrict TJ0, 
    int S0, int S1, int TJR, int TJC) {
	int c = ceil(S0 * S1 / 8.0);

	for (int i = 0; i < S0; i++) {
		for (int j = 0; j < S1; j++) {
			buf[i * S1 + j] = 0 != TJ0[G0[i] * TJC + G1[j]];
		}
	}
	
	for (int i = 0; i < c; i++) {
		aplint8 tmp = 0;
		tmp |= buf[i * 8 + 0] << 7;
		tmp |= buf[i * 8 + 1] << 6;
		tmp |= buf[i * 8 + 2] << 5;
		tmp |= buf[i * 8 + 3] << 4;
		tmp |= buf[i * 8 + 4] << 3;
		tmp |= buf[i * 8 + 5] << 2;
		tmp |= buf[i * 8 + 6] << 1;
		tmp |= buf[i * 8 + 7] << 0;
		io[i] &= tmp;
	}
	
	return io;
}

void fk(aplchar8 *tgt, aplchar8 *in, int ec) {
	int c = ceil(ec / 8.0);
	#pragma acc exit data copyout(in[:c])
	memcpy(tgt, in, c*sizeof(aplchar8));
	free(in);free(buf);
}
