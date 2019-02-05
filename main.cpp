#include <iostream>

extern int yyparse();

int main(int argc, char **argv)
{
    yyparse();
    // std::cout<<"Parsing Done"<<std::endl;
    return 0;
}