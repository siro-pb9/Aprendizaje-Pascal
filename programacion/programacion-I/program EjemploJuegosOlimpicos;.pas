program EjemploJuegosOlimpicos;

{ ====================================================================
  ZONA DE TIPOS (Acá armamos los moldes, subrangos, strings y records)
  ==================================================================== }
type
    { 1. STRINGS: Limitamos los textos para no desperdiciar memoria }
    Cadena30 = string[30];
    
    { 2. SUBRANGO: Los deportes solo pueden ser del 1 al 4 }
    RangoDeporte = 1..4; 
    
    { 3. CONJUNTO: Molde para nuestra "bolsa" de deportes a promediar }
    ConjuntoDeportes = set of RangoDeporte; 
    
    { 4. REGISTRO (RECORD): La Ficha técnica que agrupa todo lo del atleta }
    FichaAtleta = record
        pais: Cadena30;       { Esto equivale a tu ciudad }
        nombre: Cadena30;     { Equivale al nombre de la mascota }
        deporte: RangoDeporte;{ Equivale a la especie }
        medallas: integer;    { Equivale a la edad. Usamos -1 para cortar }
    end;

{ ====================================================================
  MÓDULOS (Empleados que resuelven tareas específicas)
  ==================================================================== }

{ Empleado que lee y rellena UNA ficha entera.
  Paso por referencia (VAR) porque devuelve la ficha llena al Jefe }
procedure LeerAtleta(var a: FichaAtleta);
begin
    writeln('-----------------------------------');
    write('Ingrese cantidad de medallas (-1 para salir): ');
    readln(a.medallas);
    
    { Si no es -1, leemos el resto. Así evitamos pedir datos innecesarios }
    if (a.medallas <> -1) then 
    begin
        write('Ingrese pais: '); 
        readln(a.pais);
        write('Ingrese nombre: '); 
        readln(a.nombre);
        write('Ingrese deporte (1.Atletismo, 2.Natacion, 3.Gimnasia, 4.Ciclismo): '); 
        readln(a.deporte);
    end;
end;

{ Empleado experto en Podios (Máximos). 
  Recibe el país y sus medallas por valor. 
  Modifica los maximos y sus nombres por referencia (VAR). }
procedure ActualizarPodio(paisActual: Cadena30; medallasActuales: integer; 
                          var max1, max2: integer; 
                          var nomMax1, nomMax2: Cadena30);
begin
    if (medallasActuales > max1) then 
    begin
        { Desplaza al primero hacia el segundo lugar }
        max2 := max1;
        nomMax2 := nomMax1;
        { Ocupa el primer lugar }
        max1 := medallasActuales;
        nomMax1 := paisActual;
    end
    else if (medallasActuales > max2) then 
    begin
        { Ocupa solo el segundo lugar }
        max2 := medallasActuales;
        nomMax2 := paisActual;
    end;
end;

{ ====================================================================
  PROGRAMA PRINCIPAL (El Jefe: Controla el Corte de Control)
  ==================================================================== }
var
    atleta: FichaAtleta;
    deportesAcuaticosPista: ConjuntoDeportes;
    
    { Variables para el bloque del Corte de Control }
    paisActual: Cadena30;
    totalMedallasPais: integer;
    sumaMedallasFoco, cantFoco: integer;
    
    { Variables para los dos máximos }
    maxMedallas1, maxMedallas2: integer;
    paisMax1, paisMax2: Cadena30;

begin
    { 1. INICIALIZACIONES GLOBALES }
    maxMedallas1 := -1; 
    maxMedallas2 := -1;
    paisMax1 := ''; 
    paisMax2 := '';
    
    { Llenamos la bolsa del conjunto (Equivale a Perros y Gatos [1, 2]) }
    deportesAcuaticosPista := [1, 2]; 

    { 2. PRIMERA LECTURA (Arranca la cinta transportadora) }
    LeerAtleta(atleta);

    { 3. EL BUCLE DEL JEFE (Se ejecuta mientras no llegue el centinela) }
    while (atleta.medallas <> -1) do 
    begin
        { --- INICIO DE UN NUEVO BLOQUE (Nuevo País) --- }
        paisActual := atleta.pais; { Sacamos la "foto" del país }
        
        { Reseteamos los contadores/sumadores SOLO para este país }
        totalMedallasPais := 0;
        sumaMedallasFoco := 0;
        cantFoco := 0;

        { 4. EL BUCLE DEL EMPLEADO (Procesa mientras sea el mismo País y no sea -1) }
        while (atleta.medallas <> -1) and (atleta.pais = paisActual) do 
        begin
            { Sumamos al total general de este país (Equivale al total de mascotas) }
            totalMedallasPais := totalMedallasPais + atleta.medallas;

            { Preguntamos usando el CONJUNTO si es el deporte que nos importa promediar }
            if (atleta.deporte in deportesAcuaticosPista) then 
            begin
                sumaMedallasFoco := sumaMedallasFoco + atleta.medallas;
                cantFoco := cantFoco + 1;
            end;

            { AVANZAMOS LA CINTA: Leemos el siguiente atleta antes de dar la vuelta }
            LeerAtleta(atleta);
        end;

        { --- CIERRE DEL BLOQUE (Cambió de País o llegó el -1) --- }
        writeln;
        writeln('=== RESUMEN DE ', paisActual, ' ===');
        writeln('Total de medallas: ', totalMedallasPais);
        
        { Calculamos el promedio cuidando que no haya división por cero }
        if (cantFoco > 0) then
            writeln('Promedio medallas Atletismo/Natacion: ', (sumaMedallasFoco / cantFoco):0:2)
        else
            writeln('No se registraron atletas de Atletismo/Natacion.');

        { Antes de volver arriba, le avisamos al experto en podios cómo le fue a este País }
        ActualizarPodio(paisActual, totalMedallasPais, maxMedallas1, maxMedallas2, paisMax1, paisMax2);
        
    end; { Fin del While del Jefe }

    { 5. RESULTADOS FINALES (Fuera de los bucles) }
    writeln;
    writeln('=== RESULTADOS FINALES ===');
    writeln('1er Puesto: ', paisMax1, ' con ', maxMedallas1, ' medallas.');
    writeln('2do Puesto: ', paisMax2, ' con ', maxMedallas2, ' medallas.');
    
    readln;
end.