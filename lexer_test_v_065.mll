{
	open Parser
	open Printf
	open Lexing




let create_hashtable size init =
    let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
    tbl

let string_table = create_hashtable 57 
		[  	
		  ("Form", FORM "Form"); 
		  ("Prepared by (full name)", PREP "Prepared by (full name)" ); 
		  ("Date Prepared", DATPREP "Date Prepared"); 
		  ("Report Type", RP "Report Type"); 
		  ("If Update", IF "If Update"); 
		  ("Previous Site Log", LOG "Previous Site Log"); 
		  ("Modified/Added Sections", MODSEC "Modified/Added Sections");
		  ("Site Identification of the GNSS Monument",SITEIDENT);
		  ("Site Name", SITENAME);
		  ("Four Character ID ", FCHID);
		  ("Monument Inscription ", MNMTINSC);
		  ("IERS DOMES Number ", IRESDNUM);
		  ("CDP Number ", CDPNUM);
		  ("Monument Description ", MNMTDESC);
		  ("Height of the Monument ", HGHTMNMT);
		  ("Monument Foundation ", MNMTFND);
		  ("Foundation Depth ", FNDDPTH);
		  ("Marker Description ", MRKRDESC);
          ("Date Installed ", DATINST);
          ("Geologic Characteristic ", GLCCHCTSC);
          ("Bedrock Type ", BDRCKTYP);
          ("Bedrock Condition ", BDRCKCOND);
          ("Fracture Spacing ", FRACTSPAC);
          ("Fault zones nearby ", FAULTZN);
          ("Distance/activity ", DSTACT);
          ("Additional Information ", ADDINFO);
          ("Site Location Information", GNSSRINF);
		  ("City or Town ", CITY);
          ("State or Province ", STATE);
          ("Country ", COUNTRY);
          ("Tectonic Plate ", TECTPLT);
          ("Approximate Position (ITRF)", POSIRTF);
          ("X coordinate (m) ", XCOORD);
		  ("Y coordinate (m) ", YCOORD);
		  ("Z coordinate (m) ", ZCOORD);
		  ("Elevation (m,ellips.) ", ELEV);

		]


}




(*let id_datas = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['T']['0'-'9']['0'-'9'][':']['0'-'9']['0'-'9']['Z']*)
(*let id_datasvazias = ['C']['C']['Y']['Y']['-']['M']['M']['-']['D']['D']['T']['h']['h'][':']['m']['m']['Z']*)

let id_menos = ['-']
let id_mais = ['+']
let id_datasimples = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']id_menos['0'-'9']['0'-'9']id_menos['0'-'9']['0'-'9']
let id_dot = ['.']
let id_twodots = [':']
let id_enter = ['\n']*
let id_espaco = [' ']+
let id_slash = ['/']
let id_blank = ['\n' '\t' ' ']
let id_strings = ['a'-'z' 'A'-'Z' '_' ',' '(' ')' ' ' '/' ]+
let id_stname = id_strings id_twodots id_slash id_slash id_strings id_dot id_strings id_dot id_strings id_dot id_strings id_slash id_strings id_slash id_strings id_slash id_strings id_slash id_strings id_dot id_strings
let id_inteiro = ['0'-'9']+
let id_fracspacing = (id_inteiro id_menos id_inteiro)
let id_real =  id_inteiro id_dot id_inteiro
let id_coordenada = (id_mais id_real) | (id_menos id_real)
let id_ficheiro =  (id_strings id_inteiro+ id_dot 'l''o''g') |  ('(''s''s''s''s''_''c''c''y''y''m''m''d''d' '.' 'l''o''g'')')
let id_latlong = ('L''a''t''i''t''u''d''e'' ''(''N'' ''i''s'' '(id_mais)')'' ') | ('L''o''n''g''i''t''u''d''e'' ''(''E'' ''i''s'' '(id_mais)')'' ')


rule tokenize = parse
  
 | id_inteiro as inteiro { INTEIRO (int_of_string inteiro) }
 | id_real as real { REAL (float_of_string real)}
 | id_dot as dot { DOT (dot)}
 | id_fracspacing as fracspacing { FRACSPACING (fracspacing)}
 | id_latlong as latlong { LATLONG (latlong)}
 | (id_twodots as twodots) { TWODOTS (twodots)}
 | id_enter as enter { ENTER (enter) }	
 | id_ficheiro as ficheiro { FICHEIRO (ficheiro) }
 | id_datasimples as datasimples { DATASIMPLES (datasimples) }
 | (id_stname as stname) { STNAME (stname) }
 | id_coordenada as coordenada { COORDENADA (coordenada) }
 | id_blank* as blank {BLANK blank}
 | id_blank* (id_strings as word) id_blank* 
  		{ 

  			try (let res =  Hashtbl.find string_table word  in res)

		  	with Not_found -> STRINGS word
  		}
 | _ { tokenize lexbuf }
 | eof { raise End_of_file }


{

	    
	    
}
