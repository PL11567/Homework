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
| INTEIRO DOT STRING ENTER ENTER STRING TWODOTS STRING
	{ Printf.printf "%d%c %s %c %c %s %c %s" $1 $2 $3 $4 $5 $6 $7 $8 ;}
	
| ENTER STRING TWODOTS STRING DATASIMPLES ENTER
	{ Printf.printf "%c %s %c %s %s %c" $1 $2 $3 $4 $5 $6;}

| STRING TWODOTS STRING ENTER     
	{ Printf.printf "%s %c %s %c" $1 $2 $3 $4;}

| STRING TWODOTS STRING ENTER STRING TWODOTS ENTER
	{ Printf.printf "%s %c %s %c %s %c %c" $1 $2 $3 $4 $5 $6 $7;}

| STRING TWODOTS FICHEIRO ENTER STRING TWODOTS 
	{ Printf.printf "%s %c %s %c %s %c" $1 $2 $3 $4 $5 $6;}

;
%%
