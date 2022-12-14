%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%        Practice - Linear, Circular,     %%%
%%%           and Fourier Convolution       %%%
%%%             Team members                %%%
%%%     +Herrera Godina Adriana Jocelyn     %%%
%%%        +Miranda Miranda Emiliano        %%%
%%%      +Nicolás Marín Brian Geovanny      %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

pentImg = imread('pentagon256x256.tif');
pentImg = double(pentImg);
figure("name","Original Image");
imshow(pentImg,[]);
title("PENTAGON IMAGE WITHOUT FILTERS");

%1- Obtener la convolución lineal (comando MATLAB conv2 y argumentos 
%"full" y "valid") de la imagen con un filtro paso bajas (filtros de bloque)
%Usar 2 o 3 tamaños diferentes de filtros, por ejemplo: 7x7, 9x9 y 11x11.

%Filtros paso bajas a la imagen
fil = fspecial('average',[7 7]);
fil2 = fspecial('average',[9 9]);
fil3 = fspecial('average',[11 11]);

imgFil = imfilter(pentImg,fil);
imgFil2 = imfilter(pentImg,fil2);
imgFil3 = imfilter(pentImg,fil3);


conv2_7x7F = conv2(pentImg,imgFil,'full');
conv2_9x9F = conv2(pentImg,imgFil2,'full');
conv2_11x11F = conv2(pentImg,imgFil3,'full');

%Mostrando resultados
figure("name","1. CONV2 7x7 USING FULL")
imshow(conv2_7x7F,[]);
title("CONV2 7x7 USING FULL");

figure("name","1. CONV2 9x9 USING FULL")
imshow(conv2_9x9F,[]);
title("CONV2 9x9 USING FULL");

figure("name","1. CONV2 11x11 USING FULL")
imshow(conv2_11x11F,[]);
title("CONV2 11x11 USING FULL");

%2- Obtener la DFT de la imagen original y desplegarla de manera amplificada 
%utilizando el logaritmo del módulo de la DFT para dicha amplificación. 
figure("name","DFT")
pentImg = imread('pentagon256x256.tif');
imshow(pentImg,'InitialMagnification','fit')
F = fft2(pentImg);
F2 = log(abs(F));
imshow(F2,[-1 5],'InitialMagnification','fit');
colormap(jet); 
%Cambiar el eje de coordenadas (comando MATLAB ffshift) y nuevamente amplificar.
Y=fft2(pentImg);
F3 = log(abs(Y));
imagesc(abs(fftshift(F3)));


%3- Obtener la convolución circular ($\otimes$) de la imagen con el filtro 
%paso bajas a través de la DFT. Usar también diferentes tamaños de filtros. 
%Desplegar las imágenes resultantes.


%4- Obtener la convolución lineal (*) de la imagen con el filtro paso bajas
%a través de la DFT (comandos MATLAB fft2 y ifft2). Usar también diferentes
%tamaños de filtros. Desplegar las imágenes resultantes

conv2_7x7F2 = conv2(F2,conv2_7x7F,'full');
conv2_9x9F2 = conv2(F2,conv2_9x9F,'full');
conv2_11x11F2 = conv2(F2,conv2_11x11F,'full');

figure("name","4. CONV2 7x7 USING FULL WITH DFT")
imshow(conv2_7x7F2,[]);
title("CONV2 7x7 USING FULL WITH DFT");

figure("name","4. CONV2 9x9 USING FULL WITH DFT")
imshow(conv2_9x9F2,[]);
title("CONV2 9x9 USING FULL WITH DFT");

figure("name","4. CONV2 11x11 USING FULL WITH DFT")
imshow(conv2_11x11F2,[]);
title("CONV2 11x11 USING FULL WITH DFT");


%5- Comparar los resultados obtenidos en los puntos 1, 3 y 4 desplegando 
%para un mismo tamaño de filtro las 3 convoluciones, por ejemplo: 
%convolución lineal filtro 9x9, convolución lineal (DFT) filtro 9x9, 
%convolución circular (DFT) filtro 9x9.
