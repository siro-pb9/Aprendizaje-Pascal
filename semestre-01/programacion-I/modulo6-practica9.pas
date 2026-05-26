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

begin
end.