global mapa;
global poblacionDepredadores;
global poblacionPresas;
global tasaReproduccionPresas;
global tasaReproduccionDepredadores;
global presas;

depredadores = struct();
presas = struct();

mapa = zeros(50, 50);
poblacionDepredadores = 1;
poblacionPresas = 1;
tasaReproduccionPresas = 1;
tasaReproduccionDepredadores = 1;

function crearDepredador()
    global poblacionDepredadores;
    global depredadores;

    depredadores(poblacionDepredadores).tiempoVidaSinComida = 10;
    depredadores(poblacionDepredadores).posicionX = int64(rand() * 97 + 2);
    depredadores(poblacionDepredadores).posicionY = int64(rand() * 97 + 2);
    depredadores(poblacionDepredadores).direccionMovimiento = 1;
    poblacionDepredadores += 1;

endfunction

function crearPresa()
    global poblacionPresas;
    global presas;

    presas(poblacionPresas).posicionX = int64(rand() * 97 + 2);
    presas(poblacionPresas).posicionY = int64(rand() * 97 + 2);
    presas(poblacionPresas).direccionMovimiento = 1;

    poblacionPresas += 1;
endfunction

function dibujarPantalla(instante)
    global presas;
    global poblacionPresas;
    global depredadores;
    global poblacionDepredadores;

    for i = 1:columns(presas)-100-1
        presaActual = presas(i);


        if presaActual.posicionX <= 1 || presaActual.posicionX >= 50 || presaActual.posicionY <= 1 || presaActual.posicionY >= 50

            if presaActual.posicionX <= 1
                presaActual.posicionX += 2;
            endif

            if presaActual.posicionX >= 50
                presaActual.posicionX -= 2;
            endif

            if presaActual.posicionY <= 1
                presaActual.posicionY += 2;
            endif

            if presaActual.posicionY >= 50
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

        for j = 1:columns(depredadores)
          if depredadores(j).posicionX == presaActual.posicionX && depredadores(j).posicionY == presaActual.posicionY
             presas(:, i) = [];
          endif
        endfor

        presaActual.direccionMovimiento = int64(rand() * 4 + 1);
        presas(i)=presaActual;
    endfor

    for i = 1:columns(depredadores)
        depredadorActual = depredadores(i);
        if depredadorActual.posicionX <= 1 || depredadorActual.posicionX >= 50 || depredadorActual.posicionY <= 1 || depredadorActual.posicionY >= 100

            if depredadorActual.posicionX <= 1
                depredadorActual.posicionX +=2;
            endif

            if depredadorActual.posicionX >= 50
                depredadorActual.posicionX -= 2;
            endif

            if depredadorActual.posicionY <= 1
                depredadorActual.posicionY += 2;
            endif

            if depredadorActual.posicionY >= 50
                depredadorActual.posicionY -= 2;
            endif

        endif
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
        depredadores(i)=depredadorActual;
        mapa(depredadorActual.posicionY, depredadorActual.posicionX) = 50;
    endfor
    mapa=uint8(mapa);
    subplot(1,2,2)
    imshow(mapa);
    pause(0.001);


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
