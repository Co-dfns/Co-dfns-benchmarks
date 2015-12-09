#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <accelmath.h>
#include <dwa.h>

void *mk(int ec) {
	int c = ceil(ec / 8.0);
	aplchar8 *restrict tgt = malloc(c * sizeof(aplchar8));
	#pragma acc enter data create(tgt[:c])
	
	#pragma acc kernels loop present(tgt[:c])
	for(int i = 0; i < c; i++) tgt[i] = -1;
	
	return tgt;
}

void *gk(aplchar8 *restrict io, aplchar8 *restrict G0, aplchar8 *restrict G1, aplchar8 *restrict TJ0, 
    int S0, int S1, int TJR, int TJC) {
	int c = ceil(S0 * S1 / 8.0);
	#pragma acc kernels loop independent present(io[:c]) copyin(G0[:S0],G1[:S1],TJ0[:TJR*TJC])
	for (int i = 0; i < c; i++) {
		aplchar8 tmp = 0;
		tmp |= (0 != TJ0[G0[(i * 8 + 0) / S1] * TJC + G1[(i * 8 + 0) % S1]]) << 7;
		tmp |= (0 != TJ0[G0[(i * 8 + 1) / S1] * TJC + G1[(i * 8 + 1) % S1]]) << 6;
		tmp |= (0 != TJ0[G0[(i * 8 + 2) / S1] * TJC + G1[(i * 8 + 2) % S1]]) << 5;
		tmp |= (0 != TJ0[G0[(i * 8 + 3) / S1] * TJC + G1[(i * 8 + 3) % S1]]) << 4;
		tmp |= (0 != TJ0[G0[(i * 8 + 4) / S1] * TJC + G1[(i * 8 + 4) % S1]]) << 3;
		tmp |= (0 != TJ0[G0[(i * 8 + 5) / S1] * TJC + G1[(i * 8 + 5) % S1]]) << 2;
		tmp |= (0 != TJ0[G0[(i * 8 + 6) / S1] * TJC + G1[(i * 8 + 6) % S1]]) << 1;
		tmp |= (0 != TJ0[G0[(i * 8 + 7) / S1] * TJC + G1[(i * 8 + 7) % S1]]) << 0;
		io[i] &= tmp;
	}
	
	return io;
}

void fk(aplchar8 *tgt, aplchar8 *in, int ec) {
	int c = ceil(ec / 8.0);
	#pragma acc exit data copyout(in[:c])
	memcpy(tgt, in, c*sizeof(aplchar8));
	free(in);
}
