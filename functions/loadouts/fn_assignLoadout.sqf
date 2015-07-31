
private [];
params ["_unit", "_loadout"];

if (isNil "MEUF_Loadouts_queue") then {
    MEUF_Loadouts_queue = [];
};

MEUF_Loadouts_queue pushBack [_unit, _loadout];
