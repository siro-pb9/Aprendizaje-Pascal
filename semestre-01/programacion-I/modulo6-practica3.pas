{Se requiere analizar un fragmento de código fuente que contiene FIN caracteres.
Realizar un programa que lea de teclado y cargue un vector los caracteres por teclado.
Finalizada la carga informar:
a) La cantidad y porcentaje de consonantes sobre el total de caracteres alfabéticos.
b) La cantidad y porcentaje de caracteres que son: dígitos, letras mayúsculas y letras minúsculas sobre
el total de caracteres ingresados.}

program modulo6practica3;

const
  FIN = 1024;
  VOCALES = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];

type
  caracter = array[1..FIN] of char;

procedure leerCaracter(var c: caracter); 
var
  i: integer;
begin
  for i := 1 to FIN do begin
    writeln('Introduzca un caracter: ');
    readln(c[i]); // Leer el final del codigo, hay una explicacion sobre esta linea.
  end;
end;

procedure procesarConsonantes(var c: caracter);
var
  i, sumaCon, sumaTot: integer;
begin
  sumaCon := 0;
  sumaTot := 0;
  for i := 1 to FIN do begin
    if (c[i] in ['a'..'z', 'A'..'Z']) then begin
      sumaTot := sumaTot + 1;
      if not (c[i] in VOCALES) then
        sumaCon := sumaCon + 1;
    end;
  end;
  writeln('La cantidad de consonantes es ', sumaCon);
  if (sumaTot > 0) then
    writeln('El porcentaje de consonantes es ', (sumaCon * 100) / sumaTot:0:2, '%');
end;

procedure procesarIncisoB(const c: caracter); { se usa const cuando solo vas a leer el vector }
var
  i, digitos, mayus, minus: integer;
begin
  digitos := 0;
  mayus := 0;
  minus := 0;
  
  for i := 1 to FIN do begin
    if (c[i] in ['0'..'9']) then 
      digitos := digitos + 1
    else if (c[i] in ['A'..'Z']) then 
      mayus := mayus + 1
    else if (c[i] in ['a'..'z']) then 
      minus := minus + 1;
  end;
  
  writeln('Cantidad de digitos: ', digitos);
  writeln('Porcentaje de digitos: ', (digitos * 100) / FIN:0:2, '%');
  
  writeln('Cantidad de letras mayusculas: ', mayus);
  writeln('Porcentaje de letras mayusculas: ', (mayus * 100) / FIN:0:2, '%');
  
  writeln('Cantidad de letras minusculas: ', minus);
  writeln('Porcentaje de letras minusculas: ', (minus * 100) / FIN:0:2, '%');
end;

var
  c: caracter;
begin
  leerCaracter(c);
  procesarConsonantes(c);
  procesarIncisoB(c);
end.

{en la lina 23 se usa un "readln" en lugar de "read", esto porque readln
 guarda el buffer ( el enter al igresar un caracter) en memoria y eso se considera
 basura en la memoria. en cambio el readln lee el caracter que necesitas y
 descarta todo lo demas. de esa forma el buffer queda vacio para la siguiente iteracion}