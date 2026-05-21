{Realizar un programa que implemente y use:
a) un módulo que cargue un vector con 150 números enteros y lo retorne.
b) un módulo que reciba el vector generado en a) y retorne el promedio de sus valores y el porcentaje
de números negativos y positivos.
c) un módulo que reciba el vector generado en a) y dos valores enteros que representan un rango de
valores y que retorne la cantidad de elementos del vector que estén dentro de ese rango.
d) un módulo que reciba el vector generado en a) y retorne los dos valores mínimos entre sus
elementos junto con la posición donde se encuentran.}

program modulo6practica1;

const
  DF = 150; 

type
  numeros = array[1..DF] of integer;

procedure cargarVector(var v: numeros);
var
  i: integer;
begin
  for i := 1 to DF do begin
    write('Ingrese el numero entero (', i, '/', DF, '): ');
    readln(v[i]);
  end;
end;

procedure calcularEstadisticas(const v: numeros; var promedio, porcNeg, porcPos: real);
var
  i, suma, cantNeg, cantPos: integer;
begin
  suma := 0;
  cantNeg := 0;
  cantPos := 0;
  for i := 1 to DF do begin
    suma := suma + v[i];
    if (v[i] < 0) then
      cantNeg := cantNeg + 1
    else if (v[i] > 0) then
      cantPos := cantPos + 1;
  end;
  promedio := suma / DF;
  porcNeg := (cantNeg * 100.0) / DF;
  porcPos := (cantPos * 100.0) / DF;
end;

function contarEnRango(const v: numeros; valorMin, valorMax: integer): integer;
var
  i, cant: integer;
begin
  cant := 0;
  for i := 1 to DF do begin
    if (v[i] >= valorMin) and (v[i] <= valorMax) then
      cant := cant + 1;
  end;
  contarEnRango := cant;
end;

procedure encontrarDosMinimos(const v: numeros; var min1, min2: integer; var pos1, pos2: integer);
var
  i: integer;
begin
  min1 := MaxInt;
  min2 := MaxInt;
  pos1 := -1;
  pos2 := -1;
  for i := 1 to DF do begin
    if (v[i] < min1) then begin
      min2 := min1;
      pos2 := pos1;
      min1 := v[i];
      pos1 := i;
    end
    else if (v[i] < min2) then begin
      min2 := v[i];
      pos2 := i;
    end;
  end;
end;

var
  vector: numeros;
  promedio, porcNeg, porcPos: real;
  rangoMin, rangoMax, cantRango: integer;
  min1, min2, pos1, pos2: integer;

begin
  writeln('--- CARGA DEL VECTOR ---');
  cargarVector(vector);
  
  writeln;
  writeln('--- ESTADISTICAS ---');
  calcularEstadisticas(vector, promedio, porcNeg, porcPos);
  writeln('Promedio de los valores: ', promedio:0:2);
  writeln('Porcentaje de numeros negativos: ', porcNeg:0:2, '%');
  writeln('Porcentaje de numeros positivos: ', porcPos:0:2, '%');

  writeln;
  writeln('--- BUSQUEDA EN RANGO ---');
  write('Ingrese el limite inferior del rango: ');
  readln(rangoMin);
  write('Ingrese el limite superior del rango: ');
  readln(rangoMax);
  cantRango := contarEnRango(vector, rangoMin, rangoMax);
  writeln('Cantidad de elementos en el rango [', rangoMin, ', ', rangoMax, ']: ', cantRango);

  writeln;
  writeln('--- MINIMOS ---');
  encontrarDosMinimos(vector, min1, min2, pos1, pos2);
  writeln('Primer minimo: ', min1, ' en la posicion ', pos1);
  writeln('Segundo minimo: ', min2, ' en la posicion ', pos2);
  
  writeln;
  writeln('Presione Enter para salir...');
  readln; 
end.