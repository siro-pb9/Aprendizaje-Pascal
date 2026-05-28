{Dada una matriz de números enteros de 50 x 50, realizar un programa para:
a) Imprimir los elementos de las filas impares de la matriz.
b) Imprimir los elementos de las columnas pares de la matriz.
c) Imprimir los elementos de la diagonal principal.}

program modulo7practica5;

const 
  FIN = 50;

type
  mNumeros = array[1..FIN, 1..FIN] of integer;

procedure llenarMatriz(var m: mNumeros); // procedure para llenar automaticamente la matriz para probarla
  var 
    i, j: integer;
  begin
    for i := 1 to FIN do
      for j := 1 to FIN do
        m[i, j] := (i * 10) + j;
  end;


procedure filasImpares(const m: mNumeros); 
  var
    i, j: integer;
  begin
    i := 1;
    while i <= FIN do begin
      for j := 1 to FIN do
        writeln(m[i, j]);
      i := i + 2;
    end;
  end;


procedure columnasPares(const m: mNumeros);
  var
    i, j: integer;
  begin
    j := 2;
    while j <= FIN do begin
      for i := 1 to FIN do
        writeln(m[i, j]);
      j := j + 2;
    end;
  end;

procedure diagonalPrincipal(const m: mNumeros);
  var
    i: integer;
  begin
    for i := 1 to FIN do begin
      writeln (m[i, i]);
    end;
  end;

procedure columnasPares2(const m: mNumeros); // otra forma de mostrar las columnas
  var
    i, j: integer;
  begin
    j := 2;
    for i := 1 to FIN do begin
      while j <= FIN do begin
        writeln(m[i, j]);
        j := j + 2;
      end;
      j := 2;
    end;
  end;


var
  num: mNumeros;

begin
  llenarMatriz(num);
  filasImpares(num);
  columnasPares(num);
  diagonalPrincipal(num);
  readln;
end.