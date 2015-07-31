
private [];
params ["_unit", "_loadout"];

if (isNil "MEUF_Loadouts_queue") then {
    MEUF_Loadouts_queue = [];
};

MEUF_Loadouts_queue pushBack [_unit, _loadout];

if (local _unit) then {
    _unit addEventHandler ["Respawn", {
            params ["_unit", "_corpse"];

            {
                _x params ["_loadoutUnit", "_loadout"];

                if (_loadoutUnit == _unit) then {
                    [_unit, _loadout] call MEUF_fnc_execLoadout;
                };
            } forEach MEUF_Loadouts_queue;
    }];
};
