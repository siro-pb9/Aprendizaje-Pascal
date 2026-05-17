{ La administración que realiza la 49 edición de la Feria del Libro desea
conocer la información de los libros más vendidos. De cada libro se conoce:
título, autor/a, ISBN, género, precio y fecha de publicación (día, mes y año).
Implementar un programa que realice la lectura de los libros, dicha lectura
finaliza con el libro titulado “De amor y de sombra” el cual debe procesarse.
Se pide:
a) Informar título, ISBN y autor de aquellos libros publicados entre el 15 de marzo de
2025 y el 15 de julio de 2025.
b) Informar el porcentaje de libros cuyo precio es menor a 12.000 pesos.
c) Informar la cantidad de libros pertenecientes al género “Novela” y en donde la suma
de los dígitos del año sea par. }

program modulo4practica7;

const
    FIN = 'De amor y de sombra';

type

    fichaFecha = record
        dia: 1..31;
        mes: 1..12;
        anio: integer;
    end;

    fichaLibro = record
        titulo: string[30];
        autor: string[30];
        ISBN: longint;
        genero: string[30];
        precio: real;
        publicacion: fichaFecha;
    end;

procedure leerFicha(var f: fichaLibro); 
begin
    writeln('Ingrese el titulo:');
    readln(f.titulo);
    writeln('Ingrese el autor:');
    readln(f.autor);
    writeln('Ingrese el ISBN:');
    readln(f.ISBN);
    writeln('Ingrese el genero:');
    readln(f.genero);
    writeln('Ingrese el precio:');
    readln(f.precio);
    writeln('Ingrese el dia de publicacion:');
    readln(f.publicacion.dia);
    writeln('Ingrese el mes de publicacion:');
    readln(f.publicacion.mes);
    writeln('Ingrese el anio de publicacion:');
    readln(f.publicacion.anio);
end;

function verificacion(f: fichaFecha): boolean; 
begin
    verificacion := (f.anio = 2025) and ((f.mes > 3) or ((f.mes = 3) and (f.dia >= 15))) and ((f.mes < 7) or ((f.mes = 7) and (f.dia <= 15)));
end;

function menora12(p: real): boolean; begin
  menora12 := (p < 12000);
end;

function espar(a: integer): boolean;
  var
  suma: integer;
  
  begin
  suma := 0;
  while (a <> 0) do begin
    suma := suma + (a mod 10);
    a := a div 10;
  end;
  espar := (suma mod 2 = 0);
  end;

var
  libro: fichaLibro;
  suma, sumatot, sumapar: integer;
  
begin
  sumatot := 0;
  suma := 0;
  sumapar := 0;
repeat
  

  leerFicha(libro);
  sumatot := sumatot + 1;
  if verificacion(libro.publicacion) then
    writeln(libro.titulo,  '-' , libro.ISBN, '-', libro.autor);
  if menora12(libro.precio) then
    suma := suma + 1;
  if (libro.genero = 'Novela') and espar(libro.publicacion.anio) then
    sumapar := sumapar + 1;
until (libro.titulo = FIN);
writeln('el porcentaje de libros que valen menos de 12000 es de ', (suma * 100) / sumatot:0:2, '%');
writeln('la cantidad de libros cuyq suma de numeros de sus años es par es: ', sumapar);
end.