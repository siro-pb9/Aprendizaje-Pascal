{ Escriba un programa que lea una secuencia de caracteres terminada en punto, y que a través de
un procedimiento evalúe si cada una de sus palabras tiene la 'p' seguida de la ‘a’. El programa debe
informar cuántas palabras cumplen con esa condición.}

program practica11;

type
    invalidos = set of char;

var
    secuencia: char;
    cantidad: integer;
    caracteresinv: invalidos;
    cumplePalabra: boolean;

procedure quitarespacios(var sec: char);
begin
    while (sec = ' ') do
        read(sec);
end;

procedure procesarpalabra(var sec: char; var cumple: boolean; inv: invalidos);
var
    antcar: char;
begin
    antcar := sec;
    while not (sec in inv) do begin
        if ((antcar = 'p') and (sec = 'a')) then
            cumple := true;
        antcar := sec;
        read(sec);
    end;
end;

begin
    cantidad := 0;
    caracteresinv := [' ', '.'];
    writeln('Ingrese la secuencia terminada en punto:');
    read(secuencia);
    while (secuencia <> '.') do begin
        quitarespacios(secuencia);

        if (secuencia <> '.') then begin
        procesarpalabra(secuencia, cumplepalabra, caracteresinv);

            if (cumplepalabra) then
                cantidad := cantidad + 1;
        end;
    end;
    writeln('la cantidad de palabras con "pa" es: ',cantidad);
    readln;
    readln;
end.