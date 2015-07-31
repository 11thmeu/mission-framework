{
    _x params ["_unit", "_loadout"];

    if (local _unit) then {
        _unit call compile preprocessFileLineNumbers (format ["loadouts\%1.sqf", _loadout]);
    };
} forEach MEUF_Loadouts_queue;
