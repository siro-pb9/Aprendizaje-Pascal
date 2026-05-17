{Realizar un programa que lea 10 nombres de mascotas desde teclado. Cada nombre se ingresa
carácter a carácter y finaliza con un punto ('.'). Al finalizar la lectura de todos los nombres, se debe
informar:
a. Cuántos nombres eran válidos (un nombre es válido si está compuesto únicamente por letras
y posee al menos 3 caracteres).
b. Cuántos nombres válidos poseían al menos dos letras iguales consecutivas (ej. "Bobby",
"Peppa", distinguiendo mayúsculas de minúsculas).
c. La longitud (cantidad de caracteres) del nombre válido más largo ingresado.
Requerimientos de implementación:
• Realizar los módulos necesarios para procesar cada nombre.
• El ingreso de cada nombre finaliza al procesar el carácter punto ('.').
• Un nombre es válido solo si contiene letras (A..Z, a..z) y su longitud es mayor o igual a 3.
• Debe distinguir entre mayúsculas y minúsculas para evaluar las letras consecutivas (Ll es
inválido).}

program CiroViolaIntegrador;
const
  FIN = 10;

var
  i, maslargo, validos, letrascon, cant: integer;
  nombre: char;
  palabravalida, letrasconsecutivas: boolean;

procedure ProcesarNombre(var c: char; var cantletras: integer; var valido: boolean; var letrasiguales: boolean);
const
  MIN = 3;
var
  antcar: char;

begin
  cantletras := 0;
  valido := true;
  letrasiguales := false;
  antcar := ' '; 
  while (c <> '.') do begin

    if ((c >= 'A') and (c <= 'Z')) or ((c >= 'a') and (c <= 'z')) then
    begin
      cantletras := cantletras + 1; // contar letras
      if antcar = c then
        letrasiguales := true;  
    end

    else
      valido := false; // si el caracter leido no es una letra, no es valido
  antcar := c; // esto para ver si tiene letras iguales consecutivas
  read(c);
  end;

  if cantletras < MIN then // ver si tiene mas de 3 caracteres
    valido := false;
end;

// inicio del programa
begin
  maslargo := 0;
  validos := 0;
  letrascon := 0;
  for i := 1 to FIN do // como se sabe la cantidad maxima de nombres, se usa for
  begin
  cant := 0;
  writeln('Ingrese el nombre de la mascota ', i, ':');
  read(nombre);
  palabravalida := true;
  letrasconsecutivas := false;
  ProcesarNombre(nombre, cant, palabravalida, letrasconsecutivas);
  readln; // para limpiar el enter que se presiona al ingresar cada nombre

// area de procesamiento de cada nombre
  if palabravalida then // sumar contador de nombres validos
    begin
      validos := validos + 1;
      if letrasconsecutivas then // sumar contador de nombres con letras iguales consecutivas
      letrascon := letrascon + 1;
      if cant > maslargo then // si el nombre actual es mas largo que el que ya habia, entonces se suplanta por el nuevo
      maslargo := cant;
    end;
  end;

  writeln;
  writeln('==== RESULTADOS ====');
  writeln('Cantidad de nombres validos: ', validos);
  writeln('Cantidad de nombres validos con al menos dos letras iguales consecutivas: ', letrascon);
  writeln('Longitud del nombre valido mas largo ingresado: ', maslargo);
  writeln('Catalogo huellitas felices - UNLP facultad de Informatica - 2026');
  writeln;
  writeln('Presione Enter para finalizar...');
  readln;
end.