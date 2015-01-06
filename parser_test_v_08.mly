%{
open Printf
open Lexing
let parse_error s = print_endline s;;
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
%token <string>NSITE
%token <string>FORM
%token <string>PREP
%token <string>DATPREP
%token <string>RP
%token <string>IF
%token <string>LOG
%token <string>MODSEC
%token <string>SITEIDENT
%token <string>SITENAME
%token <string>FCHID
%token <string>MNMTINSC
%token <string>IRESDNUM
%token <string>CDPNUM
%token <string>MNMTDESC
%token <string>HGHTMNMT
%token <string>MNMTFND
%token <string>FNDDPTH 
%token <string>MRKRDESC
%token <string>DATINST
%token <string>GLCCHCTSC
%token <string>BDRCKTYP
%token <string>BDRCKCOND
%token <string>FRACTSPAC
%token <string>FAULTZN
%token <string>DSTACT
%token <string>ADDINFO
%token <string>GNSSTRINF
%token <string>CITY
%token <string>STATE
%token <string>COUNTRY
%token <string>TECTPLT 
%token <string>POSIRTF
%token <string>XCOORD
%token <string>YCOORD
%token <string>ZCOORD
%token <string>ELEV
%token <string>GNSSRCVINF
%token <string>RCVTYP
%token <string>SATSYS
%token <string>SERIALN
%token <string>FIRMVER
%token <string>ELEVCUTOFF
%token <string>DATREM
%token <string>TEMPSTAB 
%token <string>GNSSANTINF
%token <string>ANTTYP
%token <string>ANTREFPNT
%token <string>MARKUP
%token <string>MARKNORTH 
%token <string>MARKEAST
%token <string>ALIGNTRUE
%token <string>ANTRNDTYP
%token <string>RNDSERIALN 
%token <string>ANTCABTYP
%token <string>ANTCABLENGTH

%type <unit> init
%start init

%%

init:
| header init{}
| secform {}
| secsite {}
| siteloc {}
| gnss_rec_info {}
| gnss_ant_info {}



/************************* CABEÇALHO **********************************/

header:
	STRINGS ENTER STRINGS ENTER STRINGS TWODOTS ENTER STNAME ENTER 
	{ Printf.printf "%s %s %s %s %s %c %s %s %s" $1 $2 $3 $4 $5 $6 $7 $8 $9; flush stdout}
;
/************************** 0 FORM ************************************/

secform:

| INTEIRO DOT FORM ENTER
	{ Printf.printf "%i%c %s %s" $1 $2 $3 $4 ; flush stdout}
| STRINGS TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DATPREP TWODOTS DATASIMPLES ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
|  RP TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
|  IF TWODOTS ENTER
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
|  LOG TWODOTS FICHEIRO ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| MODSEC TWODOTS STRINGS DOT STRINGS DOT STRINGS DOT DOT DOT STRINGS ENTER 
	{ Printf.printf "%s%c%s%c%s %c%s%c%c%c%s%s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12; flush stdout}

;
/*********** 1 Site Identification of the GNSS Monument ***************/

secsite:

| INTEIRO DOT SITEIDENT ENTER
	{ Printf.printf "%i%c %s %s" $1 $2 $3 $4; flush stdout}
| SITENAME TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| FCHID TWODOTS STRINGS ENTER 
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| MNMTINSC TWODOTS ENTER
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| IRESDNUM TWODOTS INTEIRO STRINGS INTEIRO ENTER
	{Printf.printf "%s %c %i%s%i%s" $1 $2 $3 $4 $5 $6; flush stdout}
| CDPNUM TWODOTS STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%s %c %s%i%s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| MNMTDESC TWODOTS STRINGS ENTER	
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| HGHTMNMT TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| MNMTFND TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| FNDDPTH TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| MRKRDESC TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DATINST TWODOTS DATAS ENTER
	{	Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}	
| GLCCHCTSC TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| BDRCKTYP TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| BDRCKCOND TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| FRACTSPAC TWODOTS STRINGS FRACSPACING STRINGS FRACSPACING STRINGS FRACSPACING STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%s %c %s %s%s%s%s%s%s%i%s%s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12; flush stdout}
| FAULTZN TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DSTACT TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| ADDINFO TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
;
/************** 2 Site Location Information ***************************/

siteloc:

| INTEIRO DOT GNSSTRINF ENTER
	{ Printf.printf "%i%c %s %s" $1 $2 $3 $4; flush stdout}
| CITY TWODOTS STRINGS ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| STATE TWODOTS STRINGS ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| COUNTRY TWODOTS STRINGS ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| TECTPLT TWODOTS STRINGS ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| POSIRTF ENTER 
	{ Printf.printf "%s %s" $1 $2; flush stdout}
| XCOORD TWODOTS REAL ENTER 
	{ Printf.printf "%s %c %f %s" $1 $2 $3 $4; flush stdout}
| YCOORD TWODOTS COORDENADA ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| ZCOORD TWODOTS REAL ENTER 
	{ Printf.printf "%s %c %f %s" $1 $2 $3 $4; flush stdout}
| STRINGS STRINGS TWODOTS COORDENADA STRINGS ENTER 
	{ Printf.printf "%s %s %c %s %s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| STRINGS STRINGS TWODOTS COORDENADA ENTER 
	{ Printf.printf "%s %s %c %s %s" $1 $2 $3 $4 $5; flush stdout}
| STRINGS DOT STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %c %s %c %.3f %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ADDINFO TWODOTS ENTER 
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
;

/************** 3 GNSS Receiver Information  **************************/

gnss_rec_info:

| INTEIRO DOT GNSSRCVINF ENTER
	{ Printf.printf "%i%c %s %s" $1 $2 $3 $4; flush stdout}
| REAL RCVTYP TWODOTS STRINGS INTEIRO STRINGS ENTER
	{ Printf.printf "%.1f %s %c %s %i %s %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| SATSYS TWODOTS STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s" $1 $2 $3 $4 $5; flush stdout}
| SERIALN TWODOTS INTEIRO ENTER
	{ Printf.printf "%s %c %i %s" $1 $2 $3 $4; flush stdout}
| FIRMVER TWODOTS STRINGS INTEIRO STRINGS ENTER
	{ Printf.printf "%s %c %s %i %s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ELEVCUTOFF TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DATINST TWODOTS DATAS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}
| DATREM TWODOTS DATAS ENTER
	{	Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}
| STRINGS DOT TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %c %s %s" $1 $2 $3 $4 $5; flush stdout}
| ADDINFO TWODOTS STRINGS ENTER 
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}

/***  3.x  ***/

| INTEIRO DOT STRINGS TWODOTS STRINGS
	{Printf.printf "%i%c%s%c %s" $1 $2 $3 $4 $5; flush stdout}
| SATSYS TWODOTS STRINGS 
	{Printf.printf "%s %c %s" $1 $2 $3 ; flush stdout}
| SERIALN TWODOTS STRINGS 
	{Printf.printf "%s %c %s" $1 $2 $3 ; flush stdout}
| FIRMVER TWODOTS STRINGS 
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| ELEVCUTOFF TWODOTS STRINGS 
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| DATINST TWODOTS DATAS
	{ Printf.printf "%s %c %s" $1 $2 (String.uppercase $3); flush stdout}
| DATREM TWODOTS DATAS
	{	Printf.printf "%s %c %s" $1 $2 (String.uppercase $3); flush stdout}
| STRINGS DOT TWODOTS STRINGS
	{Printf.printf "%s %c %c %s" $1 $2 $3 $4; flush stdout}
| ADDINFO TWODOTS STRINGS
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
;

/************** 4 GNSS Antenna Information  ***************************/

gnss_ant_info:

| INTEIRO DOT GNSSANTINF ENTER
	{Printf.printf "%i%c %s %s" $1 $2 $3 $4; flush stdout}
| REAL ANTTYP TWODOTS STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%.1f %s %c %s %i %s %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| SERIALN TWODOTS ENTER
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| ANTREFPNT TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| STRINGS STRINGS DOT STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %s %c %s %c %f %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| STRINGS STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %s %c %f %s" $1 $2 $3 $4 $5; flush stdout}
| STRINGS STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %s %c %f %s" $1 $2 $3 $4 $5; flush stdout}
| ALIGNTRUE TWODOTS REAL ENTER
	{ Printf.printf "%s %c %f %s" $1 $2 $3 $4; flush stdout}
| ANTRNDTYP TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| RNDSERIALN TWODOTS ENTER 
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| ANTCABTYP TWODOTS ENTER
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| ANTCABLENGTH TWODOTS INTEIRO STRINGS ENTER
	{ Printf.printf "%s %c %i %s %s" $1 $2 $3 $4 $5; flush stdout}
| DATINST TWODOTS DATAS ENTER
	{	Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}
| DATREM TWODOTS DATAS ENTER
	{	Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}
| ADDINFO TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}	
	
/***   4.x  ***/

| INTEIRO DOT STRINGS TWODOTS STRINGS INTEIRO STRINGS DOT STRINGS STRINGS ENTER
	{ Printf.printf "%i%c %s %c %s %i %s %c %s %s %s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11; flush stdout}
| SERIALN TWODOTS STRINGS INTEIRO STRINGS INTEIRO STRINGS ENTER
	{ Printf.printf "%s %c %s %i %s %i %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| ANTREFPNT TWODOTS STRINGS STRINGS DOT STRINGS STRINGS DOT STRINGS ENTER
	{ Printf.printf "%s %c %s %s %c %s %s %c %s %s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10; flush stdout}
| STRINGS STRINGS DOT STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %s %c %s %c %f %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| STRINGS STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %s %c %f %s" $1 $2 $3 $4 $5; flush stdout}
| STRINGS STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %s %c %f %s" $1 $2 $3 $4 $5; flush stdout}
| ALIGNTRUE TWODOTS STRINGS STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ANTRNDTYP TWODOTS STRINGS DOT STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %c %s %s %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| RNDSERIALN TWODOTS STRINGS
	{ Printf.printf "%s %c %s " $1 $2 $3; flush stdout}
| ANTCABTYP TWODOTS STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s "$1 $2 $3 $4 $5;  flush stdout}
| ANTCABLENGTH TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}	
| DATINST TWODOTS DATAS
	{	Printf.printf "%s %c %s" $1 $2 (String.uppercase $3); flush stdout}
| DATREM TWODOTS DATAS
	{	Printf.printf "%s %c %s" $1 $2 (String.uppercase $3); flush stdout}
| ADDINFO TWODOTS STRINGS
{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
;
