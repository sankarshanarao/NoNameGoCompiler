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
     TDINT = 293,
     TDFLOAT = 294,
     TDBOOL = 295,
     TDSTRING = 296,
     BoolTrue = 297,
     BoolFalse = 298,
     String = 299,
     Float = 300,
     Int = 301
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
#define TLPAREN 276
#define TRPAREN 277
#define TLBRACE 278
#define TRBRACE 279
#define TCOMMA 280
#define TDOT 281
#define TPLUS 282
#define TMINUS 283
#define TMUL 284
#define TDIV 285
#define TKFOR 286
#define TKIF 287
#define TKFUNC 288
#define TKIMPORT 289
#define TKMAIN 290
#define TKPACKAGE 291
#define TKVAR 292
#define TDINT 293
#define TDFLOAT 294
#define TDBOOL 295
#define TDSTRING 296
#define BoolTrue 297
#define BoolFalse 298
#define String 299
#define Float 300
#define Int 301




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

