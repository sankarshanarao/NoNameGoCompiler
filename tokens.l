%{
#include <string>
#include <iostream>
#include "parser.hpp"
#define SAVE_TOKEN yylval.string= new std::string(yytext,yyleng)
#define TOKEN(t) (yylval.token=t)

int emptyLine = 1;
%}

alpha [a-zA-Z]
digit [0-9]

%%
[ \t]                       ;   // ignoring spaces and tabs
[\n]                        {
    if(emptyLine) {
        // std::cout<<"emptyLine";
        emptyLine=1;
    } else {
        // std::cout<<"newLine";
        emptyLine=1;
        return TTERM;
    }
} // counting line nos for error reporting

"="                         { emptyLine=0; printf("TEQUAL\n"); return TOKEN(TEQUAL);}
":="                        { emptyLine=0; printf("TSEQUAL\n"); return TOKEN(TSEQUAL);}
"=="                        { emptyLine=0; printf("TCEQ\n"); return TOKEN(TCEQ);}
"!="                        { emptyLine=0; printf("TCNE\n"); return TOKEN(TCNE);}
"!"                         { emptyLine=0; printf("TNEG\n"); return TOKEN(TNEG);}
"&"                         { emptyLine=0; printf("TBAND\n"); return TOKEN(TBAND);}
"|"                         { emptyLine=0; printf("TBOR\n"); return TOKEN(TBOR);}
"^"                         { emptyLine=0; printf("TBXOR\n"); return TOKEN(TBXOR);}
"&&"                        { emptyLine=0; printf("TAND\n"); return TOKEN(TAND);}
"||"                        { emptyLine=0; printf("TOR\n"); return TOKEN(TOR);}
"<-"                        { emptyLine=0; printf("TLCHAN\n"); return TOKEN(TLCHAN);}
"->"                        { emptyLine=0; printf("TRCHAN\n"); return TOKEN(TRCHAN);}
"<"                         { emptyLine=0; printf("TCLT\n"); return TOKEN(TCLT);}
"<="                        { emptyLine=0; printf("TCLE\n"); return TOKEN(TCLE);}
">"                         { emptyLine=0; printf("TCGT\n"); return TOKEN(TCGT);}
">="                        { emptyLine=0; printf("TCGE\n"); return TOKEN(TCGE);}
"("                         { emptyLine=0; printf("TLPAREN\n"); return TOKEN(TLPAREN);}
")"                         { emptyLine=0; printf("TRPAREN\n"); return TOKEN(TRPAREN);}
"{"                         { emptyLine=0; printf("TLBRACE\n"); return TOKEN(TLBRACE);}
"}"                         { emptyLine=0; printf("TRBRACE\n"); return TOKEN(TRBRACE);}
"."                         { emptyLine=0; printf("TDOT\n"); return TOKEN(TDOT);}
","                         { emptyLine=0; printf("TCOMMA\n"); return TOKEN(TCOMMA);}
"+"                         { emptyLine=0; printf("TPLUS\n"); return TOKEN(TPLUS);}
"-"                         { emptyLine=0; printf("TMINUS\n"); return TOKEN(TMINUS);}
"*"                         { emptyLine=0; printf("TMUL\n"); return TOKEN(TMUL);}
"/"                         { emptyLine=0; printf("TDIV\n"); return TOKEN(TDIV);}
";"                         { emptyLine=0; printf("TSEMI\n"); return TOKEN(TSEMI);}


for                         { emptyLine=0; printf("TKFOR\n"); return TOKEN(TKFOR);}    // keyword for
if                          { emptyLine=0; printf("TKIF\n"); return TOKEN(TKIF);} // keyword if
else                        { emptyLine=0; printf("TKELSE\n"); return TOKEN(TKELSE);} // keyword else
func                        { emptyLine=0; printf("TKFUNC\n"); return TOKEN(TKFUNC);}   // keyword func
import                      { emptyLine=0; printf("TKIMPORT\n"); return TOKEN(TKIMPORT);}   // keyword import
main                        { emptyLine=0; printf("TKMAIN\n"); return TOKEN(TKMAIN);} // keyword main
package                     { emptyLine=0; printf("TKPACKKAGE\n"); return TOKEN(TKPACKAGE);} // keyword package
var                         { emptyLine=0; printf("TKVAR\n"); return TOKEN(TKVAR);} // keyword var


true                        { emptyLine=0; printf("BoolTrue\n"); SAVE_TOKEN; return BoolTrue;}   // literal bool
false                       { emptyLine=0; printf("BoolFalse\n"); SAVE_TOKEN;return BoolFalse;}  // literal bool
[\"].*[\"]                  { emptyLine=0; printf("String\n"); SAVE_TOKEN; return String;}  // literal string
{digit}+.{digit}+           { emptyLine=0; printf("Float\n"); SAVE_TOKEN; return Float;}  // literal float
{digit}+.?                  { emptyLine=0; printf("Int\n"); SAVE_TOKEN; return Int;}    // literal int



{alpha}({alpha}|{digit}|_)* { emptyLine=0; printf("Identifier: %s\n", yytext); SAVE_TOKEN; return Identifier;} // identifier

\/\/.* ;
\/\*(.*)*                 { emptyLine=0; printf("MultiCommentBegin\n"); SAVE_TOKEN; return MultiCommentBegin;}
(.*)*.*\*\/               { emptyLine=0; printf("MultiCommentEnd"); SAVE_TOKEN; return MultiCommentEnd;}
.                         { emptyLine=0; printf("Unknown token\n"); SAVE_TOKEN; return yytext[0];}


<<EOF>>                   { emptyLine=0; printf("EOF Encountered\n"); return EOF;}
%%