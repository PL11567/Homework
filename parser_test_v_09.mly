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
%token <string>PREPARED_BY
%token <string>DATE_PREPARED
%token <string>REPORT_TYPE
%token <string>IF_UPDATE
%token <string>PREVIOUS_LOG
%token <string>MODIFIED_SEC
%token <string>SITE_IDENTIFICATION
%token <string>SITE_NAME
%token <string>FOUR_CHARATER_ID
%token <string>MONUMENT_INSCRIPTION
%token <string>IERS
%token <string>CDP_NUMBER
%token <string>MONUMENT_DESCRIPTION
%token <string>HEIGHT_OF_THE_MONUMENT
%token <string>MONUMENT_FOUNDATION
%token <string>FOUNDATION_DEPTH
%token <string>MARKER_DESCRIPTION
%token <string>DATE_INSTALLED
%token <string>GEOLOGIC_CHARACTERISTIC
%token <string>BEDROCK_TYPE
%token <string>BEDROCK_CONDITION
%token <string>FRACTURE_SPACING
%token <string>FAULT_ZONES_NEARBY
%token <string>DISTANCE_ACTIVITY
%token <string>ADDITIONAL_INFORMATION
%token <string>SITE_LOCATION_INFORMATION
%token <string>CITY_OR_TOWN
%token <string>STATE_OR_PROVINCE
%token <string>COUNTRY
%token <string>TECTONIC_PLATE
%token <string>APPROXIMATE_POSITION
%token <string>X_COORDINATE
%token <string>Y_COORDINATE
%token <string>Z_COORDINATE
%token <string>ELEVATION_CUTOFF_SETTING
%token <string>GNSS_RECEIVER_INFORMATION
%token <string>RECEIVER_TYPE
%token <string>SATELLITE_SYSTEM
%token <string>SERIAL_NUMBER
%token <string>FIRMWARE_VERSION
%token <string>ELEVATION_CUTOFF_SETTING
%token <string>DATE_REMOVED
%token <string>TEMPERATURE_STABILIZ
%token <string>GNSS_ANTENNA_INFORMATION
%token <string>ANTENNA_TYPE
%token <string>ANTENNA_REFERENCE_POINT
%token <string>MARKUP
%token <string>MARKNORTH 
%token <string>MARKEAST
%token <string>ALIGNMENT_FROM_TRUE
%token <string>ANTENNA_RADOME_TYPE
%token <string>RADOME_SERIAL_NUMBER
%token <string>ANTENNA_CABLE_TYPE
%token <string>ANTENNA_CABLE_LENGHT


/* Ponto de entrada da gramática */
%start init

/* Tipo dos valores devolvidos pelo analizador sintático */
%type <unit> init

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
| DATE_PREPARED TWODOTS DATASIMPLES ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| REPORT_TYPE TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| IF_UPDATE TWODOTS ENTER
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| PREVIOUS_LOG TWODOTS FICHEIRO ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| MODIFIED_SEC TWODOTS STRINGS DOT STRINGS DOT STRINGS DOT DOT DOT STRINGS ENTER 
	{ Printf.printf "%s%c%s%c%s %c%s%c%c%c%s%s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12; flush stdout}

;
/*********** 1 Site Identification of the GNSS Monument ***************/

secsite:

| INTEIRO DOT SITE_IDENTIFICATION ENTER
	{ Printf.printf "%i%c %s %s" $1 $2 $3 $4; flush stdout}
| SITE_NAME TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| FOUR_CHARATER_ID TWODOTS STRINGS ENTER 
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| MONUMENT_INSCRIPTION TWODOTS ENTER
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| IERS TWODOTS INTEIRO STRINGS INTEIRO ENTER
	{Printf.printf "%s %c %i%s%i%s" $1 $2 $3 $4 $5 $6; flush stdout}
| CDP_NUMBER TWODOTS STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%s %c %s%i%s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| MONUMENT_DESCRIPTION TWODOTS STRINGS ENTER	
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| HEIGHT_OF_THE_MONUMENT TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| MONUMENT_FOUNDATION TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| FOUNDATION_DEPTH TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| MARKER_DESCRIPTION TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DATE_INSTALLED TWODOTS DATAS ENTER
	{	Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}	
| GEOLOGIC_CHARACTERISTIC TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| BEDROCK_TYPE TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| BEDROCK_CONDITION TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| FRACTURE_SPACING TWODOTS STRINGS FRACSPACING STRINGS FRACSPACING STRINGS FRACSPACING STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%s %c %s %s%s%s%s%s%s%i%s%s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12; flush stdout}
| FAULT_ZONES_NEARBY TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DISTANCE_ACTIVITY TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| ADDITIONAL_INFORMATION TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
;
/************** 2 Site Location Information ***************************/

