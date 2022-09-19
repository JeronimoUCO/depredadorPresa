#Definicion de variables
global mapa;
global poblacionDepredadores;
global poblacionPresas;
global tasaReproduccionPresas;
global tasaReproduccionDepredadores;
global presas;
global comidas;

depredadores = struct();
presas = struct();

mapa = zeros(50, 50);
poblacionDepredadores = 1;
poblacionPresas = 1;
tasaReproduccionPresas = 1;
tasaReproduccionDepredadores = 1;
comidas=1;

#Creacion de depredadores
function crearDepredador()
    global poblacionDepredadores;
    global depredadores;

    depredadores(poblacionDepredadores).tiempoVidaSinComida = 10;
    depredadores(poblacionDepredadores).posicionX = int64(rand() * 40 + 2);
    depredadores(poblacionDepredadores).posicionY = int64(rand() * 40 + 2);
    depredadores(poblacionDepredadores).direccionMovimiento = 1;
    poblacionDepredadores += 1;

endfunction

#Creacion de presas
function crearPresa()
    global poblacionPresas;
    global presas;

    presas(poblacionPresas).posicionX = int64(rand() * 40 + 2);
    presas(poblacionPresas).posicionY = int64(rand() * 40 + 2);
    presas(poblacionPresas).direccionMovimiento = 1;

    poblacionPresas += 1;
endfunction

#Logica de refresco de pantalla
function dibujarPantalla(instante)
    global presas;
    global poblacionPresas;
    global depredadores;
    global poblacionDepredadores;
    global comidas;

    #Muestra las presas que no se han comido
    for ii = 1:columns(presas)
        presaActual = presas(ii);
        ii
        #Si se toca alguno de los "bordes" del mapa, se lleva de nuevo al interior de este
        if presaActual.posicionX <= 2 || presaActual.posicionX >= 48 || presaActual.posicionY <= 2 || presaActual.posicionY >= 48

            if presaActual.posicionX <= 2
                presaActual.posicionX += 2;
            endif

            if presaActual.posicionX >= 48
                presaActual.posicionX -= 2;
            endif

            if presaActual.posicionY <= 2
                presaActual.posicionY += 2;
            endif

            if presaActual.posicionY >= 48
                presaActual.posicionY -= 2;
            endif

        endif
        #Si la posicion de ha definido (aleatoriamente) en 1, la presa se mueve hacia arriba
        if presaActual.direccionMovimiento == 1
            presaActual.posicionY +=1;
        endif
        #Si la posicion de ha definido (aleatoriamente) en 2, la presa se mueve hacia la derecha
        if presaActual.direccionMovimiento == 2
            presaActual.posicionX +=1;
        endif
        #Si la posicion de ha definido (aleatoriamente) en 3, la presa se mueve hacia abajo
        if presaActual.direccionMovimiento == 3
            presaActual.posicionY -=1;
        endif
        #Si la posicion de ha definido (aleatoriamente) en 4, la presa se mueve hacia la izquierda
        if presaActual.direccionMovimiento == 4
            presaActual.posicionX -=1;
        endif

        #Se verifica si la presa ha sido devorada por algun depredador
        for j = 1:columns(depredadores)
          if depredadores(j).posicionX == presaActual.posicionX && depredadores(j).posicionY == presaActual.posicionY
             presas(:, ii) = [];
             comidas += 1;
          endif
        endfor
        #Se recalcula (aleatoriamente) la direccion de movimiento
        presaActual.direccionMovimiento = int64(rand() * 4 + 1);
        #Se actualiza el valor de la presa(global) al de la presa actual(local)
        presas(ii)=presaActual;
        #Se pinta la presa como un punto blanco en el mapa
        mapa(presaActual.posicionY, presaActual.posicionX) = 255;
    endfor

    for i = 1:columns(depredadores)
        depredadorActual = depredadores(i);
        #Se verifica que el depredador no toque los limites del mapa
        if depredadorActual.posicionX <= 2 || depredadorActual.posicionX >= 48 || depredadorActual.posicionY <= 2 || depredadorActual.posicionY >= 48

            if depredadorActual.posicionX <= 2
                depredadorActual.posicionX +=2;
            endif

            if depredadorActual.posicionX >= 48
                depredadorActual.posicionX -= 2;
            endif

            if depredadorActual.posicionY <= 2
                depredadorActual.posicionY += 2;
            endif

            if depredadorActual.posicionY >= 48
                depredadorActual.posicionY -= 2;
            endif

        endif
        #Si la direccion se calcula (aleatoriamente) en 1, se mueve hacia arriba
        if depredadorActual.direccionMovimiento == 1
            depredadorActual.posicionY +=1;
        endif
        #Si la direccion se calcula (aleatoriamente) en 2, se mueve hacia la derecha
        if depredadorActual.direccionMovimiento == 2
            depredadorActual.posicionX +=1;
        endif
        #Si la direccion se calcula (aleatoriamente) en 3, se mueve hacia abajo
        if depredadorActual.direccionMovimiento == 3
            depredadorActual.posicionY -=1;
        endif
        #Si la direccion se calcula (aleatoriamente) en 4, se mueve hacia la izquierda
        if depredadorActual.direccionMovimiento == 4
            depredadorActual.posicionX -=1;
        endif
        #Se recalcula la direccion de movimiento
        depredadorActual.direccionMovimiento = int64(rand() * 4 + 1);
        #Se actualiza el valor de depredador actual
        depredadores(i)=depredadorActual;
        #Se pinta el depredador en el mapa como un punto gris
        mapa(depredadorActual.posicionY, depredadorActual.posicionX) = 50;

    endfor

    mapa=uint8(mapa);
    subplot(1,2,2)
    imshow(mapa);
    pause(0.001);

    #Despues de un tiempo, se borran las presas y depredadores del mapa para actualizar sus posiciones
    for i = 1:columns(presas)
        presaActual = presas(i);
        mapa(presaActual.posicionY, presaActual.posicionX) = 0;
    endfor

    for i = 1:columns(depredadores)
        depredadorActual = depredadores(i);
        mapa(depredadorActual.posicionY, depredadorActual.posicionX) = 0;
    endfor
endfunction

for i = 1:10
    crearPresa();
endfor

for i = 1:5
    crearDepredador();
endfor

for i = 1:5000
    dibujarPantalla(i);
endfor