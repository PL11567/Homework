%{
open Printf
open Lexing
%}


%token <int>INTEIRO
%token <float>REAL
%token <string>FICHEIRO
%token <string>DATAS
%token <string>DATASIMPLES
%token <string>DATASVAZIAS
%token <string>STRINGS
%token <char>DOT
%token <char>TWODOTS
%token <string>ENTER 
%token <string>KEYWORD
%token <string>STNAME
%token <string>COORDENADA
%token <string>LATLONG
%token <string>FRACSPACING
%token <string>FORM PREP DATPREP RP IF LOG MODSEC
%token <string>SITEIDENT SITENAME FCHID MNMTINSC IRESDNUM CDPNUM MNMTDESC HGHTMNMT MNMTFND FNDDPTH 
%token <string>MRKRDESC DATINST GLCCHCTSC BDRCKTYP BDRCKCOND FRACTSPAC FAULTZN DSTACT ADDINFO GNSSTRINF CITY STATE COUNTRY TECTPLT 
%token <string>POSIRTF XCOORD YCOORD ZCOORD ELEV
%token <string>GNSSRCVINF RCVTYP SATSYS SERIALN FIRMVER ELEVCUTOFF DATREM TEMPSTAB 
%token <string>GNSSANTINF ANTTYP ANTREFPNT MARKUP MARKNORTH MARKEAST ALIGNTRUE ANTRNDTYP RNDSERIALN ANTCABTYP ANTCABLENGTH

%start init
%type <unit> init
%%

init: 
  INTEIRO { Printf.printf "INTEIRO"; flush stdout}
| DOT { Printf.printf " . "; flush stdout}
| ENTER { Printf.printf "ENTER\n"; flush stdout}
| TWODOTS { Printf.printf "%c" $1; flush stdout }
| DATASIMPLES {Printf.printf "%s" $1; flush stdout }
| DATAS {Printf.printf "%s" $1; flush stdout }
| DATASVAZIAS {Printf.printf "%s" $1; flush stdout }
| STRINGS { Printf.printf "STRING "; flush stdout }
| FICHEIRO { Printf.printf "FICHEIRO"; flush stdout }
| REAL { Printf.printf "%f" $1; flush stdout }
| STNAME {Printf.printf "STNAME "  ;    flush stdout}
| FORM { Printf.printf "FORM " ; flush stdout }
| PREP { Printf.printf "PREP " ; flush stdout }
| DATPREP { Printf.printf "DATPREP " ; flush stdout }
| RP { Printf.printf "RP "; flush stdout }
| IF { Printf.printf "IF "; flush stdout }
| LOG { Printf.printf "LOG "; flush stdout }
| MODSEC { Printf.printf "MODSEC "; flush stdout }
| SITEIDENT {Printf.printf "%s" $1; flush stdout }
| SITENAME {Printf.printf "%s" $1; flush stdout }
| FCHID {Printf.printf "%s" $1; flush stdout }
| MNMTINSC {Printf.printf "%s" $1; flush stdout }
| IRESDNUM {Printf.printf "%s" $1; flush stdout }
| CDPNUM {Printf.printf "%s" $1; flush stdout }
| MNMTDESC {Printf.printf "%s" $1; flush stdout }
| HGHTMNMT {Printf.printf "%s" $1; flush stdout }
| MNMTFND {Printf.printf "%s" $1; flush stdout }
| FNDDPTH {Printf.printf "%s" $1; flush stdout } 
| MRKRDESC {Printf.printf "%s" $1; flush stdout }
| DATINST {Printf.printf "%s" $1; flush stdout } 
| GLCCHCTSC {Printf.printf "%s" $1; flush stdout }
| BDRCKTYP {Printf.printf "%s" $1; flush stdout }
| BDRCKCOND {Printf.printf "%s" $1; flush stdout }
| FRACTSPAC {Printf.printf "%s" $1; flush stdout }
| FAULTZN {Printf.printf "%s" $1; flush stdout }
| DSTACT {Printf.printf "%s" $1; flush stdout }
| ADDINFO {Printf.printf "%s" $1; flush stdout }
| GNSSTRINF {Printf.printf "%s" $1; flush stdout }
| CITY {Printf.printf "%s" $1; flush stdout }
| STATE {Printf.printf "%s" $1; flush stdout } 
| COUNTRY {Printf.printf "%s" $1; flush stdout }
| TECTPLT {Printf.printf "%s" $1; flush stdout }
| POSIRTF {Printf.printf "%s" $1; flush stdout }
| XCOORD {Printf.printf "%s" $1; flush stdout }
| YCOORD {Printf.printf "%s" $1; flush stdout }
| ZCOORD {Printf.printf "%s" $1; flush stdout }
| ELEV {Printf.printf "%s" $1; flush stdout }
| COORDENADA {Printf.printf "COORDENADA" ; flush stdout}
| LATLONG {Printf.printf "LATLONG"; flush stdout}
| FRACSPACING {Printf.printf "FRACSPACING" ; flush stdout}
| GNSSRCVINF {Printf.printf "%s" $1; flush stdout }
| RCVTYP {Printf.printf "%s" $1; flush stdout }
| SATSYS {Printf.printf "%s" $1; flush stdout }
| SERIALN {Printf.printf "%s" $1; flush stdout }
| FIRMVER {Printf.printf "%s" $1; flush stdout }
| ELEVCUTOFF {Printf.printf "%s" $1; flush stdout }
| DATREM {Printf.printf "%s" $1; flush stdout }
| TEMPSTAB {Printf.printf "TEMPSTAB"; flush stdout }
| GNSSANTINF {Printf.printf "%s" $1; flush stdout }
| ANTTYP {Printf.printf "%s" $1; flush stdout }
| ANTREFPNT {Printf.printf "%s" $1; flush stdout }
| MARKUP {Printf.printf "%s" $1; flush stdout }
| MARKNORTH {Printf.printf "%s" $1; flush stdout }
| MARKEAST {Printf.printf "%s" $1; flush stdout }
| ALIGNTRUE {Printf.printf "%s" $1; flush stdout }
| ANTRNDTYP {Printf.printf "%s" $1; flush stdout }
| RNDSERIALN {Printf.printf "%s" $1; flush stdout }
| ANTCABTYP {Printf.printf "%s" $1; flush stdout }
| ANTCABLENGTH {Printf.printf "%s" $1; flush stdout }

%%
