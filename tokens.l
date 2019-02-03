%{
#include <string.h>
#include <stdio.h>
%}

alpha [a-zA-Z]
digit [0-9]

%%
[ \t]                       ;   // ignoring spaces and tabs
[\n]                        yylineno++; // counting line nos for error reporting


"="                         { printf("TEQUAL\n"); }
"=="                        { printf("TCEQ\n"); }
"!="                        { printf("TCNE\n"); }
"!"                         { printf("TNEG\n"); }
"&"                         { printf("TBAND\n"); }
"|"                         { printf("TBOR\n"); }
"^"                         { printf("TBXOR\n"); }
"&&"                        { printf("TAND\n"); }
"||"                        { printf("TOR\n"); }
"<-"                        { printf("TLCHAN\n"); }
"->"                        { printf("TRCHAN\n"); }
"<"                         { printf("TCLT\n"); }
"<="                        { printf("TCLE\n"); }
">"                         { printf("TCGT\n"); }
">="                        { printf("TCGE\n"); }
"("                         { printf("TLPAREN\n"); }
")"                         { printf("TRPAREN\n"); }
"{"                         { printf("TLBRACE\n"); }
"}"                         { printf("TRBRACE\n"); }
"."                         { printf("TDOT\n"); }
","                         { printf("TCOMMA\n"); }
"+"                         { printf("TPLUS\n"); }
"-"                         { printf("TMINUS\n"); }
"*"                         { printf("TMUL\n"); }
"/"                         { printf("TDIV\n"); }


for                         { printf("TKFOR\n"); }    // keyword for
if                          { printf("TKIF\n"); } // keyword if
func                        { printf("TKFUNC\n"); }   // keyword func
import                      { printf("TKIMPORT\n"); }   // keyword import
main                        { printf("TKMAIN\n"); } // keyword main


true                        { printf("BoolTrue\n"); }   // literal bool
false                       { printf("BoolFalse\n"); }  // literal bool
[\"].*[\"]                  { printf("String\n"); }  // literal string
{digit}+.{digit}+           { printf("Float\n"); }  // literal float
{digit}+.?                  { printf("Int\n"); }    // literal int


{alpha}({alpha}|{digit}|_)* { printf("Identifier: %s\n", yytext); } // identifier

\/\/.* ;
\/\*(.*)*                 { printf("MultiCommentBegin\n"); }
(.*)*.*\*\/               { printf("MultiCommentEnd"); }
.                         { printf("Unknown token\n"); }
%%

int main() {
    yylex();
}