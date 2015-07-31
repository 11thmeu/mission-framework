////////////////////////////////////////////////////////////////////////////////
// Archivo init de la mision
// Este archivo se ejecutara segun arranque la mision, justo el ultimo despues
// del resto de addons y demas scripts externos a la mision.
// <https://community.bistudio.com/wiki/Initialization_Order>
////////////////////////////////////////////////////////////////////////////////

waitUntil {!isNil "BIS_fnc_init"};
waituntil {!isNull player};

// Sistema de perfiles
////////////////////////////////////////////////////////////////////////////////
// Esto inicializa el sistema de loadouts, si no lo quieres usar, solo comenta
// esta linea
[] call MEUF_fnc_initLoadouts;
