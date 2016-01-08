
#include "mex.h" /*The mex library*/
#include <math.h>
#include <stdlib.h>
#include <omp.h>

void Compute_SSD(double *patcha, double *patchb,int N,double *dist)
{
    int i;
    
    for (i = 0; i < N; i++)
    {
         //printf("\na[%d]= %4.2f---b[%d]= %4.2f",i,patcha[i],i,patchb[i]);
        *dist += (patcha[i]-patchb[i])*(patcha[i]-patchb[i]);
    }
    
/*No changes, except for the removal of "printf"*/
}
/* The gateway function that replaces the "main".
*plhs[] - the array of output values
*prhs[] - the array of input values
*/
void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *patcha, *patchb, *dist; /*Variable declarations as in C*/
    int N;
    patcha = mxGetPr(prhs[0]);
    patchb = mxGetPr(prhs[1]);
    /*Sets "par" to be the first of the input values*/
    N = mxGetM(prhs[1]);
    //printf("N= %d",N);
    /*Sets "N" to be the second of the input values*/
    plhs[0] = mxCreateDoubleScalar(0.0); /*Creates */
    dist = mxGetPr(plhs[0]);
    /*Sets "val" to be the first of the output values*/
    /* call the computational routine */
    Compute_SSD(patcha,patchb,N,dist);
}
