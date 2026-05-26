{Simular el funcionamiento de un conjunto de caracteres de la ‘a’ a la ‘z’ utilizando un arreglo. Defina
un tipo de datos adecuado e implemente módulos que realicen las operaciones de unión y diferencia
de dos conjuntos y una función que permite determinar si una letra pertenece al conjunto.
Nota: realice los chequeos correspondientes en cada módulo para procesar solo letras. }

program modulo6practica9;

type
  vConjunto = array['a'..'z'] of boolean;

procedure inicializarConjunto(var c: vConjunto);
var
  i: char;
begin
  for i := 'a' to 'z' do 
    c[i] := false;
end;

function pertenece(const c: vConjunto; letra: char): boolean;
begin
  pertenece := false;
  if (letra in ['a'..'z']) then 
    pertenece := c[letra];
end;

procedure unionConjuntos(const a, b: vConjunto; var c: vConjunto);
var
  i: char;
begin
  for i := 'a' to 'z' do
    c[i] := a[i] or b[i];
end;

procedure diferenciaConjuntos(const a, b: vConjunto; var c: vConjunto);
var
  i: char;
begin
  for i := 'a' to 'z' do
    c[i] := a[i] and not b[i];
end;

var
  conjA, conjB, conjU, conjD: vConjunto;
  letra: char;
begin
  inicializarConjunto(conjA);
  inicializarConjunto(conjB);
  
  { Carga de prueba del conjunto A: { a, b, c, d } }
  conjA['a'] := true;
  conjA['b'] := true;
  conjA['c'] := true;
  conjA['d'] := true;
  
  { Carga de prueba del conjunto B: { c, d, e, f } }
  conjB['c'] := true;
  conjB['d'] := true;
  conjB['e'] := true;
  conjB['f'] := true;
  
  writeln('--- TEST DE CONJUNTOS ---');
  writeln('Conjunto A: { a, b, c, d }');
  writeln('Conjunto B: { c, d, e, f }');
  writeln;
  
  unionConjuntos(conjA, conjB, conjU);
  write('Union (A + B): ');
  for letra := 'a' to 'z' do
    if pertenece(conjU, letra) then
      write(letra, ' ');
  writeln;
  
  diferenciaConjuntos(conjA, conjB, conjD);
  write('Diferencia (A - B): ');
  for letra := 'a' to 'z' do
    if pertenece(conjD, letra) then
      write(letra, ' ');
  writeln;
  
  writeln;
  writeln('Presione Enter para salir...');
  readln;
end.