{Escriba un programa que lea una secuencia de caracteres terminada en ‘*’ y procese palabras
analizando si su longitud es exactamente 8. El programa debe informar cuántas palabras de longitud
8 encontró. El procesamiento de cada palabra debe ser realizado en un módulo. Puede haber
blancos al principio y al final de la secuencia.}

program practica8;

type
    { 1. Crear el apodo global }
    caracteres = set of char;

var
    sec: char;
    cant, pal: integer;
    invalidos: caracteres; { 2. se crea la bolsa usando el apodo "invalidos" }

procedure saltarespacios(var car: char);
begin
    while (car = ' ') do
      read(car);
end;


procedure ProcesarPalabra(var car: char; var longitud: integer; bolsa: caracteres);
begin
    longitud := 0;
    { 3. se usa la bolsa }
    while not (car in bolsa) do 
    begin
        longitud := longitud + 1;
        read(car);
    end;
end;

begin
  cant := 0;
  pal := 0;
  
  { 4. se le asigna un valor a la bosla }
  invalidos := [' ', '*']; 
  
  writeln('Introduzca la secuencia terminada en *');
  read(sec);
  
  while sec <> '*' do
  begin
      saltarespacios(sec);
      { 5. se le manda la bolsa al modulo}
      ProcesarPalabra(sec, cant, invalidos); 
      
      if cant = 8 then
          pal := pal + 1;
  end;
  
  writeln('la cantidad de palabras con 8 caracteres es: ', pal);
  readln;
  readln; 
end.