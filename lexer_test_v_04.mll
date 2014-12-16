{
	open Printf
	open Lexing
	open Parser

}

(*let id_datas = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['T']['0'-'9']['0'-'9'][':']['0'-'9']['0'-'9']['Z']*)
(*let id_datasvazias = ['C']['C']['Y']['Y']['-']['M']['M']['-']['D']['D']['T']['h']['h'][':']['m']['m']['Z']*)


let id_datasimples = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']
let id_strings = ['a'-'z' 'A'-'Z' '\t' ' ' ',' '(' ')' '/' '_' ]+
let id_dot = ['.']
let id_twodots = [':']
let id_enter = ['\n']
let id_inteiro = ['0'-'9']+
let id_real =  id_inteiro id_dot id_inteiro 
let id_ficheiro =  id_strings id_inteiro+ id_dot 'l''o''g'

rule token = parse
  
 | id_inteiro as inteiro { INTEIRO (int_of_string inteiro) }
 | id_real as real { REAL (real)}
 | id_dot as dot { DOT (dot)}
 | id_twodots as twodots { TWODOTS (twodots)}
 | id_enter as enter { ENTER (enter) }	
 | id_ficheiro as ficheiro { FICHEIRO (ficheiro) }
 | id_datasimples as datasimples { DATASIMPLES (datasimples) }
 | id_strings as strings { STRINGS (strings) }
 | _ 
 	{ token lexbuf }
 | eof { raise End_of_file }
