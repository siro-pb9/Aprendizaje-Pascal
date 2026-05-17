program ElegirVendedor;

function generarRandom():integer;
begin
    randomize;
    generarRandom:=random(100)+1;
end;

function esDivisible(dividendo,   divisor:integer): boolean;
Begin
    esDivisible:=(dividendo mod divisor = 0);
end;

procedure reasignar(vendedor: integer);
var
    numero,digito,suma:integer;
begin
    numero:= vendedor + generarRandom();
    while(numero>9) do begin
    	  suma:=0;
    	  while(numero > 0) do begin
        	digito:=numero mod 10;
			{Completar}
            suma:=suma+digito;
    	  end;
    	  numero:=suma;
    end;
    vendedor:=numero;
end;
var 
   numero,vendedor,codigo:integer;
    suma,digito:integer;
begin
  writeln('Ingrese nro de cliente');
  readln(codigo);
  while(codigo <> -1) do begin
	numero:=codigo;
	while(numero>9) do begin
        suma:=0;
        while(numero > 0) do begin
            digito:=numero mod 10;
		    {Completar}
     	    suma:=suma+digito;
    	end;
    	numero:=suma;
	end;
	if(not esDivisible(numero, vendedor))then begin
    		writeln('Al cliente ', codigo, ' le correspondía el vendedor ', vendedor);
	end;
	writeln('Al cliente ',codigo,  ' le corresponde el vendedor ', vendedor);
    
	readln(codigo);
  end;
end.