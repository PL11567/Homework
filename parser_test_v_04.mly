%{
open Printf
open Lexing
%}


%token <int>INTEIRO
%token <string>REAL
%token <string>FICHEIRO
%token <string>DATASIMPLES
%token <string>STRINGS
%token <char>DOT
%token <char>TWODOTS
%token <char>ENTER  

%start inteiros
%type <unit> inteiros
%%


inteiros:
| INTEIRO DOT STRINGS ENTER ENTER STRINGS TWODOTS STRINGS ENTER { Printf.printf "%d %c %s %c %c" $1 $2 $3 $4 $5  } 
| REAL { Printf.printf "Real"; }
| DOT { Printf.printf "DOT"; }
| TWODOTS {Printf.printf "TwoDots"; }
| ENTER { Printf.printf "Enter\n"; }
| FICHEIRO { Printf.printf "Ficheiro"; }
| DATASIMPLES { Printf.printf "DataSimples"; }
| STRINGS { Printf.printf "String"; }
;
%%
