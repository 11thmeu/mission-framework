
if (isNil "MEUF_Loadouts_queue") exitWith {};

{
    _x params ["_unit", "_loadout"];

    if (local _unit) then {
        [_unit, _loadout] call MEUF_fnc_execLoadout;
    };
} forEach MEUF_Loadouts_queue;
