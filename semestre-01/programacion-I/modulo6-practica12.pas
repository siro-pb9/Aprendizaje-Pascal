{Se dispone de un módulo que carga un vector con a lo sumo 600 nombres de personas, ordenados de forma ascendente.
Implemente módulos que reciban dicho vector y permitan:
a) Devolver la posición en la que se encuentra una persona cuyo nombre se recibe como parámetro.
Tener en cuenta que dicha persona puede no existir.
b) Insertar un nombre recibido en el vector conservando su orden. Recuerde validar el espacio.
c) Eliminar un nombre recibido del vector en caso de existir. Considere que no hay nombres
repetidos.
d) Modifique c) considerando ahora que puede haber repetidos (elimine todas las ocurrencias). }

program modulo6practica12;

const
  FIN = 600;

type
  str30 = string[30];
  vNombres = array[1..FIN] of str30;

procedure leerNombres(var v: vNombres; var dL: integer);
var
  i: integer;
begin
  dL := 0;
  for i := 1 to FIN do begin
    writeln('Introduzca el nombre ', i);
    readln(v[i]);
    dL := dL + 1;
  end;
end;

function encontrarNombre(const v: vNombres; dL: integer; nombre: str30): integer;
var
  i: integer;
begin
  i := 1;
  while (i <= dL) and (v[i] < nombre) do 
    i := i + 1;

  if (i <= dL) and (v[i] = nombre) then 
    encontrarNombre := i
  else
    encontrarNombre := -1;
end;

procedure insertarNombre(var v: vNombres; var dL: integer; nombre: str30; var exito: boolean);
var 
  i, pos: integer;
begin
  i := 1;
  if (dL < FIN) then begin    
    while (i <= dL) and (nombre > v[i]) do
      i := i + 1;
    pos := i;
    for i := dL downto pos do
      v[i + 1] := v[i];

    v[pos] := nombre;
    dL := dL + 1;
    exito := true;
  end
  else
    exito := false;
end;

procedure eliminarNombre(var v: vNombres; var dL: integer; nombre: str30; var exito: boolean);
var
  i, pos: integer;
begin
  i := 1;
  while (i <= dL) and (v[i] < nombre) do
    i := i + 1;
  
  if (i <= dL) and (v[i] = nombre) then begin
    pos := i;
    for i := pos to (dL - 1) do 
      v[i] := v[i + 1];

    dL := dL - 1;
    exito := true;
  end
  else
    exito := false;
end;

procedure eliminarTodos(var v: vNombres; var dL: integer; nombre: str30; var exito: boolean);
var
  i, j, cant: integer;
begin
  i := 1;
  cant := 0;
  while (i <= dL) and (v[i] < nombre) do 
    i := i + 1;
  if ((i <= dL) and (v[i] = nombre)) then begin
    while (i <= dL) and (v[i] = nombre) do begin
      i := i + 1;
      cant := cant + 1;  
    end;

    for j := i to dL do begin
      v[j - cant] := v[j];
    end;

    exito := true;
    dL := dL - cant;
  end
  else
    exito := false;
end;

var
  nombres: vNombres;
  dimL, pos: integer;
  exito: boolean;
begin
  writeln('--- PROBADOR DE NOMBRES ---');
  
  { Carga inicial simulada }
  dimL := 5;
  nombres[1] := 'Ana';
  nombres[2] := 'Carlos';
  nombres[3] := 'Gaston';
  nombres[4] := 'Maria';
  nombres[5] := 'Maria'; { Repetido para probar eliminarTodos }
  
  writeln('Nombres iniciales: Ana, Carlos, Gaston, Maria, Maria');
  writeln;
  
  pos := encontrarNombre(nombres, dimL, 'Gaston');
  writeln('Buscar "Gaston": posicion ', pos);
  
  pos := encontrarNombre(nombres, dimL, 'Daniel');
  writeln('Buscar "Daniel" (no existe): posicion ', pos);
  writeln;
  
  writeln('Insertando "Daniel" en orden...');
  insertarNombre(nombres, dimL, 'Daniel', exito);
  if exito then
    writeln('Lista nueva: ', nombres[1], ', ', nombres[2], ', ', nombres[3], ', ', nombres[4], ', ', nombres[5], ', ', nombres[6])
  else
    writeln('Error al insertar.');
  writeln;
    
  writeln('Eliminando "Carlos"...');
  eliminarNombre(nombres, dimL, 'Carlos', exito);
  if exito then
    writeln('Lista nueva: ', nombres[1], ', ', nombres[2], ', ', nombres[3], ', ', nombres[4], ', ', nombres[5])
  else
    writeln('Error al eliminar.');
  writeln;
  
  writeln('Eliminando todos los "Maria"...');
  eliminarTodos(nombres, dimL, 'Maria', exito);
  if exito then
    writeln('Lista nueva: ', nombres[1], ', ', nombres[2], ', ', nombres[3])
  else
    writeln('Error al eliminar todos.');
    
  writeln;
  writeln('Presione Enter para salir...');
  readln;
end.
