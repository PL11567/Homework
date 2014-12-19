%{
open Printf
open Lexing
%}


%token <int>INTEIRO
%token <float>REAL
%token <string>FICHEIRO
%token <string>DATASIMPLES
%token <string>STRINGS
%token <char>DOT
%token <char>TWODOTS
%token <string>ENTER 
%token <string>KEYWORD
%token <string>STNAME
%token <string>COORDENADA
%token <string>LATLONG
%token <string>FRACSPACING
%token <string>FORM 
%token <string>PREP 
%token <string> BLANK 
%token <string>DATPREP RP IF LOG MODSEC
%token SITEIDENT SITENAME FCHID MNMTINSC IRESDNUM CDPNUM MNMTDESC HGHTMNMT MNMTFND FNDDPTH 
%token MRKRDESC DATINST GLCCHCTSC BDRCKTYP BDRCKCOND FRACTSPAC FAULTZN DSTACT ADDINFO GNSSRINF CITY STATE COUNTRY TECTPLT 
%token POSIRTF XCOORD YCOORD ZCOORD ELEV


%start init
%type <unit> init
%%

init: 
	INTEIRO DOT FORM BLANK 
	{ Printf.printf "%i%c %s %s" $1 $2 $3 $4 }



/*
| INTEIRO { Printf.printf "%i" $1 ; flush stdout }
| DOT { Printf.printf "%c" $1 ; flush stdout }
| STRINGS { Printf.printf "STRINGS " ; flush stdout }
| TWODOTS { Printf.printf "%c" $1  ; flush stdout }
 
*/



%%

