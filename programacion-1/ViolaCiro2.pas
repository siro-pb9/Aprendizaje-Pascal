{En la segunda etapa del sistema para el centro "Huellitas Felices", se desea registrar información
más detallada de las mascotas que ingresan desde diferentes ciudades.
El sistema debe permitir el ingreso de datos de mascotas hasta que se ingrese una mascota con
edad -1. Los datos de ingreso vienen ordenados por nombre de la ciudad de origen.
Cada ingreso cuenta con los siguientes datos:
- Nombre de la mascota (String).
- Edad (Entero).
- Especie (Código: 1 = Perro, 2 = Gato, 3 = Ave, 4 = Conejo, 5 = Reptil).
- Ciudad de origen (String).
Sabiendo que los datos ingresan ordenados por Ciudad, se pide calcular e informar:
a. El total de mascotas ingresadas por cada ciudad.
b. El promedio de edad de los perros o gatos (especies 1 y 2) ingresados por cada ciudad.
c. Al finalizar el proceso, informar los nombres de las dos ciudades que mayor cantidad de
mascotas enviaron al centro.}

program integrador2;

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

procedure LeerMascota(var m: FichaMascota); 
begin
    writeln('=========================');
    write('Ingrese la edad (-1 para salir): ');
    readln(m.edad);

    if (m.edad <> -1) then 
    begin
        write('ingrese el nombre: ');
        readln(m.nombre);
        write('ingrese la especie: ');
        readln(m.especie);
        write('ingrese la ciudad: ');
        readln(m.ciudad);
    end;
end;

procedure revisarmaximos(ciudadAct: maxlongitud; cantMascotas: integer; 
                         var max1, max2: integer; 
                         var nomciudad1, nomciudad2: maxlongitud); 
begin
    if (cantMascotas > max1) then 
    begin
        max2 := max1;
        nomciudad2 := nomciudad1;
        
        max1 := cantMascotas;
        nomciudad1 := ciudadAct;
    end
    else if (cantMascotas > max2) then 
    begin
        max2 := cantMascotas;
        nomciudad2 := ciudadAct;
    end;
end;

var
    mascota: FichaMascota; 
    
    ciudadActual: maxlongitud;
    totalMascotasCiudad: integer; 
    sumaEdadPyG, cantPyG: integer; 
    
    max1, max2: integer;
    nomMax1, nomMax2: maxlongitud;

begin
    max1 := -1;
    max2 := -1;
    nomMax1 := '';
    nomMax2 := '';

    LeerMascota(mascota);

    while (mascota.edad <> -1) do 
    begin
        ciudadActual := mascota.ciudad;
        
        totalMascotasCiudad := 0;
        sumaEdadPyG := 0;
        cantPyG := 0;

        while (mascota.edad <> -1) and (mascota.ciudad = ciudadActual) do
        begin
            totalMascotasCiudad := totalMascotasCiudad + 1;
            if (mascota.especie = 1) or (mascota.especie = 2) then
            begin
                sumaEdadPyG := sumaEdadPyG + mascota.edad;
                cantPyG := cantPyG + 1;
            end;
            LeerMascota(mascota);
        end; 

        writeln('-----------------------------------');
        
        writeln('Ciudad: ', ciudadActual, ' - Total mascotas: ', totalMascotasCiudad);
        if (cantPyG > 0) then
            writeln('Promedio edad Perros y Gatos: ', (sumaEdadPyG / cantPyG):0:2)
        else
            writeln('No ingresaron Perros ni Gatos de esta ciudad.');

        revisarmaximos(ciudadActual, totalMascotasCiudad, max1, max2, nomMax1, nomMax2);

    end; 
    
    writeln('===================================');
    writeln('LAS CIUDADES QUE MAS MASCOTAS ENVIARON:');
    writeln('1er Lugar: ', nomMax1, ' con ', max1, ' mascotas.');
    writeln('2do Lugar: ', nomMax2, ' con ', max2, ' mascotas.');
    
    readln;
    readln;
end.