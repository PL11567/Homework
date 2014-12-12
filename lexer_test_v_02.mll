{
	open Printf
	open Lexing
}

(*let id_datas = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['T']['0'-'9']['0'-'9'][':']['0'-'9']['0'-'9']['Z']
let id_datasvazias = ['C']['C']['Y']['Y']['-']['M']['M']['-']['D']['D']['T']['h']['h'][':']['m']['m']['Z']*)

let id_datasimples = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']
let id_strings = ['a'-'z' 'A'-'Z' '_' '\t' ' ' ',' '(' ')' '/''0'-'9']
let id_dot = ['.']
let id_twodots = [':']
let id_enter = '\n' | "\r\n"
let id_inteiro = ['0'-'9']+
let id_real =  ['0'-'9']+'.'['0'-'9']+
let id_ficheiro = ['a'-'z']+'_'['0'-'9']['0'-'9']['0'-'9']['0'-'9']['0'-'9']['0'-'9']['0'-'9']['0'-'9']'.'['l''o''g']


rule logs_read = parse
 
  (*| id_datas as data
  	{ printf "Data correcta: %s" data;
  	  logs_read lexbuf
	}
	
  | id_datasvazias as datas_vazias
  	{ printf "Standart encontrado: %s" datas_vazias;
	  logs_read lexbuf
	}*)
  
  | id_datasimples as data_simples
  	{ printf "Data Simples -> %s" data_simples;
	  logs_read lexbuf
	}

  | id_strings as strings
  	{ printf "%c" strings;
	  logs_read lexbuf
	}

 | id_dot as dot
  	{ printf "Dot -> %c" dot;
	  logs_read lexbuf
	}	
 | id_twodots as twodots
  	{ printf "TwoDots -> %c" twodots;
	  logs_read lexbuf
	}


 | id_enter 
  	{ printf "\n";
	  logs_read lexbuf
	}
 | id_inteiro as inteiro
  	{ printf "Inteiro -> %s" inteiro;
	  logs_read lexbuf
	}
 | id_real as real
  	{ printf "Real -> %s" real;
	  logs_read lexbuf
	}
 | id_ficheiro as ficheiro
  	{ printf "Ficheiro -> %s" ficheiro;
	  logs_read lexbuf
	}

  | _ 
  	{ 
	  logs_read lexbuf
	}
  | eof		
	{ }

{
  let main () =
    let cin =
    
      if Array.length Sys.argv > 1
      then open_in Sys.argv.(1)
      else stdin
    in
    let lexbuf = Lexing.from_channel cin in
    logs_read lexbuf

  let _ = Printexc.print main ()
}
