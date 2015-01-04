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
%token <string>NSITE
%token <string>FORM PREP DATPREP RP IF LOG MODSEC
%token <string>SITEIDENT SITENAME FCHID MNMTINSC IRESDNUM CDPNUM MNMTDESC HGHTMNMT MNMTFND FNDDPTH 
%token <string>MRKRDESC DATINST GLCCHCTSC BDRCKTYP BDRCKCOND FRACTSPAC FAULTZN DSTACT ADDINFO GNSSTRINF CITY STATE COUNTRY TECTPLT 
%token <string>POSIRTF XCOORD YCOORD ZCOORD ELEV
%token <string>GNSSRCVINF RCVTYP SATSYS SERIALN FIRMVER ELEVCUTOFF DATREM TEMPSTAB 
%token <string>GNSSANTINF ANTTYP ANTREFPNT MARKUP MARKNORTH MARKEAST ALIGNTRUE ANTRNDTYP RNDSERIALN ANTCABTYP ANTCABLENGTH

%type <unit> init
%start init

%%

init: 
 STRINGS ENTER STRINGS ENTER STRINGS TWODOTS ENTER STNAME ENTER 
	{ Printf.printf "%s %s %s %s %s %c %s %s %s " $1 $2 $3 $4 $5 $6 $7 $8 $9; flush stdout}

/************************** FORM *************************************/

| INTEIRO DOT FORM 
	{ Printf.printf "%i %c %s " $1 $2 $3 ; flush stdout}
| ENTER 
	{ Printf.printf "%s" $1 ; flush stdout}
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


/*********** Site Identification of the GNSS Monument *****************/


| INTEIRO DOT SITEIDENT ENTER
	{ Printf.printf "%i %c %s %s" $1 $2 $3 $4; flush stdout}
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
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
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
	
/************** Site Location Information *****************************/

| INTEIRO DOT GNSSTRINF ENTER
	{ Printf.printf "%i %c %s %s" $1 $2 $3 $4; flush stdout}
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
	{ Printf.printf "%s %c %s %c %f %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ADDINFO TWODOTS ENTER 
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}

/************** GNSS Receiver Information  ************************* */

| INTEIRO DOT GNSSRCVINF ENTER
	{ Printf.printf "%i %c %s %s" $1 $2 $3 $4; flush stdout}
| REAL RCVTYP TWODOTS STRINGS INTEIRO STRINGS ENTER
	{ Printf.printf "%f %s %c %s %i %s %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| SATSYS TWODOTS STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s" $1 $2 $3 $4 $5; flush stdout}
| SERIALN TWODOTS INTEIRO ENTER
	{ Printf.printf "%s %c %i %s" $1 $2 $3 $4; flush stdout}
| FIRMVER TWODOTS STRINGS INTEIRO STRINGS ENTER
	{ Printf.printf "%s %c %s %i %s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ELEVCUTOFF TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DATINST TWODOTS DATAS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DATREM TWODOTS STRINGS STRINGS STRINGS TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s %c %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| STRINGS DOT TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %c %s %s" $1 $2 $3 $4 $5; flush stdout}
| ADDINFO TWODOTS STRINGS ENTER 
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| INTEIRO DOT STRINGS TWODOTS STRINGS INTEIRO STRINGS DOT STRINGS STRINGS ENTER
	{Printf.printf "%i %c %s %c %s %i %s %c %s %s %s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11; flush stdout}
| SATSYS TWODOTS STRINGS STRINGS ENTER
	{Printf.printf "%s %c %s %s %s" $1 $2 $3 $4 $5; flush stdout}
| SERIALN TWODOTS STRINGS INTEIRO STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%s %c %s %i %s %i %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| FIRMVER TWODOTS STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%s %c %s %i %s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ELEVCUTOFF TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DATINST TWODOTS STRINGS STRINGS STRINGS TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s %s %c %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| DATREM TWODOTS STRINGS STRINGS STRINGS TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s %s %c %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| STRINGS DOT TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %c %s %s" $1 $2 $3 $4 $5; flush stdout}
| ADDINFO TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}


/************** GNSS Antenna Information  ************************* */

| INTEIRO DOT GNSSANTINF ENTER
	{Printf.printf "%i %c %s %s" $1 $2 $3 $4; flush stdout}
| REAL ANTTYP TWODOTS STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%f %s %c %s %i %s %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
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
| DATINST TWODOTS DATASIMPLES STRINGS INTEIRO TWODOTS INTEIRO ENTER
	{ Printf.printf "%s %c %s %s %i %c %i %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| DATREM TWODOTS STRINGS STRINGS STRINGS TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s %c %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| ADDINFO TWODOTS ENTER
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}	
	
/*******************   GNSS Antenna Information **********************/

| INTEIRO DOT STRINGS TWODOTS STRINGS INTEIRO STRINGS DOT STRINGS STRINGS ENTER
	{ Printf.printf "%i %c %s %c %s %i %s %c %s %s %s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11; flush stdout}
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
| RNDSERIALN TWODOTS ENTER   
	{ Printf.printf "%s %c %s " $1 $2 $3; flush stdout}
| ANTCABTYP TWODOTS STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s "$1 $2 $3 $4 $5;  flush stdout}
| ANTCABLENGTH TWODOTS STRINGS ENTER
	{ Printf.printf " %s %c %s %s" $1 $2 $3 $4; flush stdout}	
| DATINST TWODOTS STRINGS STRINGS STRINGS TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s %c %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| DATREM TWODOTS STRINGS STRINGS STRINGS TWODOTS STRINGS ENTER	
	{ Printf.printf "%s %c %s %s %s %c %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| ADDINFO TWODOTS STRINGS ENTER
{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}


%%
