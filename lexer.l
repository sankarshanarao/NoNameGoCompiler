%{
#include <iostream>

using namespace std;

int emptyLine = 1;
%}

alpha [a-zA-Z]
digit [0-9]

%%
[ \t]               ;
[\n]                {
    if (!emptyLine) {
        std::cout<<"NewLine";
    } else {
        std::cout<<"EmptyLine";
    }
    emptyLine = 1;
}

.                   {
    emptyLine = 0;
}
%%

int main() {
    yylex();
    return 0;
}