siteloc:

| INTEIRO DOT SITE_LOCATION_INFORMATION ENTER
	{ Printf.printf "%i%c %s %s" $1 $2 $3 $4; flush stdout}
| CITY_OR_TOWN TWODOTS STRINGS ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| STATE_OR_PROVINCE TWODOTS STRINGS ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| COUNTRY TWODOTS STRINGS ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| TECTONIC_PLATE TWODOTS STRINGS ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| APPROXIMATE_POSITION ENTER 
	{ Printf.printf "%s %s" $1 $2; flush stdout}
| X_COORDINATE TWODOTS REAL ENTER 
	{ Printf.printf "%s %c %f %s" $1 $2 $3 $4; flush stdout}
| Y_COORDINATE TWODOTS COORDENADA ENTER 
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| Z_COORDINATE TWODOTS REAL ENTER 
	{ Printf.printf "%s %c %f %s" $1 $2 $3 $4; flush stdout}
| STRINGS STRINGS TWODOTS COORDENADA STRINGS ENTER 
	{ Printf.printf "%s %s %c %s %s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| STRINGS STRINGS TWODOTS COORDENADA ENTER 
	{ Printf.printf "%s %s %c %s %s" $1 $2 $3 $4 $5; flush stdout}
| STRINGS DOT STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %c %s %c %.3f %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ADDITIONAL_INFORMATION TWODOTS ENTER 
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
;

/************** 3 GNSS Receiver Information  **************************/

gnss_rec_info:

| INTEIRO DOT GNSS_RECEIVER_INFORMATION ENTER
	{ Printf.printf "%i%c %s %s" $1 $2 $3 $4; flush stdout}
| REAL RECEIVER_TYPE TWODOTS STRINGS INTEIRO STRINGS ENTER
	{ Printf.printf "%.1f %s %c %s %i %s %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| SATELLITE_SYSTEM TWODOTS STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s" $1 $2 $3 $4 $5; flush stdout}
| SERIAL_NUMBER TWODOTS INTEIRO ENTER
	{ Printf.printf "%s %c %i %s" $1 $2 $3 $4; flush stdout}
| FIRMWARE_VERSION TWODOTS STRINGS INTEIRO STRINGS ENTER
	{ Printf.printf "%s %c %s %i %s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ELEVATION_CUTOFF_SETTING TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| DATE_INSTALLED TWODOTS DATAS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}
| DATE_REMOVED TWODOTS DATAS ENTER
	{	Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}
| STRINGS DOT TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %c %s %s" $1 $2 $3 $4 $5; flush stdout}
| ADDITIONAL_INFORMATION TWODOTS STRINGS ENTER 
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}

/***  3.x  ***/

| INTEIRO DOT STRINGS TWODOTS STRINGS
	{Printf.printf "%i%c%s%c %s" $1 $2 $3 $4 $5; flush stdout}
| SATELLITE_SYSTEM TWODOTS STRINGS 
	{Printf.printf "%s %c %s" $1 $2 $3 ; flush stdout}
| SERIAL_NUMBER TWODOTS STRINGS 
	{Printf.printf "%s %c %s" $1 $2 $3 ; flush stdout}
| FIRMWARE_VERSION TWODOTS STRINGS 
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| ELEVATION_CUTOFF_SETTING TWODOTS STRINGS 
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| DATE_INSTALLED TWODOTS DATAS
	{Printf.printf "%s %c %s" $1 $2 (String.uppercase $3); flush stdout}
| DATE_REMOVED TWODOTS DATAS
	{Printf.printf "%s %c %s" $1 $2 (String.uppercase $3); flush stdout}
| STRINGS DOT TWODOTS STRINGS
	{Printf.printf "%s %c %c %s" $1 $2 $3 $4; flush stdout}
| ADDITIONAL_INFORMATION TWODOTS STRINGS
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
;

/************** 4 GNSS Antenna Information  ***************************/

gnss_ant_info:

| INTEIRO DOT GNSS_ANTENNA_INFORMATION ENTER
	{Printf.printf "%i%c %s %s" $1 $2 $3 $4; flush stdout}
| REAL ANTENNA_TYPE TWODOTS STRINGS INTEIRO STRINGS ENTER
	{Printf.printf "%.1f %s %c %s %i %s %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| SERIAL_NUMBER TWODOTS ENTER
	{Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| ANTENNA_REFERENCE_POINT TWODOTS STRINGS ENTER
	{Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| STRINGS STRINGS DOT STRINGS TWODOTS REAL ENTER
	{Printf.printf "%s %s %c %s %c %f %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| STRINGS STRINGS TWODOTS REAL ENTER
	{Printf.printf "%s %s %c %f %s" $1 $2 $3 $4 $5; flush stdout}
| STRINGS STRINGS TWODOTS REAL ENTER
	{Printf.printf "%s %s %c %f %s" $1 $2 $3 $4 $5; flush stdout}
| ALIGNMENT_FROM_TRUE TWODOTS REAL ENTER
	{ Printf.printf "%s %c %f %s" $1 $2 $3 $4; flush stdout}
| ANTENNA_RADOME_TYPE TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}
| RADOME_SERIAL_NUMBER TWODOTS ENTER 
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| ANTENNA_CABLE_TYPE TWODOTS ENTER
	{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
| ANTENNA_CABLE_LENGHT TWODOTS INTEIRO STRINGS ENTER
	{ Printf.printf "%s %c %i %s %s" $1 $2 $3 $4 $5; flush stdout}
| DATE_INSTALLED TWODOTS DATAS ENTER
	{	Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}
| DATE_REMOVED TWODOTS DATAS ENTER
	{	Printf.printf "%s %c %s %s" $1 $2 (String.uppercase $3) $4; flush stdout}
| ADDITIONAL_INFORMATION TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}	
	
/***   4.x  ***/

| INTEIRO DOT STRINGS TWODOTS STRINGS INTEIRO STRINGS DOT STRINGS STRINGS ENTER
	{ Printf.printf "%i%c%s %c %s %i %s %c %s %s %s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11; flush stdout}
| SERIAL_NUMBER TWODOTS STRINGS INTEIRO STRINGS INTEIRO STRINGS ENTER
	{ Printf.printf "%s %c %s %i %s %i %s %s" $1 $2 $3 $4 $5 $6 $7 $8; flush stdout}
| ANTENNA_REFERENCE_POINT TWODOTS STRINGS STRINGS DOT STRINGS STRINGS DOT STRINGS ENTER
	{ Printf.printf "%s %c %s %s %c %s %s %c %s %s" $1 $2 $3 $4 $5 $6 $7 $8 $9 $10; flush stdout}
| MARKUP DOT STRINGS TWODOTS REAL ENTER
	{ Printf.printf "%s %c %s %c %f %s" $1 $2 $3 $4 $5 $6 ; flush stdout}
| MARKNORTH TWODOTS REAL ENTER
	{ Printf.printf "%s %c %f %s" $1 $2 $3 $4; flush stdout}
| MARKEAST TWODOTS REAL ENTER
	{ Printf.printf "%s %c %f %s" $1 $2 $3 $4; flush stdout}
| ALIGNMENT_FROM_TRUE TWODOTS STRINGS STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s %s" $1 $2 $3 $4 $5 $6; flush stdout}
| ANTENNA_RADOME_TYPE TWODOTS STRINGS DOT STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %c %s %s %s" $1 $2 $3 $4 $5 $6 $7; flush stdout}
| RADOME_SERIAL_NUMBER TWODOTS STRINGS
	{ Printf.printf "%s %c %s " $1 $2 $3; flush stdout}
| ANTENNA_CABLE_TYPE TWODOTS STRINGS STRINGS ENTER
	{ Printf.printf "%s %c %s %s %s "$1 $2 $3 $4 $5;  flush stdout}
| ANTENNA_CABLE_LENGHT TWODOTS STRINGS ENTER
	{ Printf.printf "%s %c %s %s" $1 $2 $3 $4; flush stdout}	
| DATE_INSTALLED TWODOTS DATAS
	{	Printf.printf "%s %c %s" $1 $2 (String.uppercase $3); flush stdout}
| DATE_REMOVED TWODOTS DATAS
	{	Printf.printf "%s %c %s" $1 $2 (String.uppercase $3); flush stdout}
| ADDITIONAL_INFORMATION TWODOTS STRINGS
{ Printf.printf "%s %c %s" $1 $2 $3; flush stdout}
;
