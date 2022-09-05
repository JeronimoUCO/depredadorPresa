global mapa;
global poblacionDepredadores;
global poblacionPresas;
global tasaReproduccionPresas;
global tasaReproduccionDepredadores;


depredadores = struct();

mapa = zeros(500,500);
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



function dibujarPantalla(instante)

  global depredadores;
  global poblacionDepredadores;

  for i = 1:columns(depredadores)
    depredadorActual = depredadores(i);






  endfor
endfunction


