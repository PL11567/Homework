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
	{ }
;
/************************** 0 FORM ************************************/

secform:

| INTEIRO DOT FORM ENTER {}
| PREPARED_BY TWODOTS STRINGS ENTER {}
| DATE_PREPARED TWODOTS DATASIMPLES ENTER {}
| REPORT_TYPE TWODOTS STRINGS ENTER {}
| IF_UPDATE TWODOTS ENTER {}
| PREVIOUS_LOG TWODOTS FICHEIRO ENTER {}
| MODIFIED_SEC TWODOTS STRINGS DOT STRINGS DOT STRINGS DOT DOT DOT STRINGS ENTER {}
;
/*********** 1 Site Identification of the GNSS Monument ***************/

secsite:

| INTEIRO DOT SITE_IDENTIFICATION ENTER {}
| SITE_NAME TWODOTS STRINGS ENTER { Printf.printf "%s\n" $3 ; flush stdout}
| FOUR_CHARATER_ID TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3 ; flush stdout}
| MONUMENT_INSCRIPTION TWODOTS ENTER {}
| IERS TWODOTS INTEIRO STRINGS INTEIRO ENTER {Printf.printf "%i%s%i\n" $3 $4 $5 ; flush stdout}
| CDP_NUMBER TWODOTS STRINGS INTEIRO STRINGS ENTER {}
| MONUMENT_DESCRIPTION TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3; flush stdout}
| HEIGHT_OF_THE_MONUMENT TWODOTS STRINGS ENTER {}
| MONUMENT_FOUNDATION TWODOTS STRINGS ENTER {}
| FOUNDATION_DEPTH TWODOTS STRINGS ENTER {}
| MARKER_DESCRIPTION TWODOTS STRINGS ENTER {}
| DATE_INSTALLED TWODOTS DATAS ENTER {Printf.printf "%s\n" (String.uppercase $3); flush stdout}	
| GEOLOGIC_CHARACTERISTIC TWODOTS STRINGS ENTER {}
| BEDROCK_TYPE TWODOTS STRINGS ENTER {}
| BEDROCK_CONDITION TWODOTS STRINGS ENTER {}
| FRACTURE_SPACING TWODOTS STRINGS FRACSPACING STRINGS FRACSPACING STRINGS FRACSPACING STRINGS INTEIRO STRINGS ENTER {}
| FAULT_ZONES_NEARBY TWODOTS STRINGS ENTER {}
| DISTANCE_ACTIVITY TWODOTS STRINGS ENTER {}
| ADDITIONAL_INFORMATION TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3}
;
/************** 2 Site Location Information ***************************/

siteloc:

| INTEIRO DOT SITE_LOCATION_INFORMATION ENTER {}
| CITY_OR_TOWN TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3}
| STATE_OR_PROVINCE TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3}
| COUNTRY TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3}
| TECTONIC_PLATE TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3}
| APPROXIMATE_POSITION ENTER {}
| X_COORDINATE TWODOTS REAL ENTER {Printf.printf "%f\n" $3}
| Y_COORDINATE TWODOTS COORDENADA ENTER	{Printf.printf "%s\n" $3}
| Z_COORDINATE TWODOTS REAL ENTER 	{Printf.printf "%f\n" $3}
| STRINGS STRINGS TWODOTS COORDENADA STRINGS ENTER {Printf.printf "%s%s\n" $4 $5}
| STRINGS STRINGS TWODOTS COORDENADA ENTER 	{Printf.printf "%s\n" $4; flush stdout}
| STRINGS DOT STRINGS TWODOTS REAL ENTER {Printf.printf "%f\n" $5; flush stdout}
| ADDITIONAL_INFORMATION TWODOTS ENTER {Printf.printf "%s\n" $3}
;

/************** 3 GNSS Receiver Information  **************************/

gnss_rec_info:

| INTEIRO DOT GNSS_RECEIVER_INFORMATION ENTER {}
| REAL RECEIVER_TYPE TWODOTS STRINGS INTEIRO STRINGS ENTER {Printf.printf "%s %i %s\n" $4 $5 $6}
| SATELLITE_SYSTEM TWODOTS STRINGS STRINGS ENTER {Printf.printf "%s%s\n" $3 $4}
| SERIAL_NUMBER TWODOTS INTEIRO ENTER {Printf.printf "%i\n" $3}
| FIRMWARE_VERSION TWODOTS STRINGS INTEIRO STRINGS ENTER {Printf.printf "%s %i %s\n" $3 $4 $5}
| ELEVATION_CUTOFF_SETTING TWODOTS STRINGS ENTER {}
| DATE_INSTALLED TWODOTS DATAS ENTER {Printf.printf "%s\n" (String.uppercase $3)}
| DATE_REMOVED TWODOTS DATAS ENTER {Printf.printf "%s\n" (String.uppercase $3)}
| STRINGS DOT TWODOTS STRINGS ENTER {}
| ADDITIONAL_INFORMATION TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3}

