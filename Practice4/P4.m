%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       Practice 4 - Spatial Filters      %%% 
%%%             Team members                %%%
%%%     +Herrera Godina Adriana Jocelyn     %%%
%%%        +Miranda Miranda Emiliano        %%%
%%%      +Nicolás Marín Brian Geovanny      %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
%1. Para todos los puntos siguientes, utilizar una imagen sin ruido y otra 
% imagen con ruido. La imagen con ruido se puede generar a partir de la 
% imagen sin ruido usando el siguiente comando de MATLAB: J = IMNOISE(I,TIPO...)
% donde TIPO es una cadena que puede tomar valores 'gaussian' ,'localvar', etc.
imagen = imread('cameraman.tif');
imagenruido= imnoise(imagen,'gaussian');

figure("name","NOISE-FREE IMAGE vs NOISY IMAGE")
imshowpair(imagen,imagenruido,"montage")
title('NOISE-FREE IMAGE vs NOISY IMAGE')

%2.Aplicar los filtros paso bajas de bloque a la imagen sin ruido y a la
%imagen con ruido usando filtros de orden 3x3, 7x7, 9x9 y 11x11.
%Filtros pasa bajas
fl1 = fspecial('average',[3 3]);
fl2 = fspecial('average',[5 5]);
fl3 = fspecial('average',[7 7]);
fl4 = fspecial('average',[11 11]);
% filtros a la imagen sin ruido
imsrfl1 = imfilter(imagen,fl1);
imsrfl2 = imfilter(imagen,fl2);
imsrfl3 = imfilter(imagen,fl3);
imsrfl4 = imfilter(imagen,fl4);
% Aplicando los filtros
figure("name","NOISE-FREE IMAGE FILTERS: 3x3 and 5x5")
subplot(1,2,1); 
imshow(imsrfl1); 
title('NOISE-FREE IMAGE WITH 3x3 FILTER');

subplot(1,2,2); 
imshow(imsrfl2); 
title('NOISE-FREE IMAGE WITH 5x5 FILTER');

figure("name","NOISE-FREE IMAGE FILTERS: 7x7 and 11x11")
subplot(1,2,1); 
imshow(imsrfl3); 
title('NOISE-FREE IMAGE WITH 7x7 FILTER');

subplot(1,2,2); 
imshow(imsrfl4); 
title('NOISE-FREE IMAGE WITH 11x11 FILTER');

% Aplicando filtros a la imagen con ruido
imcrfl1 = imfilter(imagenruido,fl1);
imcrfl2 = imfilter(imagenruido,fl2);
imcrfl3 = imfilter(imagenruido,fl3);
imcrfl4 = imfilter(imagenruido,fl4);
%Se muestran los resultados de aplicar los filtros
figure("name","NOISY IMAGE FILTERS: 3x3 and 5x5")
subplot(1,2,1); 
imshow(imcrfl1); 
title('NOISY IMAGE WITH 3x3 FILTER');
subplot(1,2,2); 
imshow(imcrfl2); 
title('NOISY IMAGE WITH 5x5 FILTER');

figure("name","NOISY IMAGE FILTERS: 7x7 and 11x11")
subplot(1,2,1); 
imshow(imcrfl3); 
title('NOISY IMAGE WITH 7x7 FILTER');
subplot(1,2,2); 
imshow(imcrfl4); 
title('NOISY IMAGE WITH 11x11 FILTER');

%3. Aplicar los filtros paso bajas binomiales a la imagen sin ruido y a la 
% imagen con ruido usando filtros de orden 3x3, 7x7, 9x9 y 11x11.
%   imagen con ruido usando filtros de orden 3x3, 7x7, 9x9 y 11x11.
fl1_h = [1,2,1];
fl1_v = [1;2;1];
fl2_h = [1,6,15,20,15,6,1];
fl2_v = [1;6;15;20;15;6;1];
fl3_h = [1,8,28,56,70,56,28,8,1];
fl3_v = [1;8;28;56;70;56;28;8;1];
fl4_h = [1,10,45,120,210,252,210,120,45,10,1];
fl4_v = [1;10;45;120;210;252;210;120;45;10;1];

f_3x3 =   1/16*(fl1_v*fl1_h);
f_7x7 =   1/4096*(fl2_v*fl2_h);
f_9x9 =   1/65536*(fl3_v*fl3_h);
f_11x11 = 1/1048576*(fl4_v*fl4_h);

% filtros a la imagen sin ruido
imsrfl1 = imfilter(imagen,f_3x3);
imsrfl2 = imfilter(imagen,f_7x7);
imsrfl3 = imfilter(imagen,f_9x9);
imsrfl4 = imfilter(imagen,f_11x11);

% Aplicando los filtros
figure("name","3- FREE-NOISE IMAGE BINOMIAL FILTERS: 3x3 and 7x7")
subplot(1,2,1); 
imshow(imsrfl1); 
title('NOISE-FREE IMAGE WITH 3x3 FILTER');

