#include <iostream>

extern "C" const char* helloFromCpp() {
    return "Hello world !!";
}



extern "C" int SumFunctionCpp(int a, int b) {
    return a + b ; 
}
