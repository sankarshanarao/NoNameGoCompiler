%{
#include <string.h>
#include <stdio.h>
%}

alpha [a-zA-Z]
digit [0-9]

%%
[ \t\n]                     ;
true                        printf("BoolTrue\n");
false                       printf("BoolFalse\n");
"="                         printf("TEQUAL\n");
"=="                        printf("TCEQ\n");
"!="                        printf("TCNE\n");
"<"                         printf("TCLT\n");
"<="                        printf("TCLE\n");
">"                         printf("TCGT\n");
">="                        printf("TCGE\n");
"("                         printf("TLPAREN\n");
")"                         printf("TRPAREN\n");
"{"                         printf("TLBRACE\n");
"}"                         printf("TRBRACE\n");
"."                         printf("TDOT\n");
","                         printf("TCOMMA\n");
"+"                         printf("TPLUS\n");
"-"                         printf("TMINUS\n");
"*"                         printf("TMUL\n");
"/"                         printf("TDIV\n");
[\"].*[\"]                 printf("String\n");
{alpha}({alpha}|{digit}|_)* printf("Identifier: %s\n", yytext);
{digit}+.{digit}+           printf("Float\n");
{digit}+.?                  printf("Int\n");
.                           printf("Unknown token\n");
%%

int main() {
    yylex();
}