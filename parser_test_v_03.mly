%{
open Printf
%}


%token <string>INTEIRO
%token <string>REAL
%token <string>FICHEIRO
%token <string>DATASIMPLES
%token <string>STRINGS
%token DOT
%token TWODOTS
%token ENTER  

%start inteiros
%type <unit> inteiros
%%

inteiros:
  INTEIRO { Printf.printf "Inteiro"; }
| REAL { Printf.printf "Real"; }
| DOT { Printf.printf "DOT"; }
| TWODOTS {Printf.printf "TwoDots"; }
| ENTER { Printf.printf "Enter\n"; }
| FICHEIRO { Printf.printf "Ficheiro"; }
| DATASIMPLES { Printf.printf "DataSimples"; }
| STRINGS { Printf.printf "String"; }
;
%%