subplot(1,2,2); 
imshow(imsrfl2); 
title('NOISE-FREE IMAGE WITH 7x7 FILTER');

figure("name","NOISE-FREE IMAGE FILTERS: 9x9 and 11x11")
subplot(1,2,1); 
imshow(imsrfl3); 
title('NOISE-FREE IMAGE WITH 9x9 FILTER');

subplot(1,1,1); 
imshow(imsrfl4); 
title('NOISE-FREE IMAGE WITH 11x11 FILTER');

% Aplicando filtros a la imagen con ruido
imcrfl1 = imfilter(imagenruido,f_3x3);
imcrfl2 = imfilter(imagenruido,f_7x7);
imcrfl3 = imfilter(imagenruido,f_9x9);
imcrfl4 = imfilter(imagenruido,f_11x11);
%Se muestran los resultados de aplicar los filtros
figure("name","3- NOISY IMAGE BINOMIAL FILTERS: 3x3 and 7x7")
subplot(1,2,1); 
imshow(imcrfl1); 
title('NOISY IMAGE WITH 3x3 FILTER');
subplot(1,2,2); 
imshow(imcrfl2); 
title('NOISY IMAGE WITH 7x7 FILTER');

figure("name","3- NOISY IMAGE BINOMIAL FILTERS: 9x9 and 11x11")
subplot(1,2,1); 
imshow(imcrfl3); 
title('NOISY IMAGE WITH 9x9 FILTER');
subplot(1,2,2); 
imshow(imcrfl4); 
title('NOISY IMAGE WITH 11x11 FILTER');


%4. Aplicar a la imagen sin ruido y con ruido los filtros basados
%en la primera derivada de gausiana o detectores de borde siguientes:
%   a) De bloque [1 -1].
%Detecta bordes observando los cruces por cero después de filtrar la imagen 
% con un filtro de bloque especificado
bloque = edge(imagen, 'zerocross', [1 -1]); 
bloquenoise = edge(imagenruido, 'zerocross', [1 -1]);

figure("name",'Filtro de bloque')
imshowpair(bloque, bloquenoise, "montage")
title('Block filter [1 -1] without noise vs with noise')

%   b) Prewitt en la dirección X y en la dirección Y.
%Sin ruido 
pwr= edge(imagen,'prewitt','horizontal');
pwr3 = edge(imagen,'prewitt','vertical');
%Con ruido 
pwr2= edge(imagenruido,'prewitt','horizontal');
pwr4 = edge(imagenruido,'prewitt','vertical');

figure("name",'FREE-NOISE IMAGE WITH PREWITT FILTER vs NOISY IMAGE WITH PREWITT FILTER: HORIZONTAL')
imshowpair(pwr, pwr2, "montage")
title('FREE-NOISE IMAGE WITH PREWITT FILTER vs NOISY IMAGE WITH PREWITT FILTER: HORIZONTAL')

figure("name",'FREE-NOISE IMAGE WITH PREWITT FILTER vs NOISY IMAGE WITH PREWITT FILTER: VERTICAL')
imshowpair(pwr3, pwr4, "montage")
title('FREE-NOISE IMAGE WITH PREWITT FILTER vs NOISY IMAGE WITH PREWITT FILTER: VERTICAL')

%   c) Sobel en la dirección X y en la dirección Y.
%Sin ruido 
sobel = edge(imagen, "sobel", 'horizontal');
sobel3 = edge(imagen, "sobel", 'vertical');
%Con ruido ruido 
sobel2 = edge(imagenruido, "sobel",'horizontal');
sobel4 = edge(imagenruido, "sobel",'vertical');

figure("name",'FREE-NOISE IMAGE WITH SOBEL FILTER vs NOISY IMAGE WITH SOBEL FILTER: HORIZONTAL')
imshowpair(sobel, sobel2, "montage")
title('FREE-NOISE IMAGE WITH SOBEL FILTER vs NOISY IMAGE WITH SOBEL FILTER: HORIZONTAL')

figure("name",'FREE-NOISE IMAGE WITH SOBEL FILTER vs NOISY IMAGE WITH SOBEL FILTER: VERTICAL')
imshowpair(sobel3, sobel4, "montage")
title('FREE-NOISE IMAGE WITH SOBEL FILTER vs NOISY IMAGE WITH SOBEL FILTER: VERTICAL')

%d) Basados en la primera derivada de Gaussiana de orden 5x5, 7x7 y 11x11.
fnigf5x5 = imgaussfilt(imagen, [5 5]);
nigf5x5 = imgaussfilt(imagenruido, [5 5]);
fnigf7x7 = imgaussfilt(imagen, [7 7]);
nigf7x7 = imgaussfilt(imagenruido, [7 7]);
fnigf11x11 = imgaussfilt(imagen, [11 11]);
nigf11x11 = imgaussfilt(imagenruido, [11 11]);

