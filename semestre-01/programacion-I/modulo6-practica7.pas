{Se procesa información de las farmacias del Gran La Plata correspondiente a un mes determinado.
De cada farmacia se conoce: código, nombre, dirección, localidad y todas las obras sociales con las
que trabaja. Para cada obra social se dispone de su código (1: IOMA, 2: PAMI, ..., 35: Swiss Medical)
y la facturación correspondiente a dicha obra social durante ese mes. Además, se dispone de una
estructura que permite acceder al nombre de la obra social a partir de su código.
a) Se deben leer y almacenar las farmacias hasta que se ingrese una casa cuyo nombre sea "ZZZ".
Esta farmacia también debe procesarse. Utilizar una estructura adecuada sabiendo que a lo
sumo hay 120 farmacias.
b) Con la estructura generada en a), calcular la facturación total acumulada para cada obra social
(códigos 1 a 35), considerando únicamente aquellas farmacias cuyo código, interpretado como
un número entero, no contiene dígitos repetidos.}

program modulo6practica7;

const
  FIN = 'ZZZ';

type
  vFacturacion = array[1..35] of real;

  FichaFarmacia = record
    codigo: integer;
    nombre: string[30];
    direccion: string[30];
    localidad: string[30];
    obrasSociales: vFacturacion; 
  end;

  vFarmacias = array[1..120] of FichaFarmacia;

procedure leerFacturaciones(var v: vFacturacion);
var
  i: integer;
begin
  for i := 1 to 35 do begin
    writeln('introduzca la facturacion de la obra social ',i);
    readln(v[i]);
  end;
end;

procedure leerFarmacia(var v: vFarmacias; var dimL: integer);
begin
  dimL := 0;
  repeat
    dimL := dimL + 1;
    writeln('introduzca el nombre de la farmacia:');
    readln(v[dimL].nombre);
    writeln('introduzca el codigo de la farmacia:');
    readln(v[dimL].codigo);
    writeln('introduzca la direccion de la farmacia:');
    readln(v[dimL].direccion);
    writeln('introduzca la localidad de la farmacia:');
    readln(v[dimL].localidad);
    leerFacturaciones(v[dimL].obrasSociales);
  until ((v[dimL].nombre = FIN) or (dimL = 120));
end;

function tieneRepetidos(num: integer): boolean; 
type
  r = array[0..9] of integer;
var
  contador: r;
  i, digito: integer;
begin
  tieneRepetidos := false;
  for i := 0 to 9 do
    contador[i] := 0;
  while (num > 0) and (not tieneRepetidos) do begin
    digito := num mod 10;
    if (contador[digito] < 1) then
      contador[digito] := contador[digito] + 1
    else if (contador[digito] > 0) then
      tieneRepetidos := true;
    num := num div 10;
  end;
end;

procedure calcularTotal(const farm: vFarmacias; dimL: integer);
var
  i, j: integer;
  totalesOS: vFacturacion;
begin
  for j := 1 to 35 do 
    totalesOS[j] := 0;
    for i := 1 to dimL do begin
      if not tieneRepetidos(farm[i].codigo) then begin
      for j := 1 to 35 do begin
          totalesOS[j] := totalesOS[j] + farm[i].obrasSociales[j];
      end;
    end;
  end;
  for j := 1 to 35 do
    writeln('La suma de la obra social ',j,' es de ',totalesOS[j]:0:2);
end;

var
  farmaciasLaPlata: vFarmacias;
  cantidadFarmacias: integer;
begin
  writeln('--- SISTEMA DE FARMACIAS ---');
  leerFarmacia(farmaciasLaPlata, cantidadFarmacias);
  
  writeln;
  writeln('--- REPORTE DE FACTURACION ---');
  calcularTotal(farmaciasLaPlata, cantidadFarmacias);
  
  readln;
end.