/*
	Author: Kavinsky

	Description:
	Hace que una unidad dispare como si fuese flak a un objetivo aleatorio.
	Este script tiene que ejecutarse con un execVM, de lo contrario congelara
	el juego.

	Parameter(s):
		0: UNIT
            La unidad a la que asignar el script the flak

        1: NUMBER
            Area a la que quiere que se genere el objetivo aleatorio
            Recomendado: 100

        2: NUMBER
            Segundos entre rafagas, cada cuantos segundos se va a disparar una
            rafaga


	Returns:
	NOTHING

    Example:
        0 = [this, 100, 30] execVM "scripts/ambience/flak.sqf";
*/

// variables privadas
private ["_randomPos", "_tgt", "_randBurst"];

// parametros
params ["_unit", "_area", "_timeBetween"];

// Solo lo ejecutamos en el servidor
if (!isServer) exitWith {};

_unitPos = getPosATL _unit;

// Desactivamos que la IA tenga libertad de momientos y de apuntamiento.
_unit disableAI "MOVE";
_unit disableAI "AUTOTARGET";

// Bucle hasta que la unidad este muerta, o la variable MEU_AutoFlak sea false
while {_unit getVariable ['MEU_AutoFlak', true] && alive _unit} do {
	sleep _timeBetween;
	_randomPos = [_unitPos, (random 50) + _area, random 360] call BIS_fnc_relPos;

	// Creamos un soldado virtual (SOLO OTAN)
	// Lo ponemos en la posicion aleatora al rededor de la unidad
	// Y lo volvemos invislbe a todos los clientes.
	_tgt = "B_Soldier_F" createVehicle _randomPos;
	_randomPos set [2, 100];
	_tgt setPosATL _randomPos;
	_tgt enableSimulation false;
	hideObject _tgt;

	// la unidad lo localiza y le mandamos apuntar a el
	_unit reveal [_tgt, 4];
	_unit doWatch _tgt;
	waitUntil {_unit aimedAtTarget [_tgt] > 0};

	// Una vez apuntado le mandamos disparar X veces para simular una rafaga.
	_randBurst = (random 60) + 5;
	for "_x" from 1 to _randBurst do {
		sleep 0.05;
		_unit fireAtTarget [_tgt];
	};

	// una vez terminado la rafaga, eliminamos el soldado virtual
	deleteVehicle _tgt;
};

// a partir de aqui si la unidad esta viva le devolvemos la libertad que le
// quitamos anteriormente.
_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
