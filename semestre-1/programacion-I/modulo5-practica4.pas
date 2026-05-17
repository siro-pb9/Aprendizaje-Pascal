{Se desea procesar información acerca de los sueldos de los empleados de una empresa. De cada
empleado se conoce CUIL, sueldo, código de departamento y número de sucursal en la que trabaja.
La información se ingresa por teclado, ordenada por sucursal y luego por departamento. El
procesamiento termina al ingresar -1 como número de sucursal. Se pide:
a) Informar el departamento y sucursal de los dos departamentos con mayor monto de sueldos.
b) Para cada sucursal, informar sucursal y monto total de sueldos.}

program modulo5practica4;

    const
        FIN = -1;

type

    maximos = record
        suc1: integer;
        suc2: integer;
        dep1: string[30];
        dep2: string[30];
        sueldo1: real;
        sueldo2: real;
    end;

    actual = record
        sucursal: integer;
        depto: string[30];
    end;

    fichaEmpleado = record
        CUIL: integer;
        sueldo: real;
        depto: string[30];
        sucursal: integer;
    end;

procedure leerEmpleado(var e: fichaEmpleado); begin
    writeln('Introduzca numero de sucursal');
    readln(e.sucursal);
    if (e.sucursal <> FIN) then begin
        writeln('Introduzca codigo de departamento');
        readln(e.depto);
        writeln('introduzca CUIL');
        readln(e.CUIL);
        writeln('introduzca sueldo');
        readln(e.sueldo);
    end;
end;

procedure actMaximos(var mx: maximos; sumaSuc, sumaDep: real; ac: actual); begin
    if (sumaDep > mx.sueldo1) then begin
        mx.sueldo2 := mx.sueldo1;
        mx.dep2 := mx.dep1;
        mx.sueldo1 := sumaDep;
        mx.dep1 := ac.depto;
        mx.suc2 := mx.suc1;
        mx.suc1 := ac.sucursal;
    end else if (sumaDep > mx.sueldo2) then begin
        mx.sueldo2 := sumaDep;
        mx.dep2 := ac.depto;
        mx.suc2 := ac.sucursal;
    end;
end;

var
    empleado: fichaEmpleado;
    max: maximos;
    act: actual;
    sumaSueldosSuc, sumaSueldosDepto: real;

begin
    max.sueldo1 := 0;
    max.sueldo2 := 0;
    leerEmpleado(empleado);
    while (empleado.sucursal <> FIN) do begin
        sumaSueldosSuc := 0;
        act.sucursal := empleado.sucursal;
        while (empleado.sucursal <> FIN) and (empleado.sucursal = act.sucursal) do begin
            sumaSueldosDepto := 0;
            act.depto := empleado.depto;
                while (empleado.sucursal <> FIN) and (empleado.sucursal = act.sucursal) and (empleado.depto = act.depto) do begin
                    sumaSueldosDepto := sumaSueldosDepto + empleado.sueldo;
                    leerEmpleado(empleado);
                end;
            actMaximos(max, sumaSueldosSuc, sumaSueldosDepto, act);
            sumaSueldosSuc := sumaSueldosSuc + sumaSueldosDepto;
            writeln('El departamento ', act.depto, ' de la sucursal ', act.sucursal, ' tiene un sueldo total de ', sumaSueldosDepto:0:2);
        end;
        writeln('La sucursal ', act.sucursal, ' tiene un sueldo total de ', sumaSueldosSuc:0:2);
    end;
    writeln('Los dos departamentos  con mayor sueldo y sus sucursales son:', max.dep1,' (sucursal ',max.suc1,')' ' y ', max.dep2,' (sucursal ',max.suc2,')');
end.