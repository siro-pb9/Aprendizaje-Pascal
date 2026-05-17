{En esta etapa, el centro requiere almacenar los datos de las mascotas en una estructura de datos
para su posterior procesamiento. Se guardarán únicamente aquellas que cumplan con los requisitos
de validación.
Se deben leer de teclado los datos de las mascotas e ir almacenándolas en una estructura adecuada
(máximo 200 registros) hasta que se ingrese una con edad -1 o se alcance el cupo máximo. Para
cada registro se solicita:
- Nombre de la mascota (20 caracteres máximo).
- Edad (Entero).
- Especie (Código: 1 = Perro, 2 = Gato, 3 = Ave, 4 = Conejo, 5 = Reptil).
- Ciudad de origen (String).
Solo se deben almacenar aquellos registros cuyo nombre sea válido (según la lógica desarrollada
en la Etapa 1). La lectura del nombre finaliza al encontrar el carácter '.' o al leer 20 caracteres.
Una vez finalizada la carga de todas las mascotas, procesar la estructura de datos almacenada
para calcular e informar:
a) La cantidad de mascotas registradas por cada Especie (1 a 5).
b) El promedio de edad de las mascotas por cada Especie.
Requerimientos de implementación:
● Utilizar un Vector de Registros para el almacenamiento.
● Reutilizar la lógica de validación de nombres de la Parte I.
● Realizar el procesamiento de los resultados recorriendo la estructura una vez cargada.}

program integrador3;

type
    maxlongitud = string[30]; 
    rangoespecie = 1..5;
    conjuntoEspecies = set of rangoespecie;

    FichaMascota = record
        nombre: maxlongitud;
        edad: integer;
        especie: rangoespecie;
        ciudad: maxlongitud;
    end;

    VectorMascotas = array[1..200] of FichaMascota; // Vector de registros

procedure LeerMascota(var m: FichaMascota);
begin
    write('Ingrese la edad (-1 para salir): ');
    readln(m.edad);

    if (m.edad <> -1) then
    begin
        write('Ingrese el nombre: ');
        readln(m.nombre);
        write('Ingrese la especie: ');
        readln(m.especie);
        write('Ingrese la ciudad: ');
        readln(m.ciudad);
    end;
end;

procedure CargarMascotas(var v: VectorMascotas; var cant: integer);
var
    i: integer;
begin
    i := 1;
    LeerMascota(v[i]); // Carga la primera mascota

    while (v[i].edad <> -1) and (i < 200) do // mientras eddad distinto a -1
    begin
        i := i + 1;
        LeerMascota(v[i]); // Carga la siguiente mascota
    end;

    cant := i - 1;
end;

procedure ProcesarMascotas(const v: VectorMascotas; cant: integer);
var
    i: integer;
    cantPorEspecie: array[1..5] of integer; // contar la cantidad de mascotas por especie
    sumaEdadPorEspecie: array[1..5] of integer; // sumar la edad de las mascotas por especie
begin
    for i := 1 to 5 do
    begin
        cantPorEspecie[i] := 0;
        sumaEdadPorEspecie[i] := 0;
    end;

    for i := 1 to cant do
    begin
        cantPorEspecie[v[i].especie] := cantPorEspecie[v[i].especie] + 1; // sumar la cantidad de mascotas por especie
        sumaEdadPorEspecie[v[i].especie] := sumaEdadPorEspecie[v[i].especie] + v[i].edad; // suma la edad de las mascotas por especie
    end;

    writeln;
    writeln('RESULTADOS DEL PROCESAMIENTO:');
    writeln;

    for i := 1 to 5 do
    begin
        write('Especie ', i, ': ');
        if (cantPorEspecie[i] > 0) then
        begin
            writeln('Cantidad: ', cantPorEspecie[i], ' - Promedio de edad: ', 
                    (sumaEdadPorEspecie[i] / cantPorEspecie[i]):0:2); // promedio de edad
        end
        else
        begin
            writeln('No se registraron mascotas de esta especie.');
        end;
    end;
end;

var
    mascotas: VectorMascotas;
    cantidad: integer;

begin
    CargarMascotas(mascotas, cantidad);
    ProcesarMascotas(mascotas, cantidad);

    readln;
    readln;
end.