{ Desarrolle un programa que solicite al usuario las dimensiones
en cm (largo, ancho y altura) para construir una pecera. El
programa debe calcular e informar: la capacidad total de agua
en cm3 que puede contener y la cantidad de material necesario
para construir la pecera (sin contar la tapa superior). Implemente
una estructura de datos apropiada y divida su solución en
módulos.}

program practicas;

type
  fichaPecera = record
    L: longint;
    A: longint;
    H: longint;
  end;

procedure cargarmedidas(var medidas: fichaPecera);
begin
    writeln('Ingrese la longitud en cm:');
    readln(medidas.L);
    writeln('Ingrese el ancho en cm:');
    readln(medidas.A);
    writeln('Ingrese la altura en cm:');
    readln(medidas.H);
end;

{ Función 1: Calcula el volumen de agua }
function calcularVolumen(p: fichaPecera): longint;
var
  result: longint;
begin
    result := p.L*p.A*p.H;
    calcularVolumen := result;
end;

{ Función 2: Calcula el vidrio necesario (sin tapa) }
function calcularVidrio(p: fichaPecera): longint;
var
  result: longint;
begin
    { COMPLETA ACÁ: Base + 2*(Frente) + 2*(Lateral) usando p }
    result := p.L*p.A + 2*(p.L*p.H) + 2*(p.A*p.H);
    calcularVidrio := result
end;

{ --- PROGRAMA PRINCIPAL --- }
var
    miPecera: fichaPecera;
begin
    { 1. Mandamos al empleado a pedir los datos }
    cargarmedidas(miPecera);
    
    writeln('--------------------------------');
    
    { 2. Llamamos a las calculadoras e imprimimos }
    writeln('La capacidad de agua es: ', calcularVolumen(miPecera), ' cm3');
    writeln('El material necesario es: ', calcularVidrio(miPecera), ' cm2');
    
    readln;
end.
  