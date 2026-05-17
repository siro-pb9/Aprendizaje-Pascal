{Se desea procesar la información de todos los radares de velocidad que
posee la ciudad de La Plata en un día. Para ello se lee de cada radar:
código de radar, velocidad máxima permitida y cantidad de vehículos
registrados, y para cada vehículo de cada radar, se lee patente y
velocidad. La lectura finaliza cuando se lee el código de radar -1 que no
debe procesarse. Se pide calcular e informar:
a) La velocidad promedio de los automóviles para cada radar.
b) La cantidad de vehículos que fueron multados para cada radar.
c) La patente del vehículo con mayor velocidad y la patente del vehículo con menor
velocidad.
Nota: Modularizar la solución.}

program modulo4practica4;

type
    fichaRadar = record
        codigo: longint;
        velocidadmax: real;
        cantidadvehiculos: integer;
    end;

    fichaVehiculo = record
        patente: string[7];
        velocidad: real;
    end;

procedure leerRadar(var r: fichaRadar);
begin
    writeln('Ingrese el codigo numerico del radar:');
    readln(r.codigo);
    if (r.codigo <> -1) then begin
        writeln('Ingrese la velocidad maxima del radar en Km/h');
        readln(r.velocidadmax);

        writeln('Ingrese la cantidad de veiculos registrados:');
        readln(r.cantidadvehiculos);
    end;
end;

procedure procesarVehiculo(var v: fichaVehiculo; i: integer);
begin
        writeln('Ingrese la patente del vehiculo numero', i);
        readln(v.patente);

        writeln('Ingrese la velocidad del vehiculo', i);
        readln(v.velocidad);
end;

function promedio(c: integer; s: real): real;
    var
    resultado: real;
begin
    resultado := 0;
    if c <> 0 then 
        resultado := s / c;
    promedio := resultado;
end;

procedure actualizarMaxMin(patActual: string; velActual: real; var max, min: real; var patMax, patMin: string);
begin
    if (velActual > max) then
    begin
        max := velActual;
        patMax := patActual;
    end;
    if (velActual < min) then
    begin
        min := velActual;
        patMin := patActual;
    end;
end;

var
    radar: fichaRadar;
    vehiculo: fichaVehiculo;
    suma: real;
    i, multas: integer;
    max, min: real;
    patmax, patmin: string[7];
begin
    suma := 0;
    max := -1;
    min := 999;

        leerRadar(radar);
        while (radar.codigo <> -1) do begin
            multas := 0;

            for i := 1 to radar.cantidadvehiculos do begin
                procesarVehiculo(vehiculo, i);
                suma := suma + vehiculo.velocidad;
                if (vehiculo.velocidad > radar.velocidadmax) then
                    multas := multas + 1;
                actualizarMaxMin(vehiculo.patente, vehiculo.velocidad, max, min, patmax, patmin);
            end;
            writeln('El numero de multas del radar ', radar.codigo, ' es: ' ,multas);
            writeln('El promedio del radar es: ', promedio(radar.cantidadvehiculos, suma):0:2);
            
            suma := 0;

            leerRadar(radar);
    end;
    writeln('La patente del vehiculo con mayor velocidad es: ', patmax);
    writeln('La patente del vehiculo con menor velocidad es: ', patmin);

    readln;
end.

