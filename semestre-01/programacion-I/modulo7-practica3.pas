{Realizar un módulo que reciba dos vectores A y B y un valor I, y que devuelva el vector A en el que
se insertan las componentes del vector B entre las componentes I e I+1 del vector A. Se debe validar
que el parámetro I esté en un rango permitido.}

program modulo7practica3;

const
  FIN = 20;
  FIN2 = 10;

type
  vectorA = array[1..FIN] of integer;
  vectorB = array[1..FIN] of integer;

procedure leerVectores(var vA: vectorA; var vB: vectorB; var dLA, dLB: integer);
  var
    i: integer;
  begin
    for i := 1 to FIN2 do begin
      writeln('introduzca un numero');
      readln(vA[i]);
    end;
    for i := 1 to FIN2 do begin
      writeln('introduzca un numero');
      readln(vB[i]);
    end;
  dlA := FIN2;
  dlB := FIN2;
  end;

procedure implementar(var vA: vectorA; const vB: vectorB; i, dLB: integer; var dLA: integer; var exito: boolean);
  var
    j: integer;
  begin 
    exito := false;
    if (I >= 1) and (I <= dLa) and ((dLA + dLB) <= FIN) then begin
      for j := dlA downto i + 1 do
        vA[j + dlB] := vA[j];
      for j := (i + 1) to (i + dlB) do 
        vA[j] := vB[j - i];
      exito := true;
      dLA := dLA + dLB;
    end;
  end;

procedure cargarVectoresParaProbar(var vA: vectorA; var dLA: integer; var vB: vectorB; var dLB: integer);
  var 
    i: integer;
  begin
    dLA := 10;
    dLB := 10;
    for i := 1 to dLA do
      vA[i] := i * 10;
    for i := 1 to dLB do
      vB[i] := (i * 10) - 5;
  end;

var 
  vecA: vectorA;
  vecB: vectorB;
  dimlA, dimlB, i: integer;
  exito: boolean;
begin
  cargarVectoresParaProbar(vecA, dimlA, vecB, dimlB); // Para probar el programa sin cargar datos manualmente
  writeln('escriba un numero');                       // Si queremos cargar los datos manualmente, reemplaazmos la linea 64 por: leerVectores(vecA, vecB, dimlA, dimlB);
  readln(i);
  implementar(vecA, vecB, i, dimlB, dimlA, exito);
  if exito then begin
    for i := 1 to dimlA do
      writeln(vecA[i]);
  end
  else
    writeln('error, El numero se excede de dimlA');
end.