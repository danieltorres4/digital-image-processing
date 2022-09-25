%EJERCICIO 2
%a) Desplegar las imágenes satelitales cortando o eliminando las zonas donde la información es nula. Desplegar
% además el histograma correspondiente a cada una de ellas.
%zonaA = imread("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\zonaA_b5.tif");
zonaB=imread("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\zonaB_b5.tif");
%J=imcrop(zonaA);%selecciona con el mouse la region a recortar
%L=imcrop(zonaB);
%figure(2)
%figure(3)
%imshow(L)
%imshow(J) % muestra la imagen recortada
imagensinzonanula = imcrop(zonaA,[0.5 0.5 1765 1500]);
figure(4)
imshow(imagensinzonanula)
imagensinzonanulaB = imcrop(zonaB,[1222.5 4.5 1278 1496]);
figure(5)
imshow(imagensinzonanulaB)
%GENERANDO HISTOGRAMAS
histograma2 = histeq(imagensinzonanula);
figure("name", "Imagen ZonaA y su histograma")
subplot(1,2,1)
imhist(imagensinzonanula)
subplot(1,2,2)
imshow(histograma2)
title('HISTOGRAMA DE ZONA A')

histograma3 = histeq(imagensinzonanulaB);
figure("name", "Imagen ZonaB y su histograma")
subplot(1,2,1)
imhist(imagensinzonanulaB)
subplot(1,2,2)
imshow(histograma3)
title('HISTOGRAMA DE ZONA B')