figure("name",'4d: FREE-NOISE IMAGE VS NOISY IMAGE 5x5')
imshowpair(fnigf5x5, nigf5x5, "montage")
title('FILTER BASED ON THE FIRST DERIVATIVE OF ORDER 5X5: FREE-NOISE vs NOISY')

figure("name",'4d: FREE-NOISE IMAGE VS NOISY IMAGE 7x7')
imshowpair(fnigf7x7, nigf7x7, "montage")
title('FILTER BASED ON THE FIRST DERIVATIVE OF ORDER 7X7: FREE-NOISE vs NOISY')

figure("name",'4d: FREE-NOISE IMAGE VS NOISY IMAGE 11x11')
imshowpair(fnigf7x7, nigf7x7, "montage")
title('FILTER BASED ON THE FIRST DERIVATIVE OF ORDER 11X11: FREE-NOISE vs NOISY')


%5. De igual manera, aplicar a la imagen sin ruido y a la imagen con ruido 
% los filtros basados en la segunda derivada de gausiana siguientes:

%a)El Laplaciano 3x3 que encuentre en la literatura, por ejemplo, el filtro
% con 8 al centro y rodeado de -1’s.
alpha = 0.2; %forma el filtro de 8 en el centro y rodeado de -1s
%Filtro de 3 por 3 que aproxima la forma del operador laplaciano bidimensional
laplacian = fspecial('laplacian',alpha); 
imglap = imfilter(imagen,laplacian);
imglapnoise = imfilter(imagenruido,laplacian);

figure("name",'Segunda derivada: Laplaciano')
imshowpair(imglap, imglapnoise, "montage")
title('3x3 Laplacian without noise vs with noise')

%b) Laplacianos basados en la segunda derivada de Gaussiana de orden 5x5, 
% 7x7 y 11x11, constrúyalos con el método visto en clase.
%filtro laplaciano-gaussiano rotacionalmente simétrico de tamaño hsize
LapGauss5 = fspecial('log',[5 5]); 
imglapgaus5 = imfilter(imagen, LapGauss5);
imglapgausnoise5 = imfilter(imagenruido, LapGauss5);

LapGauss7 = fspecial('log',[7 7]);
imglapgaus7 = imfilter(imagen, LapGauss7);
imglapgausnoise7 = imfilter(imagenruido, LapGauss7);

LapGauss11 = fspecial('log',[11 11]);
imglapgaus11 = imfilter(imagen, LapGauss11);
imglapgausnoise11 = imfilter(imagenruido, LapGauss11);

figure("name",'Laplacian basados en la segunda derivada de Gaussiana de orden 5x5')
imshowpair(imglapgaus5, imglapgausnoise5, "montage")
title('Laplacian 2nd derivative 5x5 Gauss without noise vs with noise')

figure("name",'Laplacian basados en la segunda derivada de Gaussiana de orden 7x7')
imshowpair(imglapgaus7, imglapgausnoise7, "montage")
title('Laplacian 2nd derivative 7x7 Gauss without noise vs with noise')

figure("name",'Laplacian basados en la segunda derivada de Gaussiana de orden 11x11')
imshowpair(imglapgaus11, imglapgausnoise11, "montage")
title('Laplacian 2nd derivative 11x11 Gauss without noise vs with noise')


%6. Difuminar las imágenes sin ruido y con ruido usando un filtro paso 
% bajas de orden 5x5, de tal manera que se obtenga una imagen sin ruido y 
% con pérdida de nitidez y otra imagen con ruido y perdida de nitidez. Para
% cada uno de los siguientes incisos, filtrar las imágenes utilizando el 
% filtro unsharp masking encontrado con los siguientes tipos de filtro paso
% bajas:
%a) Filtro paso bajas de bloque de orden 3x3 y 7x7.
%Imagen sin ruido orden 3x3
unsharp1= imsharpen(imsrfl1);
figure, imshow(unsharp1)
title('Sharpened Image1');
%Imagen sin ruido orden 7x7
unsharp2= imsharpen(imsrfl3);
figure, imshow(unsharp2)
title('Sharpened Image2');
%Imagen con ruido orden 3x3
unsharp3= imsharpen(imcrfl1);
figure, imshow(unsharp3)
title('Sharpened Image3');
%Imagen con ruido orden 7x7
unsharp4= imsharpen(imcrfl3);
figure, imshow(unsharp4)
title('Sharpened Image2');

%b) Filtro paso bajas binomial de orden 3x3 y 7x7.
%Imagen sin ruido orden 3x3
unsharp1= imsharpen(imsrfl1);
figure, imshow(unsharp1)
title('Sharpened Image1');
%Imagen sin ruido orden 7x7
unsharp2= imsharpen(imsrfl2);
figure, imshow(unsharp2)
title('Sharpened Image2');
%Imagen con ruido orden 3x3
unsharp3= imsharpen(imcrfl1);
figure, imshow(unsharp3)
title('Sharpened Image3');
%Imagen con ruido orden 7x7
unsharp4= imsharpen(imcrfl2);
figure, imshow(unsharp4)
title('Sharpened Image4');