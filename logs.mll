{
	open Printf
	open Lexing
}

let id_datas = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['T']['0'-'9']['0'-'9'][':']['0'-'9']['0'-'9']['Z']
let id_datasvazias = ['C']['C']['Y']['Y']['-']['M']['M']['-']['D']['D']['T']['h']['h'][':']['m']['m']['Z']
let id_dataserradas = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['T']['0'-'9']['0'-'9'][':']['0'-'9']['0'-'9']['z']

rule logs_read = parse
 
  | id_datas as data
  	{ printf "Data correcta: %s\n" data;
  	  logs_read lexbuf
	}
	
  | id_datasvazias as datas_vazias
  	{ printf "Standart encontrado: %s\n" datas_vazias;
	  logs_read lexbuf
	}
  
  | id_dataserradas as datas_erradas
  	{ printf "Data com Erro: %s\n" datas_erradas;
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
