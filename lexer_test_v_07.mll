{
	open Parser
	open Printf
	open Lexing
	open String



let create_hashtable size init =
    let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
    tbl

let string_table = create_hashtable 57 
		[  	
		  ("Form", FORM "Form"); 
		  ("Prepared by (fullname)", PREP "Prepared by (full name)" ); 
		  ("Date Prepared", DATPREP "Date Prepared"); 
		  ("Report Type", RP "Report Type"); 
		  ("If Update", IF "If Update"); 
		  ("Previous Site Log", LOG "Previous Site Log"); 
		  ("Modified/Added Sections", MODSEC "Modified/Added Sections");
		  ("Site Identification of the GNSS Monument",SITEIDENT "Site Identification of the GNSS Monument");
		  ("Site Name", SITENAME "Site Name");
		  ("Four Character ID", FCHID "Four Character ID");
		  ("Monument Inscription", MNMTINSC "Monument Inscription");
		  ("IERS DOMES Number", IRESDNUM "IERS DOMES Number");
		  ("CDP Number", CDPNUM "CDP Number");
		  ("Monument Description", MNMTDESC "Monument Description");
		  ("Height of the Monument", HGHTMNMT "Height of the Monument");
		  ("Monument Foundation", MNMTFND "Monument Foundation");
		  ("Foundation Depth", FNDDPTH "Foundation Depth");
		  ("Marker Description", MRKRDESC "Marker Description");
          ("Date Installed", DATINST "Date Installed");
          ("Geologic Characteristic", GLCCHCTSC "Geologic Characteristic");
          ("Bedrock Type", BDRCKTYP "Bedrock Type");
          ("Bedrock Condition", BDRCKCOND "Bedrock Condition");
          ("Fracture Spacing", FRACTSPAC "Fracture Spacing");
          ("Fault zones nearby", FAULTZN "Fault zones nearby");
          ("Distance/activity", DSTACT "Distance/activity");
          ("Additional Information", ADDINFO "Additional Information");
          ("Site Location Information", GNSSTRINF "Site Location Information");
		  ("City or Town", CITY "City or Town");
          ("State or Province", STATE "State or Province");
          ("Country", COUNTRY "Country");
          ("Tectonic Plate", TECTPLT "Tectonic Plate");
          ("Approximate Position (ITRF)", POSIRTF "Approximate Position (ITRF)");
          ("X coordinate (m)", XCOORD "X coordinate (m)");
		  ("Y coordinate (m)", YCOORD "Y coordinate (m)");
		  ("Z coordinate (m)", ZCOORD "Z coordinate (m)");
		  ("Elevation (m,ellips.)", ELEV "Elevation (m,ellips.)");
		  ("GNSS Receiver Information", GNSSRCVINF "GNSS Receiver Information");
		  ("Receiver Type", RCVTYP "Receiver Type");
		  ("Satellite System", SATSYS "Satellite System");
		  ("Serial Number", SERIALN "Serial Number");
		  ("Firmware Version", FIRMVER "Firmware Version");
		  ("Elevation Cutoff Setting", ELEVCUTOFF "Elevation Cutoff Setting");
		  ("Date Removed", DATREM "Date Removed");
		  ("Temperature Stabiliz.", TEMPSTAB "Temperature Stabiliz.");
		  ("GNSS Antenna Information", GNSSANTINF "GNSS Antenna Information");
		  ("Antenna Type", ANTTYP "Antenna Type");
		  ("Antenna Reference Point", ANTREFPNT "Antenna Reference Point");
		  ("Marker->ARP Up Ecc. (m)", MARKUP "Marker->ARP Up Ecc. (m)");
		  ("Marker->ARP North Ecc(m)", MARKNORTH "Marker->ARP North Ecc(m)");
		  ("Marker->ARP East Ecc(m)", MARKEAST "Marker->ARP East Ecc(m)");
		  ("Alignment from True N", ALIGNTRUE "Alignment from True N");
		  ("Antenna Radome Type", ANTRNDTYP "Antenna Radome Type");
		  ("Radome Serial Number", RNDSERIALN "Radome Serial Number");
		  ("Antenna Cable Type", ANTCABTYP "Antenna Cable Type");
		  ("Antenna Cable Length", ANTCABLENGTH "Antenna Cable Length");
		]


}




