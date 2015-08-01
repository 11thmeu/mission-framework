/*
	Author: Kavinsky

	Description:
	Ejecuta un preset en una unidad

	Parameter(s):
		0: UNIT
            Unidad a la que asignar el preset

        1: STRING
            Preset a cargar


	Returns:
	NOTHING

    Example:
        [this, "sas\operator"] call MEUF_fnc_execLoadout;
*/
params ["_unit", "_loadout"];

// Ejecuta el preset en la unidad
_unit call compile preprocessFileLineNumbers (format ["loadouts\%1.sqf", _loadout]);
