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
private ["_randomPos", "_tgt", "_randBurst"];

params ["_unit", "_area", "_timeBetween"];

_unitPos = getPosATL _unit;


_unit disableAI "MOVE";
_unit disableAI "AUTOTARGET";

while {_unit getVariable ['MEU_AutoFlak', true] && alive _unit} do {
	sleep _timeBetween;
	_randomPos = [_unitPos, (random 50) + _area, random 360 ] call BIS_fnc_relPos;

	_tgt = "B_Soldier_F" createVehicle _randomPos;
	_randomPos set [2, 100];
	_tgt setPosATL _randomPos;
	_tgt enableSimulation false;
	hideObject _tgt;

	_unit reveal [_tgt, 4];
	_unit doWatch _tgt;
	waitUntil {_unit aimedAtTarget [_tgt] > 0};

	_randBurst = (random 60) + 5;

	for "_x" from 1 to _randBurst do {
		sleep 0.05;
		_unit fireAtTarget [_tgt];
	};

	deleteVehicle _tgt;
};

_unit enableAI "MOVE";
_unit enableAI "AUTOTARGET";
