%1. Para todos los puntos siguientes, utilizar una imagen sin ruido y otra imagen con ruido. La imagen con
%ruido se puede generar a partir de la imagen sin ruido usando el siguiente comando de MATLAB: J =
%IMNOISE(I,TIPO...), donde TIPO es una cadena que puede tomar valores 'gaussian' ,'localvar', etc .
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

%3. Aplicar los filtros paso bajas binomiales a la imagen sin ruido y a la imagen con ruido usando filtros de orden 3x3, 7x7, 9x9 y 11x11.


%4. Aplicar a la imagen sin ruido y con ruido los filtros basados
%en la primera derivada de gausiana o detectores de borde siguientes:
%   a) De bloque [1 -1].
bloque = edge(imagen, 'zerocross', [1 -1]); %Detecta bordes observando los cruces por cero después de filtrar la imagen con un filtro de bloque especificado
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



%5. De igual manera, aplicar a la imagen sin ruido y a la imagen con ruido los filtros basados en la segunda derivada de gausiana siguientes:

%a)El Laplaciano 3x3 que encuentre en la literatura, por ejemplo, el filtro con 8 al centro y rodeado de -1’s.
alpha = 0.2; %forma el filtro de 8 en el centro y rodeado de -1s
laplacian = fspecial('laplacian',alpha); %Filtro de 3 por 3 que aproxima la forma del operador laplaciano bidimensional
imglap = imfilter(imagen,laplacian);
imglapnoise = imfilter(imagenruido,laplacian);

figure("name",'Segunda derivada: Laplaciano')
imshowpair(imglap, imglapnoise, "montage")
title('3x3 Laplacian without noise vs with noise')

%b) Laplacianos basados en la segunda derivada de Gaussiana de orden 5x5, 7x7 y 11x11, constrúyalos con el método visto en clase.
LapGauss5 = fspecial('log',[5 5]); %filtro laplaciano-gaussiano rotacionalmente simétrico de tamaño hsize
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
