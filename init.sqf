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


// Teleport JIP
////////////////////////////////////////////////////////////////////////////////
// Esto es un pequeño hack para ejecutar el modulo JIP siempre, si, puede hacerse
// modulo, pero para que ponerlo si siempre hay que ponerlo no?
[0, 0, true] call meu_respawn_fnc_moduleJipTeleport;


// Soporte de Artilleria para GX Addons
////////////////////////////////////////////////////////////////////////////////
// Definimos variables antes de ejecutar el motor de artilleria y soporte
// Frecuencia para contactar con el canal de soporte
MEUF_GX_SupportFreq = "220.1";

// Este script lo vamos a modificar para añadir lo siguiente:
// Todas las unidades pueden acceder al menu de soporte si tienen una radio
// Y la frecuencia adecuada
// Solo se ejecutara si tenemos el addon cargado, para el futuro :)
[] execVM "scripts\support\gx-addons-support.sqf";


/// debug
[{
    hintSilent str diag_fps;
}, 3, []] call CBA_fnc_addPerFrameHandler;
