params ["_unit", "_loadout"];

_unit call compile preprocessFileLineNumbers (format ["loadouts\%1.sqf", _loadout]);
