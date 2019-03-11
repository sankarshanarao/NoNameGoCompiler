/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
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
     TSEQUAL = 276,
     TLPAREN = 277,
     TRPAREN = 278,
     TLBRACE = 279,
     TRBRACE = 280,
     TCOMMA = 281,
     TDOT = 282,
     TSEMI = 283,
     TPLUS = 284,
     TMINUS = 285,
     TMUL = 286,
     TDIV = 287,
     TKFOR = 288,
     TKIF = 289,
     TKFUNC = 290,
     TKIMPORT = 291,
     TKMAIN = 292,
     TKPACKAGE = 293,
     TKVAR = 294,
     TKELSE = 295,
     TDINT = 296,
     TDFLOAT = 297,
     TDBOOL = 298,
     TDSTRING = 299,
     BoolTrue = 300,
     BoolFalse = 301,
     String = 302,
     Float = 303,
     Int = 304,
     MultiCommentBegin = 305,
     MultiCommentEnd = 306,
     Identifier = 307,
     TTERM = 308
   };
#endif
/* Tokens.  */
#define TIDENTIFIER 258
#define TINTEGER 259
#define TDOUBLE 260
#define TCEQ 261
#define TCNE 262
#define TCLT 263
#define TCLE 264
#define TCGT 265
#define TCGE 266
#define TEQUAL 267
#define TNEG 268
#define TBAND 269
#define TBOR 270
#define TBXOR 271
#define TAND 272
#define TOR 273
#define TLCHAN 274
#define TRCHAN 275
#define TSEQUAL 276
#define TLPAREN 277
#define TRPAREN 278
#define TLBRACE 279
#define TRBRACE 280
#define TCOMMA 281
#define TDOT 282
#define TSEMI 283
#define TPLUS 284
#define TMINUS 285
#define TMUL 286
#define TDIV 287
#define TKFOR 288
#define TKIF 289
#define TKFUNC 290
#define TKIMPORT 291
#define TKMAIN 292
#define TKPACKAGE 293
#define TKVAR 294
#define TKELSE 295
#define TDINT 296
#define TDFLOAT 297
#define TDBOOL 298
#define TDSTRING 299
#define BoolTrue 300
#define BoolFalse 301
#define String 302
#define Float 303
#define Int 304
#define MultiCommentBegin 305
#define MultiCommentEnd 306
#define Identifier 307
#define TTERM 308




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 28 "parser.y"
{
    std::string *string;
    int token;
}
/* Line 1529 of yacc.c.  */
#line 160 "parser.hpp"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