let id_datas = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['-']['0'-'9']['0'-'9']['T']['0'-'9']['0'-'9'][':']['0'-'9']['0'-'9'][' ']*['Z''z']
let id_datasvazias = ['C']['C']['Y']['Y']['-']['M']['M']['-']['D']['D']['T']['h']['h'][':']['m']['m']['Z']

let id_menos = ['-']
let id_mais = ['+']
let id_datasimples = ['0'-'9']['0'-'9']['0'-'9']['0'-'9']id_menos['0'-'9']['0'-'9']id_menos['0'-'9']['0'-'9']
let id_dot = ['.']
let id_twodots = [':']
let id_enter = ['\n']*
let id_espaco = [' ']+
let id_slash = ['/']
let id_strings = ['a'-'z' 'A'-'Z' '_' ',' '(' ')' ' ' '/']*
let id_stname = id_strings id_twodots id_slash id_slash id_strings id_dot id_strings id_dot id_strings id_dot id_strings id_slash id_strings id_slash id_strings id_slash id_strings id_slash id_strings id_dot id_strings
let id_inteiro = ['0'-'9']+
let id_fracspacing = (id_inteiro id_menos id_inteiro)
let id_real =  (id_inteiro id_dot id_inteiro)
let id_coordenada = (id_mais id_real) | (id_menos id_real)
let id_ficheiro =  (id_strings id_inteiro+ id_dot 'l''o''g') |  ('(''s''s''s''s''_''c''c''y''y''m''m''d''d' '.' 'l''o''g'')')
let id_latlong = ('L''a''t''i''t''u''d''e'' ''(''N'' ''i''s'' '(id_mais)')'' ') | ('L''o''n''g''i''t''u''d''e'' ''(''E'' ''i''s'' '(id_mais)')'' ')
let id_tempstab = ('T''e''m''p''e''r''a''t''u''r''e'' ''S''t''a''b''i''l''i''z'(id_dot))
let id_markup = ('M''a''r''k''e''r''-''>''A''R''P'' ''U''p'' ''E''c''c'(id_dot)' ''(''m'')')
let id_marknorth = ('M''a''r''k''e''r''-''>''A''R''P'' ''N''o''r''t''h'' ''E''c''c''(''m'')')
let id_markeast = ('M''a''r''k''e''r''-''>''A''R''P'' ''E''a''s''t'' ''E''c''c''(''m'')')
let id_blank = [ '\t' ' ']

rule tokenize = parse
  
 | id_inteiro as inteiro { INTEIRO (int_of_string inteiro) }
 | id_real as real { REAL (float_of_string real)}
 | id_dot as dot { DOT (dot)}
 | id_fracspacing as fracspacing { FRACSPACING (fracspacing)}
 | id_latlong as latlong { LATLONG (latlong)}
 | id_tempstab as tempstab { TEMPSTAB (tempstab) }
 | id_markup as markup { MARKUP (markup) }
 | id_marknorth as marknorth { MARKNORTH (marknorth)}
 | id_markeast as markeast { MARKEAST (markeast)}
 | id_blank*(id_twodots as twodots) id_blank* { TWODOTS (twodots)}
 | id_enter as enter { ENTER (enter) }	
 | id_ficheiro as ficheiro { FICHEIRO (ficheiro) }
 | id_datasimples as datasimples { DATASIMPLES (datasimples) }
 | (id_stname as stname) { STNAME (stname) }
 | id_coordenada as coordenada { COORDENADA (coordenada) }
 | id_datasvazias as datasvazias { DATASVAZIAS (datasvazias)}
 | id_datas as datas {DATAS (datas)}
 | id_blank *(id_strings as word) id_blank *
  		{ 

  			let word_no_spaces = String.trim word in 
  			 
  			try (let res =  Hashtbl.find string_table word_no_spaces in res)

		  	with Not_found -> STRINGS word
  		}
 | _ { tokenize lexbuf }
 | eof { raise End_of_file }


{

	    
	    
}
