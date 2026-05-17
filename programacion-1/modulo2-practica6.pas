{Escribir un programa que lea una secuencia de caracteres terminada en punto ‘.’ e informe la
cantidad de veces que aparece una ‘a’ seguida de una ‘e’ o viceversa.}

program practica;

var
    car, antcar: char;
    cantae, cantea: integer;

begin
    writeln('ingrese la secuencia terminado en punto');
    read(car);

    cantae := 0;
    cantea := 0;
    antcar := ' ';

    while car <> '.' do
      begin

        if (antcar = 'a') and (car = 'e') then
          cantae := cantae + 1;
        if (antcar = 'e') and (car = 'a') then
          cantea := cantea + 1;

        antcar := car;
        read(car);
      end;

      writeln('la cantidad de "a" seguidos de "e" es: ',cantae);
      writeln('la cantidad de "e" seguidos de "a" es: ',cantea);
      readln();
end.