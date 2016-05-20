#include <math.h>
#include <error.h>
#include <stdio.h>
#include <stdlib.h>
#include <accelmath.h>

double *makedata(double*dat,size_t count){
  double*buf=malloc(count*sizeof(double));
  if(!buf)perror("Out of memory!");
  memcpy(buf,dat,count*sizeof(double));
  #pragma acc enter data copyin(buf[:count])
  return buf;
}

void freedata(double *dat,size_t count){
  free(dat);
  #pragma acc exit data delete(dat[:count])
}

void romilly(double*res,double*mat,double*vec,size_t rows,size_t cols){
  size_t total=rows*cols;
  #pragma acc kernels present(vec[:cols],mat[:total],res[:rows])
{
  #pragma acc loop independent
  for(size_t i=0;i<rows;i++){
    double a=0;
    #pragma acc loop reduction(+:a)
    for(size_t j=0;j<cols;j++){
      a+=mat[i*cols+j]*vec[j];
    }
    res[i]=1/(1+exp(-a));
  }
}
}

