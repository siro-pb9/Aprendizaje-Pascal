{Una tienda especializada en tecnología y entretenimiento está organizando
su catálogo de consolas de videojuegos en venta. Cada consola pertenece
a una marca determinada (por ejemplo, Sony, Microsoft, Nintendo, etc.), y
por cada modelo disponible se registra: la marca de la consola, el modelo,
el precio en dólares. Los datos se encuentran ordenados por marca, es
decir, se ingresan primero todos los modelos de una marca, luego los de la
siguiente, y así sucesivamente. La carga de datos finaliza cuando se ingresa la palabra “FIN” como
marca.
Se solicita desarrollar un programa que procese esta información y resuelva los siguientes puntos:
a) Informar la cantidad de modelos disponibles para cada marca.
b) Calcular e informar el precio promedio de los modelos por marca.
c) Determinar e informar la marca y el modelo de la consola más económica de todo el
catálogo.}

program modulo5practica2;

const
    CORTE = 'FIN';

type

    fichaConsola = record
        marca: string[30];
        modelo: string[30];
        precio: real;
    end;

procedure leerConsola(var c: fichaConsola); begin
    writeln('Introduzca la marca de la consola:');
    readln(c.marca);
    if (c.marca <> CORTE) then begin
    writeln('Introduzca el modelo de la consola');
    readln(c.modelo);
    writeln('Introduzca el precio de la consola');
    readln(c.precio);
    end;
end;

procedure calcularMin(c: fichaConsola; var moMin: string; var mMin: string; var pMin: real); begin
    if (c.precio < pMin) then begin
        moMin := c.modelo;
        mMin := c.marca;
        pMin := c.precio;
    end;
end;


var
    sumaModelos: integer;
    consola: fichaConsola;
    consolaActual, modMin, marMin: string[30];
    precioPromedio, precioMin: real;

begin
precioMin := 999999;
leerConsola(consola);
    while (consola.marca <> CORTE) do begin
        consolaActual := consola.marca;
        sumaModelos := 0;
        precioPromedio := 0;

        while (consola.marca <> CORTE) and (consola.marca = consolaActual) do begin  
            calcularMin(consola, modMin, marMin, precioMin);
            sumaModelos := sumaModelos + 1;
            precioPromedio := precioPromedio + consola.precio;
            writeln('======CONSOLA LEIDA======');
            leerConsola(consola);
        end;
        writeln('La marca ',consolaActual,' registro ',sumaModelos,' Consolas');
        writeln('El precio promedio de la marca es ', precioPromedio / sumaModelos:0:2);
    end;
writeln('La marca y modelo mas economico es: ',modMin,' (',marMin,')');
readln;
readln;
end.