program Lidotel;
uses
crt,SysUtils;
type
	client= record
		nombre: string;
		cedula: string;
		correo: string;
		telefono: string;
		dias: integer;
	end;
	
	nino = record
		nombre: string;
		edad: string;
	end;
const
	fin= 50;
	sencilla= 60;
	family= 200;
	doble= 120;
	suite= 300;
var

	cliente: array [1..fin] of client;
	ninos: array[1..fin] of nino;
	opc, val_str, opc_n, opc_v, opc_h: string;
	i,j, val_int, n_personas, n_ninos, n_dias: integer;
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
		writeln('|-------------------------------------Family Room--------------------------------------|');
		writeln('|-. 200$-noche:                                                                        |');
		writeln('|Cálida y confortable habitacion decorada con un estilo vanguardista, 100% libre de    |');
		writeln('|humo, cama Lidotel Royal King, con reloj despertador, TV 32 HD Plasma con cable,      |');
		writeln('|bano con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y |');
		writeln('|secador de cabello, armario adicional amplio, una habitacion separada con 2 camas     |');
		writeln('|full, bano con ducha.                                                                 |');
		writeln('|--------------------------------------------------------------------------------------|');		
		writeln('|-.Incluye:                                                                            |');
		writeln('|Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI),    |');
		writeln('|Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y|');
		writeln('|toldos en la playa, kit de vanidades y ninos de 0 a 2 anos sin recargos.              |');
		writeln('|--------------------------------------------------------------------------------------|');
		writeln();
		writeln('Presione enter para continuar...');
		readln;
	end;//del procedimiento
	
	procedure habitacion_s;
	begin
		writeln('|----------------------------------------Sencilla--------------------------------------|');
		writeln('|-. 60$-noche:                                                                         |');
		writeln('| Amplia y confortable habitacion decorada con un estilo vanguardista, cama Lidotel    |');
		writeln('|Royal King con sabanas de algodon egipcio, soporte para iPod con reloj despertador    |');
		writeln('|TV 32 HD Plasma con cable, bano con ducha, cafetera electrica, nevera ejecutiva, caja |');
		writeln('|electronica de seguridad y secador de cabello.                                        |');
		writeln('|--------------------------------------------------------------------------------------|');
		writeln('|-.Incluye:                                                                            |');
		writeln('| Desayuno Buffet en Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI),      |');
		writeln('|acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina,     |');
		writeln('|acceso a nuestro moderno gimnasio y Kit de vanidades. Ninos de 0 a 2 anos sin         |');
		writeln('|recargos.                                                                             |');
		writeln('|--------------------------------------------------------------------------------------|');
		writeln();
		writeln('Presione enter para continuar...');
		readln;
	end;//del procedimiento
	
	procedure habitacion_d;
	begin
		writeln('|----------------------------------------Doble-----------------------------------------|');
		writeln('|-. 120$-noche:                                                                        |');
		writeln('| Amplia y confortable habitacion decorada con un estilo vanguardista, Dos Camas       |');
		writeln('|Lidotel Full con sabanas de algodon egipcio, soporte para iPod con reloj despertador, |');
		writeln('|TV 3 HD Plasma con cable, bano con ducha, cafetera electrica, nevera ejecutiva, caja  |');
		writeln('|electronica de seguridad secador de cabello.                                          |');
		writeln('|--------------------------------------------------------------------------------------|');
		writeln('|-.Incluye:                                                                            |');
		writeln('| Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI),   |');
		writeln('|acceso a las instalaciones del Business Center, uso de nuestra exclusiva piscina,     |');
		writeln('|acceso a nuestro moderno gimnasio y Kit de vanidades. Ninos de 0 a 2 anos sin         |');
		writeln('|recargos.                                                                             |');
		writeln('|--------------------------------------------------------------------------------------|');	
		writeln();
		writeln('Presione enter para continuar...');
		readln;
	end;//del procedimiento
	
	procedure habitacion_suite;
	begin
		writeln('|----------------------------------------Suite------------------------------------------|');
		writeln('|-. 300$-noche:                                                                         |');
		writeln('| Calida y confortable habitacion decorada con un estilo vanguardista, 100% libre de    |');
		writeln('|humo, Cama Lidotel Royal King, con reloj despertador, TV 32 HD Plasma con cable, 2     |');
		writeln('|banos con ducha, cafetera electrica, nevera ejecutiva, caja electronica de seguridad y |');
		writeln('|secador de cabello, armario adicional amplio y area separada con 2 sofa-cama individual|');
		writeln('|---------------------------------------------------------------------------------------|');
		writeln('|-. 300$-noche incluye:                                                                 |');
		writeln('| Desayuno Buffet en el Restaurant Le Nouveau, acceso inalambrico a Internet (WIFI),    |');
		writeln('|Business Center, uso de nuestra exclusiva piscina, acceso a nuestro gimnasio, sillas y |');
		writeln('|toldos en la playa, kit de vanidades y niños de 0 a 2 anos sin recargos.               |');
		writeln('|---------------------------------------------------------------------------------------|');	
		writeln();
		writeln('Presione enter para continuar...');
		readln;
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
	
	procedure validar_dias;
	begin
		n_val := true;
        Val(val_str , cliente[1].dias, val_int);

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
		ClrScr;
		repeat//para validar que no exceda la cantidad de personas
		repeat
			writeln('Por favor ingrese para cuantas personas adultas desea la reservacion (incluyendose): ');
			readln(val_str);
			validar_int;
		until n_val;
			validar_cantint(n_personas,1,50);
		until validar_c; //hasta que la cantidad sea valida
		clrscr;
		repeat//para validar que sea numero
		repeat//para validar que este disponible la opcion
			writeln('Van ninios con usted?');
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
	
	
	
	
		procedure validar_correo(correo:string);//para validar el correo
		begin			
		// Verificar si el nombre y apellido contienen números
		validacion_n:= false;
		for i := 1 to Length(correo) do
		begin
			if (not (correo[i] in ['A'..'Z', 'a'..'z', '@', '.', '0'..'9'])) then
			begin
				validacion_n := true;
				break;
			end;
		end;
		if  validacion_n then//si hay numeros se muestra el mensaje
		begin
			ClrScr;
			writeln('El correo debe contener toda la sintaxis, ingrese un correo valido.');
			writeln('Presione enter para continuar...');
			readln();
		end;
	end;//del procedimiento
	
	
	
	
	
	
	procedure ingresar_datos(a:integer);//para ingresar los datos en el registro
	begin
	clrscr;
	repeat
		write('Por favor ingrese su nombre y apellido: ');
		readln(cliente[1].nombre);
		validar_nombre(cliente[1].nombre);
	until not validacion_n;
	repeat
		write('Ingrese su cedula: ');
		readln(cliente[1].cedula);
		validar(cliente[1].cedula);
		mensaje_v(validar_n);
	until not validar_n;	
	repeat
		write('Ingrese su correo electronico: ');
		readln(cliente[1].correo);
		validar_correo(cliente[1].correo);
	until not validacion_n;
	repeat
		write('Ingrese su numero de telefono: ');
		readln(cliente[1].telefono);
		validar(cliente[1].telefono);
		mensaje_v(validar_n);
	until not validar_n;
	repeat
		write('Ingrese la cantidad de dias que desea para su reservacion: ');
		readln(val_str);
		validar_dias;
	until n_val;
		n_dias:= cliente[1].dias;
		if (a >= 2) then
		begin
			for j:= 2 to a do
			begin
				repeat//para validar el nombre
					write('Ingrese el nombre y apellido del acompaniante ', j, ': ');
					readln(cliente[j].nombre);
					validar_nombre(cliente[j].nombre);
				until not validacion_n;
				repeat
					write('Ingrese cedula del acompaniante ', j, ': ');
					readln(cliente[j].cedula);
					validar(cliente[j].cedula);
					mensaje_v(validar_n);
				until not validar_n;
				repeat
					write('Ingrese el correo electronico: ');
					readln(cliente[j].correo);
					validar_correo(cliente[j].correo);
				until not validacion_n;
				repeat
					write('Ingrese su numero de telefono: ');
					readln(cliente[j].telefono);
					validar(cliente[j].telefono);
					mensaje_v(validar_n);
				until not validar_n;
				cliente[j].dias:= n_dias;
			end;//del for principal
		end//del if
		else if (n_ninos <> 0) then
		begin
			for j:= 1 to n_ninos do
			begin						
				repeat
					writeln('Ingrese el nombre y apellido del nino ', j, ': ');
					readln(ninos[j].nombre);
					validar_nombre(ninos[j].nombre);
				until not validacion_n;
				repeat
					writeln('ingrese la edad del niño ', j, ': ');
					readln(ninos[j].edad);
					validar(ninos[j].edad);
					mensaje_v(validar_n);
				until not validar_n;
					
			end;//del for
		end; //del else if
	end;//del procedimiento
	
	
	function precio_t(habitacion,dias:integer):real;
	begin
		writeln('El precio por noches de su habitacion es de $.', habitacion);
		precio_t:= habitacion * dias;
		writeln('Y el monto total a cancelar por su habitacion es de $.', precio_t:0:2);
	end;

	
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
			if (n_personas = 1) then
			begin
			repeat//hasta que la cantidad sea valida
			repeat//para validar que sea un numero
			repeat//para volver a mostrar 
				clrscr;
				writeln('Para las reservaciones de un adulto tenemos las seguientes habitacion disponible:');
				writeln('1. Sencilla');
				writeln('2. Suite');
				readln(opc_h);
				validar(opc_h);
				mensaje_v(validar_n);
			until not validar_n;//hasta que se valide que sea un numero
				validar_cant(opc_h,'1','2');
			until validar_c;//hasta que la canidad sea valida
				ClrScr;
				if opc_h = '1' then
				begin
					repeat//para que la cantidad sea valida
					repeat//para validas que sea un numero
						habitacion_s;
						writeln('1. Seleccionar');
						writeln('2. Volver');
						readln(opc_v);
						validar(opc_v);
						mensaje_v(validar_n);
					until not validar_n;//hasta que se valide que sea un numero
						validar_cant(opc_v,'1','2');
					until validar_c;//hasta que la cantidad sea valida
					if opc_v = '1' then
					begin
						clrscr;
						writeln('Usted ha selecionado la habitacion Sencilla');
						writeln('Dias de estadia: ', n_dias);
						precio_t(sencilla, n_dias);
						append(individual);
						writeln('Presione enter para mostrar el registro de las personas ingresadas');
						readln;
						clrscr;
						for i:=1 to n_personas do
						begin
							writeln('Cliente ', i);
							writeln('Nombre: ', cliente[i].nombre);
							writeln('Cedula: ', cliente[i].cedula);
							writeln('Correo: ', cliente[i].correo);
							writeln('Telefono: ', cliente[i].telefono);
							writeln('Dias est: ', cliente[i].dias);
							writeln('Presione enter para ver el siguiene cliente ingresado...');
							readln;
						end;
						for i:= 1 to n_personas do
						begin
							writeln(individual, 'Cliente ', i, ': ', cliente[i].nombre, ',CI: ', cliente[i].cedula, ',correo:  ', cliente[i].correo, ',telefono: ', cliente[i].telefono, ',Dias de estadia sencilla: ', cliente[i].dias);
						end;
						if n_ninos > 0 then
						begin
							for i:=1 to n_ninos do
							begin
								writeln(individual, 'Nino', i, ': ', ninos[i].nombre, 'edad: ', ninos[i].edad);
							end;
						end;
						close(individual);
					end;//del if de la opc_v
					end//del if de la habitacion
					
					else if opc_h = '2' then
					begin
					repeat//para que la cantidad sea valida
					repeat//para validas que sea un numero
						habitacion_suite;
						writeln('1. Seleccionar');
						writeln('2. Volver');
						readln(opc_v);
						validar(opc_v);
						mensaje_v(validar_n);
					until not validar_n;//hasta que se valide que sea un numero
						validar_cant(opc_v,'1','2');
					until validar_c;//hasta que la cantidad sea valida
						clrscr;
					if opc_v = '1' then
					begin
						writeln('Usted ha selecionado la habitacion Suite');
						writeln('Dias de estadia: ', n_dias);
						precio_t(suite, n_dias);
						append(individual);
						writeln('Presione enter para mostrar el registro de las personas ingresadas');
						readln;
						clrscr;
						for i:=1 to n_personas do
						begin
							writeln('Cliente ', i);
							writeln('Nombre: ', cliente[i].nombre);
							writeln('Cedula: ', cliente[i].cedula);
							writeln('Correo: ', cliente[i].correo);
							writeln('Telefono: ', cliente[i].telefono);
							writeln('Dias est: ', cliente[i].dias);
							writeln('Presione enter para ver el siguiene cliente ingresado...');
							readln;
						end;
						for i:= 1 to n_personas do
						begin
							writeln(individual, 'Cliente ', i, ': ', cliente[i].nombre, ',CI: ', cliente[i].cedula, ',correo:  ', cliente[i].correo, ',telefono: ', cliente[i].telefono, ',Dias de estadia suite: ', cliente[i].dias);
						end;
						if n_ninos > 0 then
						begin
							for i:=1 to n_ninos do
							begin
								writeln(individual, 'Nino', i, ': ', ninos[i].nombre, 'edad: ', ninos[i].edad);
							end;
						end;
						close(individual);
					end;
					end;
					until opc_v = '1';
			end//del if de personas
			
			else if n_personas = 2 then
			begin
			repeat//hasta que la cantidad sea valida
			repeat//para validar que sea un numero
			repeat//para volver a mostrar 
				clrscr;
				writeln('Para las reservaciones de dos personas tenemos las seguientes habitacion disponible:');
				writeln('1. Doble');
				writeln('2. Suite');
				readln(opc_h);
				validar(opc_h);
				mensaje_v(validar_n);
			until not validar_n;//hasta que se valide que sea un numero
				validar_cant(opc_h,'1','2');
			until validar_c;//hasta que la canidad sea valida
				ClrScr;
				if opc_h = '1' then
				begin
					repeat//para que la cantidad sea valida
					repeat//para validas que sea un numero
						habitacion_d;
						writeln('1. Seleccionar');
						writeln('2. Volver');
						readln(opc_v);
						validar(opc_v);
						mensaje_v(validar_n);
					until not validar_n;//hasta que se valide que sea un numero
						validar_cant(opc_v,'1','2');
					until validar_c;//hasta que la cantidad sea valida
					if opc_v = '1' then
					begin
						clrscr;
						writeln('Usted ha selecionado la habitacion Doble');
						writeln('Dias de estadia: ', n_dias);
						precio_t(doble, n_dias);
						append(acompanado);
						writeln('Presione enter para mostrar el registro de las personas ingresadas');
						readln;
						clrscr;
						for i:=1 to n_personas do
						begin
							writeln('Cliente ', i);
							writeln('Nombre: ', cliente[i].nombre);
							writeln('Cedula: ', cliente[i].cedula);
							writeln('Correo: ', cliente[i].correo);
							writeln('Telefono: ', cliente[i].telefono);
							writeln('Dias est: ', cliente[i].dias);
							writeln('Presione enter para ver el siguiene cliente ingresado...');
							readln;
						end;
						for i:= 1 to n_personas do
						begin
							writeln(acompanado, 'Cliente ', i, ': ', cliente[i].nombre, ',CI: ', cliente[i].cedula, ',correo:  ', cliente[i].correo, ',telefono: ', cliente[i].telefono, ',Dias de estadia doble: ', cliente[i].dias);
						end;
						if n_ninos > 0 then
						begin
							for i:=1 to n_ninos do
							begin
								writeln(acompanado, 'Nino', i, ': ', ninos[i].nombre, 'edad: ', ninos[i].edad);
							end;
						end;
						close(acompanado);
					end;
					end//del if de la habitacion
					
					else if opc_h = '2' then
					begin
					repeat//para que la cantidad sea valida
					repeat//para validas que sea un numero
						habitacion_suite;
						writeln('1. Seleccionar');
						writeln('2. Volver');
						readln(opc_v);
						validar(opc_v);
						mensaje_v(validar_n);
					until not validar_n;//hasta que se valide que sea un numero
						validar_cant(opc_v,'1','2');
					until validar_c;//hasta que la cantidad sea valida
					if opc_v = '1' then
					begin
						clrscr;
						writeln('Usted ha selecionado la habitacion Suite');
						writeln('Dias de estadia: ', n_dias);
						precio_t(suite, n_dias);
						append(acompanado);
						writeln('Presione enter para mostrar el registro de las personas ingresadas');
						readln;
						clrscr;
						for i:=1 to n_personas do
						begin
							writeln('Cliente ', i);
							writeln('Nombre: ', cliente[i].nombre);
							writeln('Cedula: ', cliente[i].cedula);
							writeln('Correo: ', cliente[i].correo);
							writeln('Telefono: ', cliente[i].telefono);
							writeln('Dias est: ', cliente[i].dias);
							writeln('Presione enter para ver el siguiene cliente ingresado...');
							readln;
						end;
						for i:= 1 to n_personas do
						begin
							writeln(acompanado, 'Cliente ', i, ': ', cliente[i].nombre, ',CI: ', cliente[i].cedula, ',correo:  ', cliente[i].correo, ',telefono: ', cliente[i].telefono, ',Dias de estadia suite: ', cliente[i].dias);
						end;
						if n_ninos > 0 then
						begin
							for i:=1 to n_ninos do
							begin
								writeln(acompanado, 'Nino', i, ': ', ninos[i].nombre, 'edad: ', ninos[i].edad);
							end;
						end;
						close(acompanado);
					end;
					end;
					until opc_v = '1';
			end//del else if personas
			
			else if n_personas > 2 then
			begin
			repeat//hasta que la cantidad sea valida
			repeat//para validar que sea un numero
			repeat//para volver a mostrar 
				clrscr;
				writeln('Para las reservaciones de un grupo de personas tenemos las seguientes habitacion disponible:');
				writeln('1. Family Room');
				writeln('2. Suite');
				readln(opc_h);
				validar(opc_h);
				mensaje_v(validar_n);
			until not validar_n;//hasta que se valide que sea un numero
				validar_cant(opc_h,'1','2');
			until validar_c;//hasta que la canidad sea valida
				ClrScr;
				if opc_h = '1' then
				begin
					repeat//para que la cantidad sea valida
					repeat//para validas que sea un numero
						habitacion_f;
						writeln('1. Seleccionar');
						writeln('2. Volver');
						readln(opc_v);
						validar(opc_v);
						mensaje_v(validar_n);
					until not validar_n;//hasta que se valide que sea un numero
						validar_cant(opc_v,'1','2');
					until validar_c;//hasta que la cantidad sea valida
					if opc_v = '1' then
					begin
						clrscr;
						writeln('Usted ha selecionado la habitacion Family Room');
						writeln('Dias de estadia: ', n_dias);
						precio_t(family, n_dias);
						append(grupo_familia);
						writeln('Presione enter para mostrar el registro de las personas ingresadas');
						readln;
						clrscr;
						for i:=1 to n_personas do
						begin
							writeln('Cliente ', i);
							writeln('Nombre: ', cliente[i].nombre);
							writeln('Cedula: ', cliente[i].cedula);
							writeln('Correo: ', cliente[i].correo);
							writeln('Telefono: ', cliente[i].telefono);
							writeln('Dias est: ', cliente[i].dias);
							writeln('Presione enter para ver el siguiene cliente ingresado...');
							readln;
						end;
						for i:= 1 to n_personas do
						begin
							writeln(grupo_familia, 'Cliente ', i, ': ', cliente[i].nombre, ',CI: ', cliente[i].cedula, ',correo:  ', cliente[i].correo, ',telefono: ', cliente[i].telefono, ',Dias de estadia family room: ', cliente[i].dias);
						end;
						if n_ninos > 0 then
						begin
							for i:=1 to n_ninos do
							begin
								writeln(grupo_familia, 'Nino', i, ': ', ninos[i].nombre, 'edad: ', ninos[i].edad);
							end;
						end;
						close(grupo_familia);
					end;
					end//del if de la habitacion
					
					else if opc_h = '2' then
					begin
					repeat//para que la cantidad sea valida
					repeat//para validas que sea un numero
						habitacion_suite;
						writeln('1. Seleccionar');
						writeln('2. Volver');
						readln(opc_v);
						validar(opc_v);
						mensaje_v(validar_n);
					until not validar_n;//hasta que se valide que sea un numero
						validar_cant(opc_v,'1','2');
					until validar_c;//hasta que la cantidad sea valida
					if opc_v = '1' then
					begin
						clrscr;
						writeln('Usted ha selecionado la habitacion Suite');
						writeln('Dias de estadia: ', n_dias);
						precio_t(suite, n_dias);
						append(grupo_familia);
						writeln('Presione enter para mostrar el registro de las personas ingresadas');
						readln;
						clrscr;
						for i:=1 to n_personas do
						begin
							writeln('Cliente ', i);
							writeln('Nombre: ', cliente[i].nombre);
							writeln('Cedula: ', cliente[i].cedula);
							writeln('Correo: ', cliente[i].correo);
							writeln('Telefono: ', cliente[i].telefono);
							writeln('Dias est: ', cliente[i].dias);
							writeln('Presione enter para ver el siguiene cliente ingresado...');
							readln;
						end;
						for i:= 1 to n_personas do
						begin
							writeln(grupo_familia, 'Cliente ', i, ': ', cliente[i].nombre, ',CI: ', cliente[i].cedula, ',correo:  ', cliente[i].correo, ',telefono: ', cliente[i].telefono, ',Dias de estadia suite: ', cliente[i].dias);
						end;
						if n_ninos > 0 then
						begin
							for i:=1 to n_ninos do
							begin
								writeln(grupo_familia, 'Nino', i, ': ', ninos[i].nombre, 'edad: ', ninos[i].edad);
							end;
						end;
						close(grupo_familia);
					end;
					end;
				until opc_v = '1';//para mostrar habitacion 		
			end
		end;//de la opc 1
	end;//del case opc principal
end.//principal
