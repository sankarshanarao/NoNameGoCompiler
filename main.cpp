#include <iostream>
#include <map>
#include <vector>
#include <string>
#include <algorithm>

extern int yyparse();

using namespace std;

vector<string> symbolTable;

int insertSymbolTable(string varName) {
    vector <string>::iterator it;

    it = find(symbolTable.begin(), symbolTable.end(), varName);

    if (it != symbolTable.end()) {
        symbolTable.push_back(varName);
        cout<<"Variable "<<varName<<" registered"<<endl;
        return 1;
    } else {
        cout<<"Multiple Declarations of variable";
        return 0;
    }
}

int main(int argc, char **argv)
{
    yyparse();
    // std::cout<<"Parsing Done"<<std::endl;
    return 0;
}