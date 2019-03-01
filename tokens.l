%{
#include <string>
#include <iostream>
#include "parser.hpp"
#define SAVE_TOKEN yylval.string= new std::string(yytext,yyleng)
#define TOKEN(t) (yylval.token=t)
%}

alpha [a-zA-Z]
digit [0-9]

%%
[ \t]                       ;   // ignoring spaces and tabs
[\n]+                        {yylineno++; printf("NEW LINE NUMBER %d\n",yylineno); return yytext[0];} // counting line nos for error reporting


"="                         { printf("TEQUAL\n"); return TOKEN(TEQUAL);}
"=="                        { printf("TCEQ\n"); return TOKEN(TCEQ);}
"!="                        { printf("TCNE\n"); return TOKEN(TCNE);}
"!"                         { printf("TNEG\n"); return TOKEN(TNEG);}
"&"                         { printf("TBAND\n"); return TOKEN(TBAND);}
"|"                         { printf("TBOR\n"); return TOKEN(TBOR);}
"^"                         { printf("TBXOR\n"); return TOKEN(TBXOR);}
"&&"                        { printf("TAND\n"); return TOKEN(TAND);}
"||"                        { printf("TOR\n"); return TOKEN(TOR);}
"<-"                        { printf("TLCHAN\n"); return TOKEN(TLCHAN);}
"->"                        { printf("TRCHAN\n"); return TOKEN(TRCHAN);}
"<"                         { printf("TCLT\n"); return TOKEN(TCLT);}
"<="                        { printf("TCLE\n"); return TOKEN(TCLE);}
">"                         { printf("TCGT\n"); return TOKEN(TCGT);}
">="                        { printf("TCGE\n"); return TOKEN(TCGE);}
"("                         { printf("TLPAREN\n"); return TOKEN(TLPAREN);}
")"                         { printf("TRPAREN\n"); return TOKEN(TRPAREN);}
"{"                         { printf("TLBRACE\n"); return TOKEN(TLBRACE);}
"}"                         { printf("TRBRACE\n"); return TOKEN(TRBRACE);}
"."                         { printf("TDOT\n"); return TOKEN(TDOT);}
","                         { printf("TCOMMA\n"); return TOKEN(TCOMMA);}
"+"                         { printf("TPLUS\n"); return TOKEN(TPLUS);}
"-"                         { printf("TMINUS\n"); return TOKEN(TMINUS);}
"*"                         { printf("TMUL\n"); return TOKEN(TMUL);}
"/"                         { printf("TDIV\n"); return TOKEN(TDIV);}


for                         { printf("TKFOR\n"); return TOKEN(TKFOR);}    // keyword for
if                          { printf("TKIF\n"); return TOKEN(TKIF);} // keyword if
else                        { printf("TKELSE\n"); return TOKEN(TKELSE);} // keyword else
func                        { printf("TKFUNC\n"); return TOKEN(TKFUNC);}   // keyword func
import                      { printf("TKIMPORT\n"); return TOKEN(TKIMPORT);}   // keyword import
main                        { printf("TKMAIN\n"); return TOKEN(TKMAIN);} // keyword main
package                     { printf("TKPACKKAGE\n"); return TOKEN(TKPACKAGE);}

true                        { printf("BoolTrue\n"); SAVE_TOKEN; return BoolTrue;}   // literal bool
false                       { printf("BoolFalse\n"); SAVE_TOKEN;return BoolFalse;}  // literal bool
[\"].*[\"]                  { printf("String\n"); SAVE_TOKEN; return String;}  // literal string
{digit}+.{digit}+           { printf("Float\n"); SAVE_TOKEN; return Float;}  // literal float
{digit}+.?                  { printf("Int\n"); SAVE_TOKEN; return Int;}    // literal int


{alpha}({alpha}|{digit}|_)* { printf("Identifier: %s\n", yytext); SAVE_TOKEN; return Identifier;} // identifier

\/\/.* ;
\/\*(.*)*                 { printf("MultiCommentBegin\n"); SAVE_TOKEN; return MultiCommentBegin;}
(.*)*.*\*\/               { printf("MultiCommentEnd"); SAVE_TOKEN; return MultiCommentEnd;}
.                         { printf("Unknown token\n"); SAVE_TOKEN; return yytext[0];}


%%
//<<EOF>>                   { printf("EOF Encountered"); return EOF;}
