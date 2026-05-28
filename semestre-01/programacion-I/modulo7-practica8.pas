{Dada una secuencia de 1000 posts correspondientes al mes pasado que fueron seleccionados para
calcular algunas estadísticas. Sabiendo que cada post contiene información de la fecha y del texto (de
un máximo 280 caracteres) en que fue publicado se pide calcular e informar:
a) La cantidad de hashtags (palabras que empiezan con el carácter ‘#’) y usuarios (palabras que
empiezan con carácter ‘@’).
b) La cantidad de posts publicados cada día.
c) La cantidad promedio de palabras de un post.}

program modulo7practica8;

const
  FIN = 1000;

type

  post = record
    dia: 1..31;
    texto: string[280];
  end;

  vPost = array[1..FIN] of post;
  diasContador = array[1..31] of integer;

procedure procesarEstadisticas(const v: vPost);
  var
    i, j, cant, palabras, numeral, arrobas: integer;
    antcar: char;
    dias: diasContador;
  begin
    for i := 1 to 31 do
      dias[i] := 0;
    palabras := 0;
    numeral := 0;
    arrobas := 0;
    for i := 1 to FIN do begin
      cant := length(v[i].texto);
      antcar := ' ';
      for j := 1 to cant do begin
        if (v[i].texto[j] <> ' ') and (antcar = ' ') then begin
          palabras := palabras + 1;
          if v[i].texto[j] = '#' then
            numeral := numeral + 1;
          if v[i].texto[j] = '@' then
            arrobas := arrobas + 1;
        end;
        antcar := v[i].texto[j];
      end;
      Dias[v[i].dia] := Dias[v[i].dia] + 1;
    end;
    writeln('palabras promedio: ',palabras / FIN:0:2);
    writeln(' hastags y arrobas: ',numeral,' ',arrobas);
    for i := 1 to 31 do
      writeln('cantidad de post en el dia ',i,': ',dias[i]);
    readln;
  end;
