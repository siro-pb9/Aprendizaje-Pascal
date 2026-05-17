{Se requiere procesar la información de algunos países del mundo. Suponga que se cuenta con el
nombre del país, el nombre de la provincia (o estado), ciudad, dinero recaudado y cantidad de
habitantes por ciudad. Realizar un programa que lea dicha información, la procese e informe el
ingreso por habitante de cada ciudad, de cada provincia y de cada país. Asuma que la información
está ordenada por país, luego por provincia y ciudad. Los datos se ingresan por teclado y el
programa finaliza al ingresar ‘zzz’ como país (que no debe procesarse).}

program modulo5practica5;

const
    FIN = 'zzz';

type

    fichaPaises = record
        pais: string[30];
        provincia: string[30];
        ciudad: string[30];
        dinero: real;
        habitantes: integer;
    end;

    actual = record
        pais: string[30];
        provincia: string[30];
        ciudad: string[30];
    end;

    ingresos = record
        pais: real;
        provincia: real;
        ciudad: real;
        perProvincia: integer;
        perPais: integer;
    end;

procedure leerPaises(var p: fichaPaises); begin
    writeln('introduzca el pais');
    readln(p.pais);
    if (p.pais <> FIN) then begin
        writeln('introduzca la provincia');
        readln(p.provincia);
        writeln('introduzca la ciudad');
        readln(p.ciudad);
        writeln('introduzca el dinero recaudado');
        readln(p.dinero);
        writeln('introduzca la cantidad de habitantes');
        readln(p.habitantes);
    end;
end;

var
    ing: ingresos;
    act: actual;
    pais: fichaPaises;

begin
    leerPaises(pais);
    while (pais.pais <> FIN) do begin
        ing.pais := 0;
        ing.perPais := 0;
        act.pais := pais.pais;

        while (pais.pais <> FIN) and (pais.pais = act.pais) do begin
            ing.provincia := 0;
            ing.perProvincia := 0;
            act.provincia := pais.provincia;
            while (pais.pais <> FIN) and (pais.pais = act.pais) and (pais.provincia = act.provincia) do begin
                ing.ciudad := 0;
                ing.ciudad := pais.dinero;
                act.ciudad := pais.ciudad;
                ing.perProvincia := ing.perProvincia + pais.habitantes;
                ing.provincia := ing.provincia + ing.ciudad;
                writeln('El ingreso de cada persona de la ciudad de ',act.ciudad,' es de ',ing.ciudad / pais.habitantes:0:2);
                leerPaises(pais);
            end;

            ing.pais := ing.pais + ing.provincia;
            ing.perPais := ing.perPais + ing.perProvincia;
            writeln('El ingreso de cada persona de la provincia de ',act.provincia,' es de ',ing.provincia / ing.perProvincia:0:2);
        end;
        
        writeln('El ingreso de cada persona del pais de ',act.pais,' es de ',ing.pais / ing.perPais:0:2);
    end;
    readln;
end.