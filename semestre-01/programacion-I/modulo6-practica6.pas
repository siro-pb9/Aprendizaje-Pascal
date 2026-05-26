{Una cátedra dispone de información de sus 1000 estudiantes. De cada estudiante se conoce: número
de legajo, apellido, nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada
por apellido de manera ascendente. Se pide que implemente:
a) Un módulo que retorne la posición del estudiante con un número de legajo recibido por parámetro
o debe retornar -1 si no existe.
b) Un módulo que informe apellido, nombre y número de legajo de todos los estudiantes cuyo número
de legajo es múltiplo de un número que se recibe como parámetro.
c) Un módulo que retorne la cantidad de estudiantes con cantidad de asistencias a clase en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos.}

program modulo6practica6;

const
  FIN = 5;

type
  fichaEstudiante = record
    apellido: string[30];
    nombre: string[30];
    legajo: longint;
    asistencias: integer;
  end;

  vEstudiantes = array[1..FIN] of fichaEstudiante;

procedure leerEstudiante(var e: vEstudiantes); // ESTE MODULO LO USAMOS SOLO PARA TESTEAR
var                                            // YA QUE SEGUN EL ENUNCIADO, LOS DATOS 
  i: integer;                                  // YA ESTAN INGRESADOS PREVIAMENTE. 
begin
  for i := 1 to FIN do begin
    writeln('Introduzca el apellido del estudiante');
    readln(e[i].apellido);
    writeln('Introduzca el nombre del estudiante');
    readln(e[i].nombre);
    writeln('Introduzca el legajo del estudiante');
    readln(e[i].legajo);
    writeln('Introduzca la cantidad de asistencias del estudiante');
    readln(e[i].asistencias);
    writeln('ESTUDIANTE ',i,' LEIDO');
  end;
end;

function buscarLegajo(const e: vEstudiantes; leg: longint): integer; 
var
  i: integer;
  encontrado: boolean;
begin
  i := 1;                     
  encontrado := false;
  
  while (i <= FIN) and (not encontrado) do begin
    if (e[i].legajo = leg) then
      encontrado := true
    else
      i := i + 1; // De esta forma, solo avanzamos a la siguiente columna si no encontramos el legajo
  end;
  
  if (encontrado) then
    buscarLegajo := i
  else
    buscarLegajo := -1;
end;

procedure informarMultiplos(const v: vEstudiantes; numero: integer);
var
  i: integer;
begin
  for i := 1 to FIN do begin
    if ((v[i].legajo mod numero) = 0) then
      writeln(v[i].apellido,' ',v[i].nombre,' - ',v[i].legajo);
  end;
end;

function ceroAsistencias(const v: vEstudiantes): integer;
var
  i, suma: integer;
begin
  suma := 0;
  for i := 1 to FIN do begin
    if (v[i].asistencias = 0) then
      suma := suma + 1;
  end;
  ceroAsistencias := suma;
end;

var
  estudiantes: vEstudiantes;
  legajo: longint;
  num: integer;
begin
  leerEstudiante(estudiantes);
  writeln('Presione enter para proceder con busqueda por legajo');
  readln;
  writeln('Introduzca el legajo a buscar: ');
  readln(legajo);
  writeln('el estudiante esta en la posicion ', buscarLegajo(estudiantes, legajo));
  writeln('Presione enter para proceder con la verificacion por numero');
  readln;
  writeln('Introduzca el numero:');
  readln(num);
  informarMultiplos(estudiantes, num);
  writeln('Presione enter para proceder con las asistencias.');
  readln;
  writeln(ceroAsistencias(estudiantes),' Estudiantes con 0 asistencias');
  readln;
end.
