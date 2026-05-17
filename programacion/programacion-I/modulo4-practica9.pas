{ La ciudad de Bariloche es centro de un Congreso Internacional de Gastronomía, al cual
asisten 10 representantes de cada uno de los 25 países intervinientes. De cada uno de ellos
se conoce su nombre y apellido, país al que representa, plato a presentar, sexo y edad. A la
vez de cada plato se conoce el nombre, si es frío o caliente y su ingrediente principal.
Definir la estructura de datos más adecuada para almacenar la información descripta.
Realizar un programa que procese esta información e informe:
a) El país con mayor cantidad de participantes femeninos que presentan platos calientes.
b) La edad promedio de los participantes.
c) El nombre y apellido y el país de los participantes que presentan plato frío con atún
como ingrediente principal.}

program modulo4practica9;

type

fichaPlato = record
    nombre: string[30];
    tipo: char;
    ingrediente: string[30];
end;

fichaParticipante = record
    nombre: string[30];
    pais: string[30];
    plato: fichaPlato;
    sexo: char;
    edad: integer;
end;

procedure leerFichas(var p: fichaParticipante); begin
    writeln('Introduzca el nombre del participante');
    readln(p.nombre);
    writeln('');
    writeln('Introduzca el pais del participante');
    readln(p.pais);
    writeln('');
    writeln('Introduzca el plato del participante');
    readln(p.plato.nombre);
    writeln('');
    repeat
        writeln('Introduzca el tipo de plato (F: Frio, C: Caliente):');
        readln(p.plato.tipo);
        p.plato.tipo := UpCase(p.plato.tipo);
        if not (p.plato.tipo in ['F', 'C']) then
            writeln('Error: Tipo no valido. Ingrese F o C.');
    until p.plato.tipo in ['F', 'C'];
    writeln('');
    writeln('Introduzca el ingrediente principal del plato');
    readln(p.plato.ingrediente);
    p.plato.ingrediente := UpCase(p.plato.ingrediente);
    writeln('');
    
    repeat
        writeln('Introduzca el sexo del participante (M: Masculino, F: Femenino):');
        readln(p.sexo);
        p.sexo := UpCase(p.sexo);
        if not (p.sexo in ['M', 'F']) then
            writeln('Error: Sexo no valido. Ingrese M o F.');
    until p.sexo in ['M', 'F'];
    writeln('');
    writeln('Introduzca la edad del participante');
    readln(p.edad);
    writeln('');
end;

function femCal(s: fichaParticipante): boolean; begin
    FemCal := (s.sexo = 'F') and (s.plato.tipo = 'C');
end;

function frioAtun(p: fichaParticipante): boolean; begin
    frioAtun := ((p.plato.tipo = 'F') and (p.plato.ingrediente = 'ATUN'))
end;

var
    suma, ipais, ipart, maxFemCal, actFemCal: integer;
    part: fichaParticipante;
    plato: fichaPlato;
    maxFemPais: string[30];

begin
suma := 0;
maxFemCal := -1;

for ipais := 1 to 25 do begin
    actFemCal := 0;
    for ipart := 1 to 10 do begin
        leerFichas(part);
        if femCal(part) then
            actFemCal := actFemCal + 1;
        suma := suma + part.edad;

        if frioAtun(part) then
            writeln('El participante ',part.nombre,' del pais ',part.pais,' Presento el plato indicado');
        writeln('PARTICIPANTE REGISTRADO');
        writeln;
    end;
    writeln('PAIS REGISTRADO');
    writeln;
    if (actFemCal > maxFemCal) then begin
        maxFemCal := actFemCal;
        maxFemPais := part.pais;
    end;
end;
writeln('El promedio de edad de los 250 participantes es ', suma / 250:0:2);
end.