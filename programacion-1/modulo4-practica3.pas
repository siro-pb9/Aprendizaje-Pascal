program BizarrapSessions;

type
    { 1. Molde para la Fecha }
    FichaFecha = record
        dia: 1..31;
        mes: 1..12;
        anio: integer;
    end;

    { 2. Molde para la Duración }
    FichaDuracion = record
        minutos: integer;
        segundos: 0..59;
    end;

    { 3. Molde PRINCIPAL para la Sesión }
    FichaSesion = record
        invitado: string[50];
        visitas: longint;
        fechaLanzamiento: FichaFecha;
        duracion: FichaDuracion;
    end;

procedure procesarsesion(var sesion: FichaSesion);
begin
    writeln('Ingrese el nombre del invitado:');
    readln(sesion.invitado);

    writeln('Ingrese las visitas:');
    readln(sesion.visitas);

    writeln('--- Ingrese la fecha de lanzamiento ---');
    write('Dia: ');
    readln(sesion.fechaLanzamiento.dia);

    write('Mes: ');
    readln(sesion.fechaLanzamiento.mes);

    write('Año: ');
    readln(sesion.fechaLanzamiento.anio);

    writeln('--- Ingrese duracion de la sesion ---');
    write('Minutos: ');
    readln(sesion.duracion.minutos);

    write('Segundos: ');
    readln(sesion.duracion.segundos);
end;

function fechasIguales(f1, f2: FichaFecha): boolean;
begin
    fechasIguales := (f1.dia = f2.dia) and (f1.mes = f2.mes) and (f1.anio = f2.anio);
end;

function fechaEsMenor(f1, f2: FichaFecha): boolean;
begin
    fechaEsMenor := false;

    if (f1.anio < f2.anio) then
        fechaEsMenor := true
    else if (f1.anio = f2.anio) then
    begin
        if (f1.mes < f2.mes) then
            fechaEsMenor := true
        else if (f1.mes = f2.mes) then
        begin
            if (f1.dia < f2.dia) then
                fechaEsMenor := true;
        end;
    end;
end;

function duracionEsMayor(d1, d2: FichaDuracion): boolean;
begin
    duracionEsMayor := false;

    if (d1.minutos > d2.minutos) then
        duracionEsMayor := true
    else if (d1.minutos = d2.minutos) then
    begin
        if (d1.segundos > d2.segundos) then
            duracionEsMayor := true;
    end;
end;

var
    sesion: FichaSesion;
    corte, reciente1, reciente2, antigua: FichaFecha;
    max1, max2, artistaantigua: string[50];
    visit: longint;
    mascorta: FichaDuracion;

begin
    corte.dia := 30;
    corte.mes := 4;
    corte.anio := 2001;
    
    reciente1.dia := 1;
    reciente1.mes := 1;
    reciente1.anio := 1;
    
    reciente2.dia := 1;
    reciente2.mes := 1;
    reciente2.anio := 1;
    
    antigua.dia := 31;
    antigua.mes := 12;
    antigua.anio := 9999;
    
    mascorta.minutos := 9999;
    mascorta.segundos := 59;

    procesarsesion(sesion);
    
    while not fechasIguales(sesion.fechaLanzamiento, corte) do
    begin
        if FechaEsMenor(reciente1, sesion.fechaLanzamiento) then
        begin
            max2 := max1;
            max1 := sesion.invitado;
            reciente2 := reciente1;
            reciente1 := sesion.fechaLanzamiento;
        end
        else if FechaEsMenor(reciente2, sesion.fechaLanzamiento) then
        begin
            max2 := sesion.invitado;
            reciente2 := sesion.fechaLanzamiento;
        end;

        if FechaEsMenor(sesion.fechaLanzamiento, antigua) then
        begin
            antigua := sesion.fechaLanzamiento;
            artistaantigua := sesion.invitado;
        end;

        if not duracionEsMayor(sesion.duracion, mascorta) then
        begin
            mascorta := sesion.duracion;
            visit := sesion.visitas;
        end;

        procesarsesion(sesion);
    end;

    writeln('--- RESULTADOS FINALES ---');
    writeln('B) Artistas mas recientes: 1. ', max1, ' y 2. ', max2);
    writeln('C) Artista de la sesion mas antigua: ', artistaantigua);
    writeln('D) Visitas de la sesion mas corta: ', visit);

    readln;
end.