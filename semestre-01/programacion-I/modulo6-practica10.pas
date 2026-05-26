{ Implementar 2 versiones de un módulo que cuente la cantidad de palabras que hay en un arreglo de
caracteres con un máximo de 130 elementos:
a) Implementar una versión del módulo que tenga en cuenta una dimensión lógica para indicar la
posición del último carácter.
b) Implementar una versión del módulo que asuma que el último carácter es punto.
Nota: en ambos casos, por seguridad, realice las verificaciones para no pasarse de la longitud máxima.}

program modulo6practica10;

const
  FIN = 130;

type 
  frase = array[1..FIN] of char;

procedure leerFrase(var f: frase; var dL: integer); 
var
  car: char;
begin
  dL := 0;
  writeln('Ingrese la frase caracter por caracter (presione Enter despues de cada uno y termine con punto "."):');
  readln(car);
  while (dL < FIN) and (car <> '.') do begin
    dL := dL + 1;
    f[dL] := car;
    if (dL < FIN) then
      readln(car);
  end;
  if (dL < FIN) and (car = '.') then begin
    dL := dL + 1;
    f[dL] := '.';
  end;
end;

function procesarFraseA(const f: frase; dimL: integer): integer;
var
  i, cantPalabras: integer;
begin
  cantPalabras := 0;
  i := 1;
  while i <= dimL do begin
      while (i <= dimL) and (f[i] = ' ') do 
        i := i + 1;
      if i <= dimL then begin
        cantPalabras := cantPalabras + 1;
        while (i <= dimL) and (f[i] <> ' ') do
        i := i + 1;
    end;
  end;
  procesarFraseA := cantPalabras;
end;

function procesarFraseB(const f: frase): integer;
var
  i, cantPalabras: integer;
begin
  i := 1;
  cantPalabras := 0;
  while (i <= FIN) and (f[i] <> '.') do begin
    while (i <= FIN) and (f[i] = ' ') do
      i := i + 1;
    if (i <= FIN) and (f[i] <> '.') then begin
      cantPalabras := cantPalabras + 1;
      while (i <= FIN) and (f[i] <> '.') and (f[i] <> ' ') do
        i := i + 1;
    end;
  end;
  procesarFraseB := cantPalabras;
end;

var
  f: frase;
  dimL, cantA, cantB: integer;
begin
  leerFrase(f, dimL);
  
  cantA := procesarFraseA(f, dimL);
  writeln('La cantidad de palabras (Metodo A) es: ', cantA);
  
  cantB := procesarFraseB(f);
  writeln('La cantidad de palabras (Metodo B) es: ', cantB);
  
  writeln;
  writeln('Presione Enter para salir...');
  readln;
end.


