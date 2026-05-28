{Realizar un módulo que reciba un vector A y dos valores I, J. El módulo debe devolver el vector A del
cual se suprimen las componentes que se encuentran entre las posiciones I y J (inclusive las
componentes de dichas posiciones).}

program modulo7practica2;

const FIN = 10;
type vNumeros = array[1..FIN] of integer;

procedure leerVector(var v:vNumeros; var dL: integer);
  var
    i: integer;
  begin
    for i := 1 to FIN do begin
      writeln('introduzca un numero');
      readln(v[i]);
    end;
  dl := FIN;
  end;

procedure suprimirComponentes(var v: vNumeros; i, j: integer; var dL: integer);
  var
    g, cant: integer;
  begin
    if (i >= 1) and (j <= dL) and (i <= j) then begin
      cant := (j - i) + 1;
      for g := (j + 1) to dL do
        v[g - cant] := v[g];
      dL := dL - cant;
    end;
  end;