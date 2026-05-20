{Una empresa de videojuegos está organizando su producción y requiere hacer algunas
estadísticas. Cada videojuego tiene un nombre, una categoría (educativo, acción, arcade, etc.),
idioma en que se los comercializa (español, inglés, francés, etc.) y cantidad de votos positivos
recibidos por sus usuarios. Se leen videojuegos hasta que llega “fin” como categoría. Los datos se
leen ordenados por categoría y dentro de cada categoría por idioma en que se los comercializa.
Se pide:
a) Calcular e informar la categoría que tiene más juegos y la que tiene más votos.
b) Calcular e informar el promedio de votos recibidos para los juegos educativos por cada
idioma en que se lo comercializa.
c) Calcular e informar el nombre y el idioma del videojuego más votado}

program modulo5practica6;

const 
FIN = 'FIN';

type

    fichaVideojuego = record
        nombre: string[30];
        categoria: string[30];
        idioma: string[30];
        cantVotos: integer;
    end;

fichaInforme = record
        catMasJuegos: string[30]; // Inciso A 
        catMasVotos: string[30];  // Inciso A
        nomMasVotado: string[30]; // Inciso C 
        idiMasVotado: string[30]; // Inciso C 
    end;

    fichaMaximos = record
        JuegosCat: integer; // Para comparar el Inciso A 
        VotosCat: integer;  // Para comparar el Inciso A
        VotosJuego: integer; // Para comparar el Inciso C 
    end;
    
    fichaActual = record
        categoria: string[30];
        idioma: string[30];
    end;

    fichaSuma = record
        juegosCat: integer;  // Inciso A
        votosCat: integer;   // Inciso A
        votosEdu: integer;   // Inciso B
        juegosEdu: integer; // Inciso B
    end;

procedure leerJuego(var j: fichaVideojuego); begin
    writeln('Introduzca la categoria del juego');
    readln(j.categoria);
    j.categoria := upcase(j.categoria);
    if (j.categoria <> FIN) then begin
        writeln('Introduzca el idioma del juego');
        readln(j.idioma);
        writeln('Introduzca el nombre del juego');
        readln(j.nombre); 
        writeln('Introduzca la cantidad de votos recibidos');
        readln(j.cantVotos);
        writeln('========================');
        writeln;
    end;
end;

procedure maximosC(var max: fichaMaximos; var inf: fichaInforme; jue: fichaVideojuego); begin
    {c) Calcular e informar el nombre y el idioma del videojuego más votado}
    if (jue.cantVotos > max.votosJuego) then begin
        max.votosJuego := jue.cantVotos;
        inf.nomMasVotado := jue.nombre;
        inf.idiMasVotado := jue.idioma;
    end;
end;

procedure maximosA(var max: fichaMaximos; var inf: fichaInforme; act: fichaActual; sum: fichaSuma); begin
    {Calcular e informar la categoría que tiene más juegos y la que tiene más votos.}
    if (sum.juegosCat > max.juegosCat) then begin
        max.juegosCat := sum.juegosCat;
        inf.catMasJuegos := act.categoria;
    end;
    
    if (sum.votosCat > max.votosCat) then begin
        max.votosCat := sum.votosCat;
        inf.catMasVotos := act.categoria;
    end;
end;

var
    juego: fichaVideojuego;
    maximos: fichaMaximos;
    informe: fichaInforme;
    actual: fichaActual;
    suma: fichaSuma;
    juegosIdioma, votosIdioma: integer;

begin
    maximos.juegosCat := 0;
    maximos.votosCat := 0;
    maximos.votosJuego := 0;
    leerJuego(juego);
    while (juego.categoria <> FIN) do begin
        actual.categoria := juego.categoria;
        suma.juegosCat := 0;
        suma.votosCat := 0;
        while (juego.categoria <> FIN) and (juego.categoria = actual.categoria) do begin
            actual.idioma := juego.idioma;
            juegosIdioma := 0;
            votosIdioma := 0;
            while (juego.categoria <> FIN) and (juego.categoria = actual.categoria) and (juego.idioma = actual.idioma) do begin
                juegosIdioma := juegosIdioma + 1;
                votosIdioma := votosIdioma + juego.cantVotos;
                maximosC(maximos, informe, juego);
                leerJuego(juego);
            end;
            suma.juegosCat := suma.juegosCat + juegosIdioma;
            suma.votosCat := suma.votosCat + votosIdioma;
            
            if (actual.categoria = 'EDUCATIVO') then begin
                writeln('Promedio votos juego educativo en ', actual.idioma, ': ', (votosIdioma / juegosIdioma):0:2);
            end;
        end;
        maximosA(maximos, informe, actual, suma);
    end;
    writeln('Categoria con mas juegos: ', informe.catMasJuegos);
    writeln('Categoria con mas votos: ', informe.catMasVotos);
    writeln('Juego mas votado: ', informe.nomMasVotado, ' en idioma: ', informe.idiMasVotado);
    readln;
end.
                

