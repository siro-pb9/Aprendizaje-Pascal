{Se leen 15 números enteros. Determinar para cada uno de ellos la suma de sus cifras hasta
expresarlas en una sola unidad, e informar.}

program practica3_clase2;

  const
     fin = 15;

  function SumarDigitos(n: integer): integer;
  var suma: integer;
       begin
            suma := 0;
            while n <> 0 do
              begin
                suma := suma + n mod 10;
                n := n div 10;
              end;
            SumarDigitos := suma;
       end;

  var
       num, i: integer;


begin

  for i := 1 to FIN do
    begin
      writeln('Escribe el ',i,' numero entero:');
      readln(num);

      while num >= 10 do
        num := SumarDigitos(num);

      writeln('El resultado es: ',num);
   end;
      readln();
end.
       