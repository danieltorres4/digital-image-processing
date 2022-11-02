%2- Obtener la DFT de la imagen original y desplegarla de manera amplificada 
%utilizando el logaritmo del módulo de la DFT para dicha amplificación. 
pentImg = imread('pentagon256x256.tif');
F = fft2(pentImg);
imshow(F,[]);
%Cambiar el eje de coordenadas (comando MATLAB ffshift) y nuevamente amplificar.
coor=fftshift(F);
tam = log(abs(coor));
imshow(tam,[]);
colormap(jet); 
title("DFT IMAGEN ORIGINAL")
