%{

#include <stdio.h>

#define YY_DECL int yylex()

#include "algebraic2.tab.h"

%}

%%

[ \t]	             ;
[0-9]+\.[0-9]+ 	     {yylval.val = atof(yytext); return NUM;}
[0-9]+		         {yylval.val = atoi(yytext); return NUM;}
\n		             {return NL;}
"+"		             {return PLUS;}
"-"		             {return MINUS;}
"%"                  {return MODULUS;}
"*"		             {return MULTIPLY;}
"/"		             {return DIVIDE;}
"^"                  {return EXP;}
"("		             {return LPAREN;}
")"		             {return RPAREN;}
[Ss][Ii][Nn]         {return SIN;}
[Cc][Oo][Ss]         {return COS;}
[Tt][Aa][Nn]         {return TAN;}
[Dd][Ee][Gg]         {return DEG;}
[Aa][Ss][Ii][Nn]     {return ASIN;}
[Aa][Cc][Oo][Ss]     {return ACOS;}
[Aa][Tt][Aa][Nn]     {return ATAN;}
[Cc][Oo][Ss][Hh]     {return COSH;}
[Ss][Ii][Nn][Hh]     {return SINH;}
[Tt][Aa][Nn][Hh]     {return TANH;}
[Aa][Cc][Oo][Ss][Hh] {return ACOSH;}
[Aa][Ss][Ii][Nn][Hh] {return ASINH;}
[Aa][Tt][Aa][Nn][Hh] {return ATANH;}
[Ee][Xx][Pp]         {return EXP;}
[Ll][Oo][Gg]         {return LOG;}
[Ll][Oo][Gg][1][0]   {return LOG10;}
[Ss][Qq][Rr][Tt]     {return SQRT;}
"exit"   		     {return QUIT;}
"quit"		         {return QUIT;}

%%
