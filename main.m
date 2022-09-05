global mapa;
global poblacionDepredadores;
global poblacionPresas;
global tasaReproduccionPresas;
global tasaReproduccionDepredadores;
global presas;


depredadores = struct();
presas = struct()

mapa = zeros(500,500);

mapa = zeros(500, 500);
poblacionDepredadores = 1;
poblacionPresas = 1;
tasaReproduccionPresas = 1;
tasaReproduccionDepredadores = 1;

function crearDepredador()

  global poblacionDepredadores;
  global depredadores;
  depredadores(poblacionDepredadores).tiempoVidaSinComida = 10;
  depredadores(poblacionDepredadores).posicionx = int64(rand()*500 + 1);
  depredadores(poblacionDepredadores).posiciony = int64(rand()*500 + 1);
  depredadores(poblacionDepredadores).direccionMovimiento = 1;
  poblacionDepredadores += 1;

endfunction


function crearPresa()
    global poblacionPresas;
    global presas;

    presas(poblacionPresas).posicionX = int64(rand() * 500 + 1);
    presas(poblacionPresas).posicionY = int64(rand() * 500 + 1);
    presas(poblacionPresas).direccionMovimiento = 1;

    poblacionPresas += 1;
endfunction

function dibujarPantalla(instante)
    global presas;
    global poblacionPresas;
    global depredadores;
    global poblacionDepredadores;


    for i = 1:columns(presas)
        presaActual = presas(i)

        if presaActual.posicionX < 1 || presaActual.posicionX > 500 || presaActual.posicionY < 1 || presaActual.posicionY > 500

            if presaActual.posicionX < 1
                presaActual.posicionX += 1
            endif

            if presaActual.posicionX > 500
                presaActual.posicionX -= 1
            endif

            if presaActual.posicionY < 1
                presaActual.posicionY += 1
            endif

            if presaActual.posicionY > 500
                presaActual.posicionY -= 1
            endif

        endif

        if presaActual.direccionMovimiento == 1
            presaActual.posicionY +=1
        endif

        if presaActual.direccionMovimiento == 2
            presaActual.posicionX +=1
        endif

        if presaActual.direccionMovimiento == 3
            presaActual.posicionY -=1
        endif

        if presaActual.direccionMovimiento == 4
            presaActual.posicionX -=1
        endif

        presaActual.direccionMovimiento = int64(rand() * 4 + 1)
    endfor


    for i = 1:columns(depredadores)
        depredadorActual = depredadores(i)

        if depredadorActual.posicionX < 1 || depredadorActual.posicionX > 500 || depredadorActual.posicionY < 1 || depredadorActual.posicionY > 500

            if depredadorActual.posicionX < 1
                depredadorActual.posicionX += 1
            endif

            if depredadorActual.posicionX > 500
                depredadorActual.posicionX -= 1
            endif

            if depredadorActual.posicionY < 1
                depredadorActual.posicionY += 1
            endif

            if depredadorActual.posicionY > 500
                depredadorActual.posicionY -= 1
            endif

        endif

        if depredadorActual.direccionMovimiento == 1
            depredadorActual.posicionY +=1
        endif

        if depredadorActual.direccionMovimiento == 2
            depredadorActual.posicionX +=1
        endif

        if depredadorActual.direccionMovimiento == 3
            depredadorActual.posicionY -=1
        endif

        if depredadorActual.direccionMovimiento == 4
            depredadorActual.posicionX -=1
        endif

        depredadorActual.direccionMovimiento = int64(rand() * 4 + 1)
    endfor

endfunction
