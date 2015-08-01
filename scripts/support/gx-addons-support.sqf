/*
	Author: Kavinsky

	Description:
	Activa el soporte de GX Support, solo se debe llamar desde el init.sqf

	Parameter(s):


	Returns:
	NOTHING
*/

// Necesitamos saber si tenemos cargado el addon
if !(isClass(configFile >> "CfgPatches" >> "gx_addons")) exitWith {};

// Esto no se ejecuta en dedicados o HC, asi que no lo cargamos
if (!hasInterface) exitWith {};

// predefinimos la variable
MEUF_GX_InternalEnableFreq = false;

// Si, esto es un PFH (PerFrameHandler), es codigo no programado, lo cual mas
// rapido, se ejecuta cada segundo para que la otra funcion no tenga que ejecutar
// esto cada 0.001 segundos y no sobrecargue el sistema.
// <https://dev.withsix.com/docs/cba/files/common/fnc_addPerFrameHandler-sqf.html>
[{
    // Obtenemos las dos frecuencias de nuestra radio activa, la cual podemos
    // transmitir ahora mismo.
    _sw     = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwFrequency;
    _lr     = (call TFAR_fnc_ActiveLrRadio) call TFAR_fnc_getLrFrequency;

    // Y las cotejamos con la frecuencia que hemos definido en el init.sqf
    // Nota: Si podria haber hecho esto mejor, pero son las maravillas (ironi mode on)
    // del arma3
    if ((_sw == MEUF_GX_SupportFreq)) then {
        MEUF_GX_InternalEnableFreq = true;
    } else {
        MEUF_GX_InternalEnableFreq = false;

        if (_lr == MEUF_GX_SupportFreq) then {
            MEUF_GX_InternalEnableFreq = true;
        };
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;

// Cambiamos la condicion de la accion del gx_asp
gx_asp_enablecond =  "MEUF_GX_InternalEnableFreq";

// asignamos a todos los jugadores, jip o no jip, siempre tiene acceso a
// el menu de soporte
player call gx_asp_radio;
