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

%4. Aplicar a la imagen sin ruido y con ruido los filtros basados
%en la primera derivada de gausiana o detectores de borde siguientes:
%   a) De bloque [1 -1].
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