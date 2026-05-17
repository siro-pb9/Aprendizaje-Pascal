{ a) Implemente un módulo que permita imprimir los últimos dígitos de un número en orden inverso.
El módulo debe recibir el número y la cantidad de dígitos a imprimir. Si recibe el número 1954 y la
cantidad 3, debe imprimir en este orden: 4 - 5 - 9.
* b) Escriba un programa que lea números enteros por teclado hasta que llegue el número 0. Utilice
el módulo implementado en a) para imprimir los últimos 3 y 5 dígitos de cada número ingresado. }

program practica7modulo3;
const
    FIN = 3;
    FIN2 = 5;
var
    num: integer;

procedure invertir(numero, mostrar: integer);
var
    digito, i: integer;
begin
    for i := 1 to mostrar do
    begin
        digito := numero mod 10;
        write(digito, ' - ');
        numero := numero div 10;
    end;
end;

begin // programa principal
num := 1;
while num <> 0 do begin
    writeln('Introduzca el numero a procesar:');
    readln(num);

    invertir(num, FIN);
    writeln;
    invertir(num, FIN2);
    writeln;
    writeln('Introduzca el numero "0" para salir, o cualquier otro para continuar:');
    readln(num);
    end;
end.

// el incicio a es solo:
{program practica7modulo3;

var
    num, cant: integer;

procedure invertir(numero, mostrar: integer);
var
    digito, i: integer;
begin
    for i := 1 to mostrar do
    begin
        digito := numero mod 10;
        write(digito, ' - ');
        numero := numero div 10;
    end;
end;

begin // programa principal
writeln('Introduzca el numero:');
readln(num);
writeln('Introduzca la cantidad de caracteres a mostrar:');
readln(cant);


invertir(num, cant);
readln;
end.}
