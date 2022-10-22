%1. Para todos los puntos siguientes, utilizar una imagen sin ruido y otra imagen con ruido. La imagen con
%ruido se puede generar a partir de la imagen sin ruido usando el siguiente comando de MATLAB: J =
%IMNOISE(I,TIPO...), donde TIPO es una cadena que puede tomar valores 'gaussian' ,'localvar', etc .
imagen = imread('C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\paisaje.JPG');
imshow(imagen)
imagenruido= imnoise(imagen,'gaussian');
imshow(imagenruido)

%2.Aplicar los filtros paso bajas de bloque a la imagen sin ruido y a la imagen con ruido usando filtros de
%orden 3x3, 7x7, 9x9 y 11x11.
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
subplot(2,2,1); 
imshow(imsrfl1); 
title('Filtro 3x3');
subplot(2,2,2); 
imshow(imsrfl2); 
title('Filtro 5x5');
subplot(2,2,3); 
imshow(imsrfl3); 
title('Filtro 7x7');
subplot(2,2,4); 
imshow(imsrf4); 
title('Filtro 11x11');
% Aplicando filtros a la imagen con ruido
imcrfl1 = imfilter(imagenruido,fl1);
imcrfl2 = imfilter(imagenruido,fl2);
imcrfl3 = imfilter(imagenruido,fl3);
imcrfl4 = imfilter(imagenruido,fl4);
%Se muestran los resultados de aplicar los filtros
subplot(2,2,1); 
imshow(imcrfl1); 
title('Filtro 3x3');
subplot(2,2,2); 
imshow(imcrfl2); 
title('Filtro 5x5');
subplot(2,2,3); 
imshow(imcrfl3); 
title('Filtro 7x7');
subplot(2,2,4); 
imshow(imcrfl4); 
title('Filtro 11x11');

%4. Aplicar a la imagen sin ruido y con ruido los filtros basados en la primera derivada de gausiana o
%detectores de borde siguientes :
%a) De bloque [1 -1].
%b) Prewitt en la dirección X y en la dirección Y.
%Sin ruido 
pwr= edge(imagen,'Prewitt');
imshow(pwr)
%Con ruido 
pwr2= edge(imagenruido,'Prewitt');
imshow(pwr2)
%c) Sobel en la dirección X y en la dirección Y.
%Sin ruido 
sobel = edge(imagen);
imshow(sobel)
%Con ruido ruido 
sobel2 = edge(imagenruido);
imshow(sobel2)
%d) Basados en la primera derivada de Gaussiana de orden 5x5, 7x7 y 11x11.

