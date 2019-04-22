%{
    #include <iostream>
    #include <string>
    #include "ast-node.h"

    extern int linenumber; 
    extern int yylex();
    extern int insertSymbolTable(std::string);
    void yyerror(const char *s) {
    printf("LINE :%d ERROR:%s\n", linenumber, s); 
    }

    using namespace std;
    extern int insertSymbolTable(string s);
    extern int definedBefore(string s);

    extern NGlobalBlock *progBlock;
%}



%token <string> TIDENTIFIER TINTEGER TDOUBLE
%token <token> TCEQ TCNE TCLT TCLE TCGT TCGE TEQUAL TNEG TBAND TBOR TBXOR TAND TOR TLCHAN TRCHAN TSEQUAL
%token <token> TLPAREN TRPAREN TLBRACE TRBRACE TCOMMA TDOT TSEMI
%token <token> TPLUS TMINUS TMUL TDIV
%token <token> TKFOR TKIF TKFUNC TKIMPORT TKMAIN TKPACKAGE TKVAR TKELSE
%token <token> TDINT TDFLOAT TDBOOL TDSTRING
%token <string> BoolTrue BoolFalse String Float Int MultiCommentBegin MultiCommentEnd Identifier
%token <token> TTERM

%union {
    Node *node;
    NBlock *block;
    NStatement *stmt;
    NExpression *expr;
    StatementList *gDeclLst;
    std::string *string;
    int token;
}

// %type <string> Literal
%type <expr> Literal
%type <stmt> VariableDecla Statementdash
%type <block> StatementList CompoundBloc MainFunc
%type <expr> Expression
%type <token> BinaryOperators

%left TPLUS TMINUS
%left TMUL TDIV

%start program

%%

program:
    PackageDefinition Imports Declaration MainFunc {
        progBlock->mainBlock = $<block>4;
    }
    | PackageDefinition Declaration MainFunc {
        progBlock->mainBlock = $<block>3;
    }
    ;

// Package
PackageDefinition:
    TKPACKAGE TKMAIN TTERM {
        progBlock->packageName = "main";
        cout<<"import:main"<<endl;
    }
    | TKPACKAGE Identifier TTERM {
        cout<<"import:"<<*$2<<endl;
        progBlock->packageName = *$2;
    }
    ;

// Import
Imports:
    SingleImports TKIMPORT String TTERM
    ;

SingleImports:
    SingleImports TKIMPORT String TTERM 
    |
    ;

// Declaration
Declaration:
    VariableDecla Declaration { 
        progBlock->GlobDecl.push_back($<stmt>1);
        cout<<"VarDecl:"<<progBlock->GlobDecl.size()<<endl;
    }
    | { 
        NStatement *simply = new NStatement();
        // $$->push_back(simply); 
        cout<<"DeclEnd"<<endl;
    }
    ;

VariableDecla:
    TKVAR Identifier TEQUAL Literal TTERM {
        string *typeS;
        // cout<<"VarDeclTrial2type:"<<$4->typeOf()<<endl;
        switch($4->typeOf()) {
            case 'u': typeS = new std::string("unk"); break;
            case 'i': typeS = new std::string("int"); break;
            case 'f': typeS = new std::string("float"); break;
            case 's': typeS = new std::string("string"); break;
            case 'b': typeS = new std::string("bool"); break;
        }
        
        NIdentifier *typE = new NIdentifier(*typeS);
        NIdentifier *id = new NIdentifier(*$2);
        delete $2;
        $$ = new NVariableDeclaration(*typE, *id, $4);
        // cout<<$$->printJSON();
    }
    | Identifier TSEQUAL Literal TTERM {
        string *typeS;
        // cout<<"VarDeclTrial2type:"<<$3->typeOf()<<endl;
        switch($3->typeOf()) {
            case 'u': typeS = new std::string("unk"); break;
            case 'i': typeS = new std::string("int"); break;
            case 'f': typeS = new std::string("float"); break;
            case 's': typeS = new std::string("string"); break;
            case 'b': typeS = new std::string("bool"); break;
        }
        
        NIdentifier *typE = new NIdentifier(*typeS);
        NIdentifier *id = new NIdentifier(*$1);
        delete $1;
        $$ = new NVariableDeclaration(*typE, *id, $3);
        // cout<<$$->printJSON();
    }
    ;

Literal:
    BoolTrue {
        $$ = new NBool('T');
    }
    | BoolFalse {
        $$ = new NBool('T');
    }
    | String {
        // cout<<*$1<<endl;
        $$ = new NString(*$1);
    }
    | Float {
        double fl = atof($1->c_str());
        $$ = new NFloat(fl);
        // cout<<fl<<endl;
    }
    | Int {
        long long int v = atoi($1->c_str());
        $$ = new NInteger(v);
        // cout<<v<<endl;
    }
    ;

MainFunc:
    TKFUNC TKMAIN TLPAREN TRPAREN CompoundBloc {
        $$ = $5;
    }
    ;

CompoundBloc:
    TLBRACE  TTERM
        StatementList
    TRBRACE TTERM {
        $$ = $3;
        // $$->printJSON();
        // cout<<endl;
    }
    | TLBRACE  TTERM
      TRBRACE TTERM {
          $$ = new NBlock();
      }
    ;

StatementList:
    Statementdash {
        // cout<<"\nStatementListDash\n";
        $$ = new NBlock();
        $$->statements.push_back($<stmt>1);
        // $<stmt>1->printJSON();
        // cout<<endl;
        }
    | StatementList Statementdash {
        $1->statements.push_back($<stmt>2);
        // cout<<"\nStatementListDUB\n";
        }
    ;

Statementdash:
    VariableDecla
    | Expression { $$ = new NExpressionStatement(*$1); }
    ;

BinaryOperators:
    TCEQ | TCNE | TBAND | TBOR | TBXOR | TAND | TOR
    | TCLE | TCLT | TCGT | TCGE 
    | TMINUS
    | TPLUS
    | TMUL
    | TDIV
    ;

Expression:
    Identifier TEQUAL Expression {
        cout<<"Id"<<*$1;
        NIdentifier *id = new NIdentifier(*$1);
        $$ = new NAssign(*id, *$3);

        cout<<"AssignDOne\n";
        }
    | Identifier { $$ = new NIdentifier(*$1); delete $1;}
    | Literal
    | Expression BinaryOperators Expression { 
        $$ = new NBinOp(*$1, $2, *$3);
        cout<<"\nBinOps"<<$2<<endl;
        }
    | TLPAREN Expression TRPAREN
%%
