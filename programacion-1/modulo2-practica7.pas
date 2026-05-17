{Se lee una secuencia de caracteres hasta encontrar un carácter punto '.'. Contar e informar la
cantidad de palabras y la longitud de la palabra más larga que comienza con 'e'.
Ejemplo: A Eliseo le encanta escuchar música electrónica.
Cantidad de Palabras = 7
La Longitud de la palabra más larga que comienza con ‘e’ es 11.
Leer la nota sobre el procesamiento de palabras.}

program GuiaPalabras;

var
  car: char;
  cantPalabras, longActual, maxLongE: integer;
  empiezaConE: boolean; { Nos va a servir para "recordar" cómo empezó la palabra }

begin
  cantPalabras := 0;
  maxLongE := 0;

  writeln('Ingrese la frase terminada en punto:');
  read(car);

  { BUCLE PRINCIPAL DE LA SECUENCIA }
  while car <> '.' do
  begin
      
      { PASO 1: ESQUIVAR LOS ESPACIOS }
      { Si hay espacios sueltos, avanzo la cinta sin hacer nada }
      while car = ' ' do
        read(car);

      { PASO 2: ¿ARRANCÓ UNA PALABRA? }
      { Si después de esquivar espacios no me topé con el punto final... }
      if car <> '.' then
      begin
          cantPalabras := cantPalabras + 1; { Cuento la palabra }
          longActual := 0;                  { Preparo el metro para medir esta nueva palabra }
          
          { --- EL MOMENTO MÁGICO: LA PRIMERA LETRA --- }
          { Como recién arranca la palabra, ESTA es la primera letra. 
            Me fijo si es 'e' o 'E' y me lo guardo en la memoria para después }
          if (car = 'e') or (car = 'E') then
            empiezaConE := true
          else
            empiezaConE := false;
            
          { PASO 3: RECORRER Y MEDIR TODA LA PALABRA }
          { Avanzo la cinta MIENTRAS sea una letra (ni espacio ni punto) }
          while (car <> ' ') and (car <> '.') do
          begin
              longActual := longActual + 1; { Le sumo 1 a la longitud de esta palabra }
              read(car);                    { Avanzo a la siguiente letra }
          end;
          
          { PASO 4: CIERRE DE LA PALABRA }
          { Salí del bucle de letras. La palabra terminó. 
            Me fijo si había empezado con 'E' y si rompió el récord de longitud }
          if (empiezaConE = true) and (longActual > maxLongE) then
          begin
            maxLongE := longActual; { Hay un nuevo récord }
          end;
          
      end; { Fin del if que procesa la palabra }
      
  end; { Fin del while principal }

  { RESULTADOS FINALES }
  writeln('Cantidad de Palabras = ', cantPalabras);
  writeln('La Longitud de la palabra mas larga que comienza con "e" es ', maxLongE, '.');
  readln();
  readln();
end.