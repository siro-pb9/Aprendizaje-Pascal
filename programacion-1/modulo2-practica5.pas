{ a) Escribir un programa que lea una secuencia de caracteres terminada en punto ‘.’ e informe la
cantidad de caracteres leídos.
b) Ídem a), pero informando la cantidad de letras 'E' leídas.
c) Ídem a), pero informando la cantidad de letras 'f' leídas seguidas por una letra 'e'.
Ejemplo: hJfesafeef$&f@Tsad.
La cantidad de caracteres leídos es 18
La cantidad de letras E leídas es 0
La cantidad de letras f seguidas de una letra e es 2}

program Project1;
var
  car,antcar: char;
  contador, contE, contfe: integer;

begin
  writeln('Ingrese su seguidilla de caracteres terminada en "."');
  read(car);

  contador := 0;
  contE := 0;
  contfe := 0;
  antcar := ' ';

  while car <> '.' do
   begin

    contador := contador + 1;
    if car = 'E' then
      contE := contE + 1;
    if (car = 'e') and (antcar = 'f') then
      contfe := contfe + 1;
    antcar := car;
    read(car);
   end;

  writeln('La cantidad de letras es: ',contador);
  writeln('La cantidad de "E" es: ',contE);
  writeln('La cantidad de "fe" es: ',contfe);
  readln();
  readln();

  end.