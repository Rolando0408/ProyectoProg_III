program Lidotel;
uses
crt,SysUtils;
type
	client= record
		nombre: string;
		cedula: integer;
		correo: string;
		telefono: integer;
		dias: integer;
	end;
	
const
	n_personas= 50;
var
	cliente: array [1..n_personas] of client;
	opc: string;
	i: integer;
	validar_n, validar_c: boolean;
	procedure bienvenida;//para mostrar un menu de bienvenida al cliente
		begin
			writeln('Bienvenido al sistema de reservacion de Lidotel, a continuacion ingrese los datos solicitados:');
			writeln();
			writeln('|---------------------|');
			writeln('|Seleccione una opcion|');
			writeln('|---------------------|');
			writeln('|1. Nuevo cliente.    |');
			writeln('|2. Salir             |');
			writeln('|---------------------|');
		end;
		
	procedure habitacion_f;
	begin
		writeln('|--------------------------------------Family Room--------------------------------------|');
		writeln('|-. 200$-noche incluye:                                                                               |');
		writeln('|                                                                                       |');
		writeln('|Desayuno Buffet en el Restaurant Le Nouveau, acceso inalámbrico a Internet (WIFI),     |');
		writeln('|Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y |');
		writeln('|toldos en la playa, kit de vanidades y niños de 0 a 2 años sin recargos.               |');
		writeln('|---------------------------------------------------------------------------------------|');
	end;
	
	procedure habitacion_s;
	begin
		writeln('|-------------------------------------Sencilla-------------------------------------|');
		writeln('|-. 60$-noche incluye:                                                             |');
		writeln('|Desayuno Buffet en Restaurant Le Nouveau, acceso inalámbrico a Internet (WIFI),   |');
		writeln('|acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, |');
		writeln('|acceso a nuestro moderno gimnasio y Kit de vanidades. Niños de 0 a 2 años sin     |');
		writeln('|recargos.                                                                         |');
		writeln('|----------------------------------------------------------------------------------|');
	end;
	
	procedure habitacion_d;
	begin
		writeln('|---------------------------------------Doble---------------------------------------|');
		writeln('|-. 120$-noche incluye:                                                             |');
		writeln('|Desayuno Buffet en el Restaurant Le Nouveau, acceso inalámbrico a Internet (WIFI), |');
		writeln('|acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina,  |');
		writeln('|acceso a nuestro moderno gimnasio y Kit de vanidades. Niños de 0 a 2 años sin      |');
		writeln('|recargos.                                                                          |');
		writeln('|-----------------------------------------------------------------------------------|');	
	end;
	
	procedure habitacion_suite;
	begin
		writeln('|-----------------------------------------Suite-----------------------------------------|');
		writeln('|-. 300$-noche incluye:                                                                 |');
		writeln('|Desayuno Buffet en el Restaurant Le Nouveau, acceso inalámbrico a Internet (WIFI),     |');
		writeln('|Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y |');
		writeln('|toldos en la playa, kit de vanidades y niños de 0 a 2 años sin recargos.               |');
		writeln('|---------------------------------------------------------------------------------------|');	
	end;
	
	

	function validar(a:string):boolean;//validar si lo ingresado es un numero
	begin
			validar_n := false;

			for i := 1 to Length(a) do//for para verificar que el valor ingresado sea un numero
			begin
				if not (a[i] in ['0'..'9']) then
				begin
					validar_n := true;
					break;
				end;//del if
			end;//del for
			validar:=true;
	end;//de la funcion
	
	function validar_cant(a,menor,mayor: string):boolean;//valida que un numero ingresado este dentro del rango
	begin
		validar_c:= true;
		if (a < menor) or (a > mayor) then
		begin
			ClrScr;
			writeln('La opcion seleccionada no es valida. Por favor ingrese una opcion valida');
			writeln('Presione enter para continuar...');
            readln();
			validar_c:= false;
		end;//del if.
		validar_cant:= true;
	end;//de la funcion.



begin
	
end.
