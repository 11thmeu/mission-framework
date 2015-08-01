/*
	Author: Kavinsky

	Description:
	Inicializa el modulo de loadouts, solo se debe ejecutar en el init.sqf

	Parameter(s):
    NONE

	Returns:
	NOTHING

    Example:
        [] call MEUF_fnc_initLoadouts;
*/
if (isNil "MEUF_Loadouts_queue") exitWith {};

// Ejecuta toda la lista de presets guardados de los inits de las unidades
{
    _x params ["_unit", "_loadout"];

    // Solo debemos ejectar el preset si la unidad es local
    if (local _unit) then {
        [_unit, _loadout] call MEUF_fnc_execLoadout;
    };
} forEach MEUF_Loadouts_queue;
