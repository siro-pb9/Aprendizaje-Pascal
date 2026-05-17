program practicas10;

const
  FIN = 756;
var
  nota, notamax, promedio, promediomax, suma: real;
  i, cantmaterias, ID, idmax: integer;

begin
  suma := 0;
  promedio := -1;
  promediomax := -1;
  suma := 0;

  repeat
    notamax := 0;
    writeln('Escriba su ID de alumno');
    readln(ID);
    writeln('Escriba la cantidad de materias aprobadas');
    readln(cantmaterias);


    suma := 0;

    for i := 1 to cantmaterias do
    begin
      writeln('Introduzca nota de la materia: ',i);
      readln(nota);
      if nota > notamax then
         notamax := nota;
      suma := suma + nota;
    end;
    promedio := suma / cantmaterias;
    if promedio > promediomax then
       begin
         promediomax := promedio;
         idmax := id;
       end;
    writeln('la nota maxima del alumno ',id,' es ',notamax:0:2);


  until (ID = FIN);
  writeln('El maximo promedio es: ',promediomax:2:0,', Del alumno ',idmax);
  readln();
end.
