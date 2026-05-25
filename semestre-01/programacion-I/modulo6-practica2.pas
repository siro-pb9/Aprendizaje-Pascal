{Una estación de servicio tiene 5 surtidores. Se requiere implementar un programa que
lea datos de la carga de combustible por teclado (monto cargado y número de surtidor).
La entrada de datos termina cuando se ingresa el surtidor 0. Finalizada la carga se
pide calcular e informar:
a) Monto total vendido por cada surtidor.
b) Surtidor que más vendió.
c) Promedio de venta entre todos los surtidores.}

program modulo6practica2;

type
  vSurtidores = array[1..5] of real;

procedure ponerCeros(var s: vSurtidores);
var
  i: integer;
begin
  for i := 1 to 5 do
    s[i] := 0;
end;

procedure surtidorMax(s: vSurtidores);
var
  max: real;
  maxsurt, i: integer;
begin
  max := -1.0;
  maxsurt := -1;
  for i := 1 to 5 do begin
    if s[i] > max then begin
      max := s[i];
      maxsurt := i;
    end;    
  end;
  writeln('El surtidor que mas vendio es el N° ', maxsurt, ' con un total de ', max:0:2);
end;

procedure promedio(s: vSurtidores);
var
  i: integer;
  suma: real;
begin
  suma := 0;
  for i := 1 to 5 do
    suma := suma + s[i];
  writeln('El promedio de monto de los 5 surtidores es ', (suma / 5):0:2);
end;

procedure informarTotales(s: vSurtidores);
var
  i: integer;
begin
  for i := 1 to 5 do begin
    writeln('El total de cargas del surtidor ', i, ' es ', s[i]:0:2);
  end;
end;

var
  surt: vSurtidores;
  numSurtidor: integer; 
  monto: real;

begin
  ponerCeros(surt);

  writeln('Ingrese numero de surtidor (1-5, o 0 para cortar): ');
  readln(numSurtidor);

  while (numSurtidor <> 0) do begin
    writeln('Ingrese el monto cargado: ');
    readln(monto);

    surt[numSurtidor] := surt[numSurtidor] + monto;

    writeln('Ingrese numero de surtidor (1-5, o 0 para cortar): ');
    readln(numSurtidor);
  end;

  writeln;
  informarTotales(surt);
  surtidorMax(surt);
  promedio(surt);

  readln;
end.
