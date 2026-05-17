program bokita;

const
    FIN = 500;
    FIN2 = 'z';

var 
    car: char;
    cant, leidos: integer;

procedure ProcesarPalabra(var c: char; var l: integer);
begin
    { Usamos el WHILE para el bucle interno como pidió }
    while (c <> ' ') and (c <> FIN2) and (l < FIN) do
    begin
        read(c);
        
        { REGLA 1: Solo sumamos si NO es un espacio }
        if c <> ' ' then
            l := l + 1;
    end;
end;


begin
    cant := 0;
    leidos := 0;

    writeln('Ingrese una secuencia (corta con "z" o a los 500 char válidos):');
    read(car);
    
    { Evaluar la primera letra leida }
    if car <> ' ' then 
        leidos := leidos + 1;

    
    repeat
        
        { 1. rsquivar espacios }
        while (car = ' ') and (leidos < FIN) do
        begin
            read(car);
            if car <> ' ' then 
                leidos := leidos + 1;
        end;

        { 2. si hay una letra, empezo una palabra }
        if (car <> ' ') and (leidos <= FIN) then
        begin
            cant := cant + 1;
            
            {3. llamar al modulo}
            ProcesarPalabra(car, leidos);
        end;

    until (car = FIN2) or (leidos >= FIN);

    writeln('Cantidad de palabras: ', cant);
    readln;
    readln;
end.