/*
	Author: Kavinsky

	Description:
	Hace una salva de morteros sobre un grupo de jugadores, evitando dañar a
	estos. Este script es de ambiente, es para que los jugadores se asusten por
	un ataque con morteros.

	Parameter(s):
		0: UNIT o GROUP o POSITION
			El grupo o unidad o posicion a la que se la quiere disparar

		1: NUMBER
			Numero de proyectiles en la salva


	Returns:
	NOTHING

    Example:
        0 = [this, 4] execVM "scripts/ambience/mortarVirtualAttack.sqf";
*/

#define MORTAL_RADIUS 20

private [];

params ["_pos", "_salvoSize"];

// con este switch podemos permitir varios tipos de variables en el parametro
// _pos
switch (typeName _pos) do {
		case "ARRAY": { }; // do nothing :D
		case "GROUP": { _pos = getPosATL (leader _pos) };
		case "OBJECT": { _pos = getPosATL _pos; };
		default {
			exitWith {
				["mortarVirtualAttack: PARAM 0 debe ser una posicion o un grupo o un objeto"] call BIS_fnc_error;
			};
		};
};

// TBC
