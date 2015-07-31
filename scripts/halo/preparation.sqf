/*
	Author: Kavinsky

	Description:
	Añade una opción para preparar el salto halo, este remplazara tu
    equipamiento con el equipo de salto, lo guardara en un lugar
    seguro y añadira una accion para volver a equiparse correctamente.

	Parameter(s):
		0: OBJECT
            Objeto al que añadir la opción


	Returns:
	NOTHING

    Example:
        0 = [this] execVM "scripts/halo/preparation.sqf";
*/
private [];

params ["_mainActionHolder"];


_mainActionHolder addAction ["Ponerse equipo de salto", {
    params ["_target", "_caller"];

    if (_caller getVariable ["MEU_JumpSuitWearing", false]) exitWith {
        ["Ya tienes puesto el equipo de salto", true] call ace_common_fnc_displayText;
    };

    // save equipment

    // add backpack on chest (empty)

    // set weapon on back

    // replace uniform and set vest and parachute

    _caller addAction ["Cambiarse de equipo de salto", {
        params ["_target", "_caller", "_actionId"];

        // check altitude on ground

        // replace equipment

        _caller removeAction _actionId;
        _caller setVariable ["MEU_JumpSuitWearing", false];
    }];

    _caller setVariable ["MEU_JumpSuitWearing", true];
}];
