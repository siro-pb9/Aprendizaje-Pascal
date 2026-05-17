{codigo en pascal}
program practicas9;

const
    FIN = -1;
var
    meses, cantmay, cantmen, i: integer;
    menorpeso, maximopeso, pesopromediomenor, pesopromediomayor, peso, sumamay, sumamen: real;

begin
maximopeso := -1;
menorpeso := 9999;
sumamay := 0;
sumamen := 0;
cantmay := 0;
cantmen := 0;

    while true do
    begin
        writeln('Ingrese cantidad de meses de la embarazada:');
        readln(meses);
        if meses = FIN then
            break;

        if meses >= 6 then
        begin
        for i := 1 to meses do
        begin
            writeln('ingrese peso del bebe en el mes ', i, ' (en gramos):');
            readln(peso);
            sumamay := sumamay + peso;
            cantmay := cantmay + 1;
            if peso > maximopeso then
                maximopeso := peso;
        end;
        i := 1;
        end

        else if
        meses < 6 then
        begin
        for i := 1 to meses do
        begin
            writeln('ingrese peso del bebe en el mes ', i, ' (en gramos):');
            readln(peso);
            sumamen := sumamen + peso;
            cantmen := cantmen + 1;
            if peso < menorpeso then
                menorpeso := peso;
        end;
        i := 1;
        end;

    pesopromediomayor := sumamay / cantmay;
    pesopromediomenor := sumamen / cantmen;

    writeln('El peso promedio de los bebes con mas de 6 meses es: ', pesopromediomayor:0:2);
    writeln('El peso maximo es: ', maximopeso:0:2,' gramos');
    writeln('El peso promedio de los bebes con menos de 6 meses es: ', pesopromediomenor:0:2);
    writeln('El peso minimo es: ', menorpeso:0:2,' gramos');


    end;

end.

{correccion de gemini:
program practicas9;

const
    FIN = -1;
var
    meses, cantmay, cantmen, i: integer;
    menorpeso, maximopeso, pesopromediomenor, pesopromediomayor, peso, sumamay, sumamen: real;

begin
    maximopeso := -1;
    menorpeso := 9999;
    sumamay := 0;
    sumamen := 0;
    cantmay := 0;
    cantmen := 0;

     1. Leemos antes de entrar al ciclo }
    {writeln('Ingrese cantidad de meses de la embarazada (o -1 para salir):');
    readln(meses);

    { 2. El while ahora evalua la condición de corte directamente }
    {while (meses <> FIN) do
    begin
        
        { 3. Evaluamos: es mayor o igual a 6? }
        {if (meses >= 6) then
        begin
            for i := 1 to meses do
            begin
                writeln('ingrese peso del bebe en el mes ', i, ' (en gramos):');
                readln(peso);
                sumamay := sumamay + peso;
                cantmay := cantmay + 1;
                
                if (peso > maximopeso) then
                    maximopeso := peso;
            end;
        end
        else { 4. Si no es >= 6, SI O SI es menor. Usamos solo else }
        {begin
            for i := 1 to meses do
            begin
                writeln('ingrese peso del bebe en el mes ', i, ' (en gramos):');
                readln(peso);
                sumamen := sumamen + peso;
                cantmen := cantmen + 1;
                
                if (peso < menorpeso) then
                    menorpeso := peso;
            end;
        end;

        { 5. ¡CLAVE! Volvemos a leer al final del while para que no se haga infinito }
        {writeln('Ingrese cantidad de meses de otra embarazada (o -1 para salir):');
        readln(meses);
    end; { Fin del while }

    { 6. Mostramos resultados, PERO nos atajamos de la division por cero }
    {if (cantmay > 0) then
    begin
        pesopromediomayor := sumamay / cantmay;
        writeln('El peso promedio de los bebes con 6 meses o mas es: ', pesopromediomayor:0:2);
        writeln('El peso maximo es: ', maximopeso:0:2, ' gramos');
    end
    else
        writeln('No se ingresaron pacientes de 6 meses o mas.');

    if (cantmen > 0) then
    begin
        pesopromediomenor := sumamen / cantmen;
        writeln('El peso promedio de los bebes con menos de 6 meses es: ', pesopromediomenor:0:2);
        writeln('El peso minimo es: ', menorpeso:0:2, ' gramos');
    end
    else
        writeln('No se ingresaron pacientes de menos de 6 meses.');

    readln();
end.}