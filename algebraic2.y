// ALGEBRAIC2
// Kyle Alexander Buan (tar.shoduze@gmail.com)
// March 16, 2016

%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
double kpow(double number, double exponent);
	
int yywrap()
{
    return 1;
} 

%}

%union {
	double val;
}

%token<val> NUM
%token      PLUS MINUS MODULUS MULTIPLY DIVIDE EXP LPAREN RPAREN
%token      SIN COS TAN DEG ASIN ACOS ATAN COSH SINH TANH ACOSH ASINH ATANH LOG LOG10 SQRT
%token      NL QUIT
%left       PLUS MINUS
%left       MODULUS MULTIPLY DIVIDE
%left       SIN COS TAN DEG ASIN ACOS ATAN COSH SINH TANH ACOSH ASINH ATANH LOG LOG10 SQRT
%right      EXP

%type<val> expression
%type<val> term
%type<val> mod
%type<val> negate
%type<val> exponent
%type<val> factor

%%

calculation: 
	       | calculation line
           ;

line:        NL
           | expression NL            { printf("\t= %f\n\n", $1);}
           | QUIT NL                  { exit(0); }
           ;

expression:  expression PLUS term     { $$ = $1 + $3; }
           | expression MINUS term    { $$ = $1 - $3; }
	       | term                     { $$ = $1; }
           ;

term:        term MODULUS mod         { $$ = (int)$1 % (int)$3; }
           | mod                      { $$ = $1; }
           ;

mod:         mod MULTIPLY negate      { $$ = $1 * $3; }
           | mod DIVIDE negate        { $$ = $1 / $3; }
           | negate                   { $$ = $1; }
           ;

negate:      MINUS exponent           { $$ = -$2; }
           | exponent                 { $$ = $1; }
           ;

exponent:    exponent EXP factor      { $$ = pow($1, $3); }
           | factor                   { $$ = $1; }
           ;

factor:      NUM                      { $$ = $1; }
           | LPAREN expression RPAREN { $$ = $2; }
           | SIN expression           { $$ = sin($2); }
           | COS expression           { $$ = cos($2); }
		   | TAN expression           { $$ = tan($2); }
		   | DEG expression           { $$ = (3.14159265/180.0)*$2; }
           | ASIN expression          { $$ = asin($2); }
           | ACOS expression          { $$ = acos($2); }
           | ATAN expression          { $$ = atan($2); }
           | COSH expression          { $$ = cosh($2); }
           | SINH expression          { $$ = sinh($2); }
           | TANH expression          { $$ = tanh($2); }
           | ACOSH expression         { $$ = acosh($2); }
           | ASINH expression         { $$ = asinh($2); }
           | ATANH expression         { $$ = atanh($2); }
           | EXP expression           { $$ = exp($2); }
           | LOG expression           { $$ = log($2); }
           | LOG10 expression         { $$ = log10($2); }
           | SQRT expression          { $$ = sqrt($2); }
		   ;

%%

int main() {
	printf("ALGEBRAIC2\nKyle Alexander Buan (tar.shoduze@gmail.com)\nMarch 16, 2016\n\n");

	yyin = stdin;

	do { 
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "\tSyntax eLOL\n\n");
}