{a) Escriba un módulo que reciba 2 números enteros i y n, y calcule la potencia enésima de i ($i^n$).
b) Escriba un programa que invoque el módulo de a) para que calcule el cuadrado de un número i ($i^2$), el cubo de un número i ($i^3$) y la potencia enésima de 2 ($2^n$).} 

program practica1;

var
    Numi, Numn: integer;

function resultado(i, n: integer): integer;
var
    ciclo, result: integer;
begin
    result := 1;  
        for ciclo := 1 to n do
            result := result * i ;
    resultado := result;
end;

begin
    writeln('Escriba un numero "i" para calcular su cuadrado y su cubo: ');
    readln(numI);
    writeln('El cuadrado es: ', resultado(numi, 2)); 
    
    writeln('El cubo es: ', resultado(numI, 3));
    writeln;

    
    writeln('Escriba una potencia "n" para elevar el numero 2: ');
    readln(numN);
    writeln('2 elevado a la ', numN, ' es: ', resultado(2, numN));
    readln;
end.
