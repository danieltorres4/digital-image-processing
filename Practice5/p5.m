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
%"full" y "valid" de la imagen con un filtro paso bajas (filtros de bloque)
%Usar 2 o 3 tamaños diferentes de filtros, por ejemplo: 7x7, 9x9 y 11x11.

%Filtros paso bajas de diferente orden
fil = fspecial('average',[7 7]);
fil2 = fspecial('average',[9 9]);
fil3 = fspecial('average',[11 11]);

conv2_7x7F = conv2(pentImg,fil,'full');
conv2_7x7V = conv2(pentImg,fil,'valid');
conv2_7x7V = double(conv2_7x7V);

conv2_9x9F = conv2(pentImg,fil2,'full');
conv2_9x9V = conv2(pentImg,fil2,'valid');

conv2_11x11F = conv2(pentImg,fil3,'full');
conv2_11x11V = conv2(pentImg,fil3,'valid');

%Mostrando resultados
figure("name","1. CONV2 7x7 USING FULL vs VALID");
subplot(1,2,1);
imshow(conv2_7x7F,[]);
title("CONV2 7x7 USING FULL");

subplot(1,2,2);
imshow(conv2_7x7V,[]);
title("CONV2 7x7 USING VALID");

figure("name","1. CONV2 9x9 USING FULL");
subplot(1,2,1);
imshow(conv2_9x9F,[]);
title("CONV2 9x9 USING FULL");
subplot(1,2,2);
imshow(conv2_9x9V,[]);
title("CONV2 9x9 USING VALID");

figure("name","1. CONV2 11x11 USING FULL");
subplot(1,2,1);
imshow(conv2_11x11F,[]);
title("CONV2 11x11 USING FULL");
subplot(1,2,2);
imshow(conv2_11x11V, []);
title("CONV2 11x11 USING VALID");

%2- Obtener la DFT de la imagen original y desplegarla de manera amplificada 
%utilizando el logaritmo del módulo de la DFT para dicha amplificación. 
pentImg = imread('pentagon256x256.tif');
F = fft2(pentImg);
imshow(F,[]);
%Cambiar el eje de coordenadas (comando MATLAB ffshift) y nuevamente amplificar.
coor=fftshift(F);
tam = log(abs(coor));

figure("name","DFT IMAGEN ORIGINAL");
imshow(tam,[]);
colormap(jet); 
title("DFT IMAGEN ORIGINAL");


%3- Obtener la convolución circular ($\otimes$) de la imagen con el filtro 
%paso bajas a través de la DFT. Usar también diferentes tamaños de filtros. 
%Desplegar las imágenes resultantes.
DFT_img_s_f = log(abs(F));
figure("name","DFT sin filtro de la imagen original")
imshow(DFT_img_s_f,[]);
title("DFT de la imagen original")

DFT_f_7x7 = fft2(imgFil);
DFT_img_c_f_7x7 = log(abs(DFT_f_7x7));
figure("name","DFT de la imagen con filtro de 7x7")
imshow(DFT_img_c_f_7x7,[]);
title("DFT de la imagen con filtro de 7x7")

DFT_f_9x9 = fft2(imgFil2);
DFT_img_c_f_9x9 = log(abs(DFT_f_9x9));
figure("name","DFT de la imagen con filtro de 9x9")
imshow(DFT_img_c_f_9x9,[]);
title("DFT de la imagen con filtro de 9x9")

DFT_f_11x11 = fft2(imgFil3);
DFT_img_c_f_11x11 = log(abs(DFT_f_11x11));
figure("name","DFT de la imagen con filtro de 11x11")
imshow(DFT_img_c_f_11x11,[]);
title("DFT de la imagen con filtro de 11x11")

conv_circ_7x7 = conv2(DFT_img_s_f,DFT_img_c_f_7x7,"full");
conv_circ_9x9 = conv2(DFT_img_s_f,DFT_img_c_f_9x9,"full");
conv_circ_11x11 = conv2(DFT_img_s_f,DFT_img_c_f_11x11,"full");

cc1 = DFT_img_s_f * DFT_img_c_f_7x7;
cc2 = DFT_img_s_f * DFT_img_c_f_9x9;
cc3 = DFT_img_s_f * DFT_img_c_f_11x11;

figure("name","Conv Circular 7x7 mediante la función conv2 vs Conv circular 7x7 mediante la operación de multiplicación ")
subplot(1,2,1)
imshow(conv_circ_7x7,[])
title("Conv Circular 7x7 mediante la función conv2")
subplot(1,2,2)
imshow(cc1,[])
title("Conv circular 7x7 mediante la operación de multiplicación")

figure("name","Conv Circular 9x9 mediante la función conv2 vs Conv circular 9x9 mediante la operación de multiplicación")
subplot(1,2,1)
imshow(conv_circ_9x9,[])
title("Conv Circular 9x9 mediante la función conv2")
subplot(1,2,2)
imshow(cc2,[])
title("Conv circular 9x9 mediante la operación de multiplicación")

figure("name","Conv Circular 11x11 mediante la función conv3 vs Conv circular 11x11 mediante la operación de multiplicación")
subplot(1,2,1)
imshow(conv_circ_11x11,[])
title("Conv Circular 11x11 mediante la función conv2")
subplot(1,2,2)
imshow(cc3,[])
title("Conv circular 11x11 mediante la operación de multiplicación")

%4- Obtener la convolución lineal (*) de la imagen con el filtro paso bajas
%a través de la DFT (comandos MATLAB fft2 y ifft2). Usar también diferentes
%tamaños de filtros. Desplegar las imágenes resultantes


%5- Comparar los resultados obtenidos en los puntos 1, 3 y 4 desplegando 
%para un mismo tamaño de filtro las 3 convoluciones, por ejemplo: 
%convolución lineal filtro 9x9, convolución lineal (DFT) filtro 9x9, 
%convolución circular (DFT) filtro 9x9.
