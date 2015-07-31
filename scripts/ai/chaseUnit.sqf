/*
	Author: Boreas (Actualizado por Kavinsky)

	Description:
	Hace que una unidad persiga a otra, recomendado para helicopteros.

	Parameter(s):
		0: UNIT o GROUP
            Unidad perseguidora

        1: UNIT o GROUP
            Unidad perseguida

        2: NUMBER
            Radio sobre la unidad perseguida a la que la unidad  perseguidora
            intentara moverse

        3: NUMBER
            Intervalo de tiempo entre actualización de la posición del
            perseguido, recomendamos 30 segundos por rendimiento.


	Returns:
	NOTHING

    Example:
        0 = [unidadPerseguidora, unidadPerseguida, 100, 30] execVM "scripts/ai/chaseUnit.sqf";
*/

private [
    "_radio", "_timeout", "_grpPersigue", "_grpPerseguido", "_ldrpersigue",
    "_ldrperseguido","_offx","_offy","_time2","_persigue","_perseguido",
    "_diametro"
];

_persigue = _this select 0;
_perseguido = _this select 1;
_radio=25;
_timeout=60;
if (count (_this) >=3 ) then {
	_radio = _this select 2;
	};
if (count (_this) >=4 ) then {
	_timeout=_this select 3;
	};


_diametro = _radio + _radio; //necesitamos el diametro=radio x 2


_grpPersigue=grpnull;
_grpPerseguido=grpnull;
if((typeName _persigue)=="GROUP")then{
	_grpPersigue = _persigue;
} else {
	_grpPersigue = group _persigue;
};


if((typeName _perseguido)=="GROUP")then{
	_grpPerseguido =  _perseguido;
} else {
	_grpPerseguido = group _perseguido;
};

if (isnull _grpPersigue ||isnull _grpPerseguido) exitwith {};
if ((typeName _grpPersigue) != "GROUP" || (typeName _grpPersigue) != "GROUP") exitwith {};

while {((count units _grpPersigue)>0) && ((count units _grpPerseguido)>0) } do{

	_ldrpersigue = leader _grpPersigue;
	_ldrperseguido = leader _grpPerseguido;

	_offx = (_radio) - random _diametro;
	_offy = (_radio) - random _diametro;

	_ldrpersigue move (_ldrperseguido modelToWorld [_offx,_offy,0]);

	sleep 1;
	_time2 = time + _timeout;
	waitUntil {
        sleep 0.5;
        moveToCompleted _ldrpersigue or moveToFailed _ldrpersigue or
        !alive _ldrpersigue or _time2 < time
    };
};