/***  3.x  ***/

| INTEIRO DOT STRINGS TWODOTS STRINGS {}
| SATELLITE_SYSTEM TWODOTS STRINGS 	{Printf.printf "%s\n" $3}
| SERIAL_NUMBER TWODOTS STRINGS {Printf.printf "%s\n" $3}
| FIRMWARE_VERSION TWODOTS STRINGS 	{Printf.printf "%s\n" $3}
| ELEVATION_CUTOFF_SETTING TWODOTS STRINGS 	{}
| DATE_INSTALLED TWODOTS DATAS	{Printf.printf "%s\n" (String.uppercase $3)}
| DATE_REMOVED TWODOTS DATAS {Printf.printf "%s\n" (String.uppercase $3)}
| STRINGS DOT TWODOTS STRINGS {}
| ADDITIONAL_INFORMATION TWODOTS STRINGS {Printf.printf "%s\n" $3}
;

/************** 4 GNSS Antenna Information  ***************************/

gnss_ant_info:

| INTEIRO DOT GNSS_ANTENNA_INFORMATION ENTER {}
| REAL ANTENNA_TYPE TWODOTS STRINGS INTEIRO STRINGS ENTER {Printf.printf "%s %i %s\n" $4 $5 $6}
| SERIAL_NUMBER TWODOTS STRINGS ENTER {Printf.printf "%s\n" $3}
| ANTENNA_REFERENCE_POINT TWODOTS STRINGS ENTER	{Printf.printf "%s\n" $3}
| STRINGS STRINGS DOT STRINGS TWODOTS REAL ENTER {Printf.printf "%f\n" $6}
| STRINGS STRINGS TWODOTS REAL ENTER {Printf.printf "%f\n" $4}
| STRINGS STRINGS TWODOTS REAL ENTER {Printf.printf "%f\n" $4}
| ALIGNMENT_FROM_TRUE TWODOTS REAL ENTER {}
| ANTENNA_RADOME_TYPE TWODOTS STRINGS ENTER	{Printf.printf "%s\n" $3}
| RADOME_SERIAL_NUMBER TWODOTS ENTER {}
| ANTENNA_CABLE_TYPE TWODOTS ENTER {}
| ANTENNA_CABLE_LENGHT TWODOTS INTEIRO STRINGS ENTER {}
| DATE_INSTALLED TWODOTS DATAS ENTER {Printf.printf "%s\n" (String.uppercase $3)}
| DATE_REMOVED TWODOTS DATAS ENTER	{Printf.printf "%s\n" (String.uppercase $3)}
| ADDITIONAL_INFORMATION TWODOTS STRINGS {Printf.printf "%s\n" $3}	
	
/***   4.x  ***/

| INTEIRO DOT STRINGS TWODOTS STRINGS INTEIRO STRINGS DOT STRINGS STRINGS ENTER	{}
| SERIAL_NUMBER TWODOTS STRINGS INTEIRO STRINGS INTEIRO STRINGS ENTER {}
| ANTENNA_REFERENCE_POINT TWODOTS STRINGS STRINGS DOT STRINGS STRINGS DOT STRINGS ENTER	{}
| MARKUP DOT STRINGS TWODOTS REAL ENTER	{Printf.printf "%f\n" $5}
| MARKNORTH TWODOTS REAL ENTER {Printf.printf "%f\n" $3}
| MARKEAST TWODOTS REAL ENTER {Printf.printf "%f\n" $3}
| ALIGNMENT_FROM_TRUE TWODOTS STRINGS STRINGS STRINGS ENTER	{}
| ANTENNA_RADOME_TYPE TWODOTS STRINGS DOT STRINGS STRINGS ENTER	{Printf.printf "%s%c%s%s\n" $3 $4 $5 $6}
| RADOME_SERIAL_NUMBER TWODOTS STRINGS	{}
| ANTENNA_CABLE_TYPE TWODOTS STRINGS STRINGS ENTER	{}
| ANTENNA_CABLE_LENGHT TWODOTS STRINGS ENTER {}	
| DATE_INSTALLED TWODOTS DATAS {Printf.printf "%s\n" (String.uppercase $3)}
| DATE_REMOVED TWODOTS DATAS {Printf.printf "%s\n" (String.uppercase $3)}
| ADDITIONAL_INFORMATION TWODOTS STRINGS ENTER{Printf.printf "%s\n" $3}
;
