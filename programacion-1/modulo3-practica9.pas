{a) Escriba un procedimiento que lea la estatura de una cantidad de personas y devuelva el
promedio de estas. La cantidad de personas se recibe como parámetro.
b) Escriba un programa que procese la estatura de 25 personas utilizando el módulo desarrollado en
a) e informe el resultado}

program practica9;
const
    FIN = 25;
var
    promediofinal: real;
procedure promedio(cant: integer; var promFinal: real);
var
    estatura, suma: real;
    i: integer;
begin
    suma := 0;
    for i := 1 to cant do begin
        writeln('Escriba la estatura de la persona ',i,' de 25');
        readln(estatura);

        suma := suma + estatura;
    end;
    promfinal := suma / cant;
end;

begin
    promediofinal := 0;
    promedio(FIN, promediofinal);
    writeln('El promedio de altura es: ',promediofinal:0:2);
    readln;
    readln;
end.