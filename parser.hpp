/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_HPP_INCLUDED
# define YY_YY_PARSER_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TIDENTIFIER = 258,
    TINTEGER = 259,
    TDOUBLE = 260,
    TCEQ = 261,
    TCNE = 262,
    TCLT = 263,
    TCLE = 264,
    TCGT = 265,
    TCGE = 266,
    TEQUAL = 267,
    TNEG = 268,
    TBAND = 269,
    TBOR = 270,
    TBXOR = 271,
    TAND = 272,
    TOR = 273,
    TLCHAN = 274,
    TRCHAN = 275,
    TLPAREN = 276,
    TRPAREN = 277,
    TLBRACE = 278,
    TRBRACE = 279,
    TCOMMA = 280,
    TDOT = 281,
    TPLUS = 282,
    TMINUS = 283,
    TMUL = 284,
    TDIV = 285,
    TKFOR = 286,
    TKIF = 287,
    TKFUNC = 288,
    TKIMPORT = 289,
    TKMAIN = 290,
    TKPACKAGE = 291,
    TKVAR = 292,
    TKELSE = 293,
    TDINT = 294,
    TDFLOAT = 295,
    TDBOOL = 296,
    TDSTRING = 297,
    BoolTrue = 298,
    BoolFalse = 299,
    String = 300,
    Float = 301,
    Int = 302,
    MultiCommentBegin = 303,
    MultiCommentEnd = 304,
    Identifier = 305
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 15 "parser.y" /* yacc.c:1909  */

    std::string *string;
    int token;

#line 110 "parser.hpp" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_HPP_INCLUDED  */
