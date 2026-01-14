//#include <mylib.h>
//#include "store_data.h"

#include <fstream>
#include <stdio.h>
#include <string>
#include <cstdint>
#include <filesystem>
#include <iostream>
using namespace std;

extern "C" void ReadVar(double& var1, double& var2, double& var3, double& var4, double& var5);
extern "C" void WriteVar(double var1, double var2, double var3, double var4, double var5);
extern "C" void ReadMap(int& var1, int& var2, int& var3, int& var4, int& var5, int& var6, int& var7, int& var8, bool& var9);
extern "C" void PrintVar(double var1, double var2, double var3, double var4, double var5, double var6, double var7, double var8);
int number;

void ReadVar(double& var1, double& var2, double& var3, double& var4, double& var5)
{
    std::ifstream Xclock;
    Xclock.open("./TextFiles/clock_values.txt");
    Xclock >> var1 >> var2 >> var3 >> var4 >> var5;
    Xclock.close();
}
void WriteVar(double var1, double var2, double var3, double var4, double var5) {
    std::ofstream Xclock;
    Xclock.open("./TextFiles/clock_values.txt");
    Xclock << var1 << " " << var2 << " " << var3 << " " << var4 << " " << var5<< "\n ";
    Xclock.close();
}
void ReadMap(int& var1, int& var2, int& var3, int& var4, int& var5, int& var6, int& var7, int& var8, bool& var9)
{
    std::ifstream Xclock;
    Xclock.open("./TextFiles/myfile.txt");
    Xclock >> var1 >> var2 >> var3 >> var4 >> var5>> var6>> var7>> var8>> var9;
    Xclock.close();
}
void PrintVar(double var1, double var2, double var3, double var4, double var5, double var6, double var7, double var8){
    std::ofstream Xclock;
    Xclock.open("./TextFiles/ModelVariables.txt",std::ios_base::app);
    Xclock << var1 << " " << var2 << " " << var3 << " " << var4 << " " << var5<<  " " << var6<<  " " << var7<<  " " << var8<< "\n ";
    Xclock.close();
}
/*void add(){
int a=10;
int b=20;
int c=a+b;

cout<<"The sum is "<<c;
}
int main(){
add();
}*/
