global mapa;
global poblacionDepredadores;
global poblacionPresas;
global tasaReproduccionPresas;
global tasaReproduccionDepredadores;
global presas;

depredadores = struct();
presas = struct();

mapa = zeros(100, 100);
mapa(5, 5) = 255;
poblacionDepredadores = 1;
poblacionPresas = 1;
tasaReproduccionPresas = 1;
tasaReproduccionDepredadores = 1;

function crearDepredador()

    global poblacionDepredadores;
    global depredadores;
    depredadores(poblacionDepredadores).tiempoVidaSinComida = 10;
    depredadores(poblacionDepredadores).posicionX = int64(rand() * 100 + 1);
    depredadores(poblacionDepredadores).posicionY = int64(rand() * 100 + 1);
    depredadores(poblacionDepredadores).direccionMovimiento = 1;
    poblacionDepredadores += 1;

endfunction

function crearPresa()
    global poblacionPresas;
    global presas;

    presas(poblacionPresas).posicionX = int64(rand() * 100 + 1);
    presas(poblacionPresas).posicionY = int64(rand() * 100 + 1);
    presas(poblacionPresas).direccionMovimiento = 1;

    poblacionPresas += 1;
endfunction

function dibujarPantalla(instante)
    global presas;
    global poblacionPresas;
    global depredadores;
    global poblacionDepredadores;

    for i = 1:columns(presas)
        presaActual = presas(i);

        if presaActual.posicionX < 1 || presaActual.posicionX > 100 || presaActual.posicionY < 1 || presaActual.posicionY > 100

            if presaActual.posicionX < 1
                presaActual.posicionX += 2;
            endif

            if presaActual.posicionX > 100
                presaActual.posicionX -= 2;
            endif

            if presaActual.posicionY < 1
                presaActual.posicionY += 2;
            endif

            if presaActual.posicionY > 100
                presaActual.posicionY -= 2;
            endif

        endif

        if presaActual.direccionMovimiento == 1
            presaActual.posicionY +=1;
        endif

        if presaActual.direccionMovimiento == 2
            presaActual.posicionX +=1;
        endif

        if presaActual.direccionMovimiento == 3
            presaActual.posicionY -=1;
        endif

        if presaActual.direccionMovimiento == 4
            presaActual.posicionX -=1;
        endif

        presaActual.direccionMovimiento = int64(rand() * 4 + 1);
        mapa(presaActual.posicionY, presaActual.posicionX) = 255;
    endfor

    for i = 1:columns(depredadores)
        depredadorActual = depredadores(i);
        deepredadorActual.posicionX=int64(rand()*10)
        if depredadorActual.posicionX < 1 || depredadorActual.posicionX > 100 || depredadorActual.posicionY < 1 || depredadorActual.posicionY > 100

            if depredadorActual.posicionX < 1
                depredadorActual.posicionX +=1;
            endif

            if depredadorActual.posicionX > 100
                depredadorActual.posicionX -= 1;
            endif

            if depredadorActual.posicionY < 1
                depredadorActual.posicionY += 1;
            endif

            if depredadorActual.posicionY > 100
                depredadorActual.posicionY -= 1;
            endif

        endif
        depredadorActual.direccionMovimiento
        if depredadorActual.direccionMovimiento == 1
            depredadorActual.posicionY +=1;
        endif

        if depredadorActual.direccionMovimiento == 2
            depredadorActual.posicionX +=1;
        endif

        if depredadorActual.direccionMovimiento == 3
            depredadorActual.posicionY -=1;
        endif

        if depredadorActual.direccionMovimiento == 4
            depredadorActual.posicionX -=1;
        endif

        depredadorActual.direccionMovimiento = int64(rand() * 4 + 1);
        mapa(depredadorActual.posicionY, depredadorActual.posicionX) = 50;
    endfor

    imshow(mapa);
    pause(0.1);

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

for iq = 1:50
    dibujarPantalla(i);
endfor
