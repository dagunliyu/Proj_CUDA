#ifndef CUDA_COMMON_H
#define CUDA_COMMON_H

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <cstdio>
#include <iostream>

// 这个搞法，综合了几个好处；
// 调用和fan写的那个CHECK一样简洁，只需要套在cudaXXX函数上
// 然后，自动把调用处的行数和文件名弄进去，然后这个真正的检测函数又不是一个宏（很多人喜欢的）
// 不过还是一个风格问题，没有本质的不同。

#define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__);}
inline void gpuAssert(cudaError_t code
    , const char* file, int line
    , bool abort=true)
{
    if (code != cudaSuccess) 
    {
        fprintf(stderr, "GPUassert: %s %s %d\n"
            , cudaGetErrorString(code)、
            , file
            , line);
        if (abort) 
        {
            exit(code);
        }
    }
}




#endif 