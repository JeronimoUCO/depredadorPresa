global mapa;
global poblacionDepredadores;
global poblacionPresas;
global tasaReproduccionPresas;
global tasaReproduccionDepredadores;
global presas;

mapa = zeros(500, 500);
poblacionDepredadores = 1;
poblacionPresas = 1;
tasaReproduccionPresas = 1;
tasaReproduccionDepredadores = 1;
presas = struct()

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

endfunction
