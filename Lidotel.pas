program Lidotel;
uses
crt,SysUtils;
type
	client= record
		nombre: string;
		cedula: integer;
		correo: string;
		telefono: real;
		dias: integer;
	end;
	
	nino = record
		nombre: string;
		edad: integer;
	end;
const
	fin= 50;
var
	cliente: array [1..fin] of client;
	ninos: array[1..fin] of nino;
	opc, val_str, opc_n: string;
	i,j, val_int, n_personas, n_ninos: integer;
	validar_n, validar_c, validacion_n, n_val: boolean;
	individual, acompanado, grupo_familia: text;
	
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
		end;//del procedimiento
		
	procedure habitacion_f;
	begin
		writeln('|--------------------------------------Family Room--------------------------------------|');
		writeln('|-. 200$-noche incluye:                                                                               |');
		writeln('|                                                                                       |');
		writeln('|Desayuno Buffet en el Restaurant Le Nouveau, acceso inalámbrico a Internet (WIFI),     |');
		writeln('|Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y |');
		writeln('|toldos en la playa, kit de vanidades y niños de 0 a 2 años sin recargos.               |');
		writeln('|---------------------------------------------------------------------------------------|');
	end;//del procedimiento
	
	procedure habitacion_s;
	begin
		writeln('|-------------------------------------Sencilla-------------------------------------|');
		writeln('|-. 60$-noche incluye:                                                             |');
		writeln('|Desayuno Buffet en Restaurant Le Nouveau, acceso inalámbrico a Internet (WIFI),   |');
		writeln('|acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina, |');
		writeln('|acceso a nuestro moderno gimnasio y Kit de vanidades. Niños de 0 a 2 años sin     |');
		writeln('|recargos.                                                                         |');
		writeln('|----------------------------------------------------------------------------------|');
	end;//del procedimiento
	
	procedure habitacion_d;
	begin
		writeln('|---------------------------------------Doble---------------------------------------|');
		writeln('|-. 120$-noche incluye:                                                             |');
		writeln('|Desayuno Buffet en el Restaurant Le Nouveau, acceso inalámbrico a Internet (WIFI), |');
		writeln('|acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina,  |');
		writeln('|acceso a nuestro moderno gimnasio y Kit de vanidades. Niños de 0 a 2 años sin      |');
		writeln('|recargos.                                                                          |');
		writeln('|-----------------------------------------------------------------------------------|');	
	end;//del procedimiento
	
	procedure habitacion_suite;
	begin
		writeln('|-----------------------------------------Suite-----------------------------------------|');
		writeln('|-. 300$-noche incluye:                                                                 |');
		writeln('|Desayuno Buffet en el Restaurant Le Nouveau, acceso inalámbrico a Internet (WIFI),     |');
		writeln('|Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y |');
		writeln('|toldos en la playa, kit de vanidades y niños de 0 a 2 años sin recargos.               |');
		writeln('|---------------------------------------------------------------------------------------|');	
	end;//del procedimiento
	
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
	
	procedure mensaje_v(a:boolean);
	begin
		if a then
		begin
			ClrScr;
			writeln('La entrada ingresada no es valida, por favor ingrese una entrada valida');
			writeln('Presione enter para continuar...');
			readln;
		end;
	end; //del procedimiento
	
	procedure validar_int;
	begin
		n_val := true;
        Val(val_str , n_personas, val_int);

        if val_int <> 0 then
        begin
			ClrScr;
            writeln('La entrada no es un número entero. Por favor, intenta de nuevo.');
            writeln('Presione enter para continuar...');
            readln;
            n_val := false; 
        end;
	end;//del procedimiento
	
	procedure validar_ninos;
	begin
		n_val := true;
        Val(val_str , n_ninos, val_int);

        if val_int <> 0 then
        begin
			ClrScr;
            writeln('La entrada no es un número entero. Por favor, intenta de nuevo.');
            writeln('Presione enter para continuar...');
            readln;
            n_val := false; 
        end;
	end;//del procedimiento
	
	function validar_cantint(a,menor,mayor: integer):boolean;//valida que un numero ingresado este dentro del rango
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
		validar_cantint:= true;
	end;//de la funcion.
	
	
	procedure personas;//para pedir el numero de personas
	begin
		repeat//para validar que no exceda la cantidad de personas
		repeat
			writeln('Por favor ingrese para cuantas personas adultas desea la reservacion (incluyendose): ');
			readln(val_str);
			validar_int;
		until n_val;
			validar_cantint(n_personas,1,50);
		until validar_c; //hasta que la cantidad sea valida
		repeat//para validar que sea numero
		repeat//para validar que este disponible la opcion
			writeln('¿Van ninios con usted?');
			writeln('1. si');
			writeln('2. no');
			readln(opc_n);
			validar(opc_n);
			mensaje_v(validar_n);
		until not validar_n;//hasta que sea un numero
			validar_cant(opc_n, '1', '2');
		until validar_c;//hasta que la cantidad este en el rango
		if opc_n = '1' then
		begin
			repeat//para validar que sea un numero
				write('Ingrese la cantidad de niños que estaran con usted: ');
				readln(val_str);
				validar_ninos;
			until n_val;//hasta que sea un numero
		end;//del if
	end;//del procedimiento


	procedure validar_nombre(nombre:string);
	begin			
		// Verificar si el nombre y apellido contienen números
		validacion_n:= false;
		for i := 1 to Length(nombre) do
		begin
			if (not (nombre[i] in ['A'..'Z', 'a'..'z', ' '])) then
			begin
				validacion_n := true;
				break;
			end;
		end;
		if  validacion_n then//si hay numeros se muestra el mensaje
		begin
			ClrScr;
			writeln('El nombre no pueden contener numeros, ingrese un nombre valido.');
			writeln('Presione enter para continuar...');
			readln();
		end;
	end;//del procedimiento
	
	procedure ingresar_datos(a:integer);//para ingresar los datos en el registro
	begin
		write('Por favor ingrese su nombre y apellido: ');
		readln(cliente[1].nombre);
		write('Ingrese su cedula: ');
		readln(cliente[1].cedula);
		write('Ingrese su correo electronico: ');
		readln(cliente[1].correo);
		write('Ingrese su numero de telefono: ');
		readln(cliente[1].telefono);
		write('Ingrese la cantidad de dias que desea para su reservacion: ');
		readln(cliente[1].dias);
		if (a >= 2) then
		begin
			for j:= 2 to a do
			begin
				repeat//para validar el nombre
					write('Ingrese el nombre y apellido del acompaniante ', j, ': ');
					readln(cliente[j].nombre);
					validar_nombre(cliente[j].nombre);
				until not validacion_n;
					write('Ingrese cedula del acompaniante ', j, ': ');
					readln(cliente[j].cedula);
					write('Ingrese el correo electronico: ');
					readln(cliente[j].correo);
					write('Ingrese su numero de telefono: ');
					readln(cliente[j].telefono);
			end;//del for principal
		end//del if
		else if (n_ninos <> 0) then
		begin
			for j:= 1 to n_ninos do
			begin						//QUEDASTE AQUI!! Agregando validaciones para seguir con el prog
				repeat
					writeln('Ingrese el nombre y apellido del nino ', j, ': ');
					readln(ninos[j].nombre);
					validar_nombre(ninos[j].nombre);
				until not validacion_n;
					writeln('ingrese la edad del niño ', j, ': ');
					readln(ninos[j].edad);
			end;
		end; 
	end;//del procedimiento
	

	
begin//principal
	assign(individual, 'individual.txt');
	assign(acompanado, 'acompanado.txt');
	assign(grupo_familia, 'grupo_familia.txt');
	repeat//para validar que sea un numero
	repeat//para validar que la cantidad este en el rango
		ClrScr;
		bienvenida;
		readln(opc);
		validar(opc);
		mensaje_v(validar_n);
	until not validar_n;//hasta que se valide que sea un numero
		validar_cant(opc,'1','2');
	until validar_c;//hasta que la canidad sea valida
	
	case opc of
		'1':
		begin//de la opc 1
			personas;
			ingresar_datos(n_personas);
		end;//de la opc 1
	end;//del case opc
end.//principal
