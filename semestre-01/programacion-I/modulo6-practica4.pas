{Realizar todas las modificaciones necesarias al ejercicio 3 para el caso que la carga de caracteres
termine cuando se lea el carácter ‘.’ o hasta que se almacenen los 1024 caracteres (tener en cuenta
que en el vector se pueden cargar como máximo 1024 valores). Declare una constante que
represente el valor de fin de la lectura desde teclado (en este caso el punto).}

program modulo6practica4;

const
  FIN = 1024;
  VOCALES = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
  FIN2 = '.';

type
  caracter = array[1..FIN] of char;

procedure leerCaracter(var c: caracter; var dl: integer); 
var
  car: char;
begin
  dl := 0; 
  writeln('Introduzca un caracter: ');
  readln(car); 

  while (car <> FIN2) and (dl < FIN) do begin
    dl := dl + 1;  
    c[dl] := car;  
    if (dl < FIN) then begin
      writeln('Introduzca un caracter: ');
      readln(car);
    end;
  end;
end;

procedure procesarConsonantes(const c: caracter; dL: integer);
var
  i, sumaCon, sumaTot: integer;
begin
  sumaCon := 0;
  sumaTot := 0;
  for i := 1 to dL do begin
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

procedure procesarIncisoB(const c: caracter; dL: integer);
var
  i, digitos, mayus, minus: integer;
begin
  digitos := 0;
  mayus := 0;
  minus := 0;
  
  for i := 1 to dL do begin
    if (c[i] in ['0'..'9']) then 
      digitos := digitos + 1
    else if (c[i] in ['A'..'Z']) then 
      mayus := mayus + 1
    else if (c[i] in ['a'..'z']) then 
      minus := minus + 1;
  end;
  
  if (dl <> 0) then begin
    writeln('Cantidad de digitos: ', digitos);
    writeln('Porcentaje de digitos: ', (digitos * 100) / dL:0:2, '%');
    
    writeln('Cantidad de letras mayusculas: ', mayus);
    writeln('Porcentaje de letras mayusculas: ', (mayus * 100) / dL:0:2, '%');
    
    writeln('Cantidad de letras minusculas: ', minus);
    writeln('Porcentaje de letras minusculas: ', (minus * 100) / dL:0:2, '%');
  end;
end;

var
  c: caracter;
  dimL: integer;
begin
  leerCaracter(c, dimL);
  procesarConsonantes(c, dimL);
  procesarIncisoB(c, dimL);
end.