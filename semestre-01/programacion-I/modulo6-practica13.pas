{Construir un programa que lee desde teclado una secuencia de números reales hasta que se
introduzca el 50. Informar los 8 números mayores de la secuencia.
Nota: Implemente la solución sin almacenar TODOS los números leídos}

program modulo6practica13;

const
  FIN = 50;

type
  vNumeros = array[1..8] of real;

procedure procesarNumeros(var v: vNumeros; var dL: integer);
  var
    g, i, j, pos: integer;
    num: real;
  begin
    num := 0;
    pos := 0;
    for g := 1 to 8 do
      v[g] := -9999; 
    dL := 0;
    while num <> FIN do begin
      writeln('Introduzca un numero');
      readln(num);
      if num <> FIN then begin
        j := 1;
        while (j <= 8) and (num < v[j]) do 
          j := j + 1;
          pos := j;
        if (pos <= 8) then  begin
          dL := dL + 1;
          for i := 8 downto j + 1 do
            v[i]  := v[i - 1];
          v[j] := num;
        end;
      end;
    end;
    if dL > 8 then
      dL := 8;
  end;

procedure informar(const v: vNumeros; dL: integer); 
  var
    i: integer;
  begin
    for i := 1 to dL do
      writeln('Pos ',i,': ',v[i]:0:2);
  end;

var
  num: vNumeros;
  dimL: integer;

begin
  procesarNumeros(num, dimL);
  informar(num, dimL);
  readln;
end.