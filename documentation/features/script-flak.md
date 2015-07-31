## Flak de Ambiente

Hace que el vehiculo asignado al script dispare aleatoramente, simulando
que dispara a aviones a mas de la altitud visible por el jugador.


### Como se usa

Por ejemplo crea en el editor un shilka y en la linea de inicio ponemos lo
siguiente

```
0 = [this, 100, 30] execVM "scripts\ambience\flak.sqf";
```

Donde `this` es la unidad en la que ejecutamos el scripts, el segundo parametro
es el rango al que dispara el shilka dejarlo en 100 y el tercer parametro es el
tiempo entre las rafagas.


### Otra información

Este script es un bucle continuo, no se deben abusar de estos scripts por  
el rendimiento se resiente.
