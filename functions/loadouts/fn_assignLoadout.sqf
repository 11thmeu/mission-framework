/*
	Author: Kavinsky

	Description:
	Asigna un preset a una unidad, esta respawneara con el si muere o si hace JIP

	Parameter(s):
		0: UNIT
            Unidad a la que asignar el preset

        1: STRING
            Preset a cargar


	Returns:
	NOTHING

    Example:
        [this, "sas\operator"] call MEUF_fnc_assignLoadout;
*/
params ["_unit", "_loadout"];

// Si la variable no existe anteriormente, la creamos asi no da casque mas adelante
if (isNil "MEUF_Loadouts_queue") then {
    MEUF_Loadouts_queue = [];
};

// Añadimos los valores indicados en los parametros en una lista
// a la espera del init de la mision
MEUF_Loadouts_queue pushBack [_unit, _loadout];

// Eso asigna lo mismo que el init de la mision pero en el respawn
if (local _unit) then {
    _unit addEventHandler ["Respawn", {
            params ["_unit", "_corpse"];

            // Podria ser mejor, ya lo cambiare
            {
                _x params ["_loadoutUnit", "_loadout"];

                if (_loadoutUnit == _unit) then {
                    [_unit, _loadout] call MEUF_fnc_execLoadout;
                };
            } forEach MEUF_Loadouts_queue;
    }];
};
