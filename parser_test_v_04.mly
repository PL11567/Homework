%{
open Printf
open Lexing
%}


%token <int>INTEIRO
%token <string>REAL
%token <string>FICHEIRO
%token <string>DATASIMPLES
%token <string>STRING
%token <char>DOT
%token <char>TWODOTS
%token <char>ENTER  

%start secform
%type <unit> secform
%%


secform:
| INTEIRO DOT STRING ENTER ENTER STRING TWODOTS STRING ENTER STRING TWODOTS STRING
	{ Printf.printf "%d %c %s %c %c %s %c %s" $1 $2 $3 $4 $5 $6 $7 $8 ;} 
| REAL { Printf.printf "Real"; }
| DOT { Printf.printf "DOT"; }
| TWODOTS {Printf.printf "TwoDots"; }
| ENTER { Printf.printf "Enter\n"; }
| FICHEIRO { Printf.printf "Ficheiro"; }
| DATASIMPLES { Printf.printf "DataSimples"; }
| STRING { Printf.printf "String"; }
;
%%
