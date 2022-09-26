%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       Practice 3 - Equalization         %%% 
%%%             Team members                %%%
%%%     +Herrera Godina Adriana Jocelyn     %%%
%%%        +Miranda Miranda Emiliano        %%%
%%%      +Nicolás Marín Brian Geovanny      %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EJERCICIO 2
%a) Desplegar las imágenes satelitales cortando o 
% eliminando las zonas donde la información es nula. Desplegar
% además el histograma correspondiente a cada una de ellas.
zonaA = imread("zonaA_b5.tif");
zonaB = imread("zonaB_b5.tif");
%J=imcrop(zonaA);%selecciona con el mouse la region a recortar
%L=imcrop(zonaB);
%figure(2)
%figure(3)
%imshow(L)
%imshow(J) % muestra la imagen recortada
imagensinzonanula = imcrop(zonaA,[0.5 0.5 1765 1500]);
sz1 = size(imagensinzonanula);
%figure(1)
%imshow(imagensinzonanula)

imagensinzonanulaB = imcrop(zonaB,[1222.5 4.5 1278 1496]);
sz2 = size(imagensinzonanulaB);
imagensinzonanulaB = imresize(imagensinzonanulaB, [1500,1766]);
sz3 = size(imagensinzonanulaB);
%figure(2)
%imshow(imagensinzonanulaB)

%GENERANDO HISTOGRAMAS
histeqZonaA = histeq(imagensinzonanula);
figure("name", "Imagen ZonaA y su histograma")
subplot(1,2,1)
imhist(imagensinzonanula)
subplot(1,2,2)
imshow(imagensinzonanula)
title('ZONA A')

histeqZonaB = histeq(imagensinzonanulaB);
figure("name", "Imagen ZonaB y su histograma")
subplot(1,2,1)
imhist(imagensinzonanulaB)
subplot(1,2,2)
imshow(imagensinzonanulaB)
title('ZONA B')

%%%%%%%%%%Inciso b%%%%%%%%%%
combImg = imadd(imagensinzonanula, imagensinzonanulaB, 'uint16');
figure("name", "Mosaico de Zona A y Zona B")
imshow(combImg,[])

figure("name","Comparisson")
subplot(1,3,1) 
imshow(imagensinzonanula)
title('ZONA A')
subplot(1,3,2)
imshow(imagensinzonanulaB)
title('ZONA B')
subplot(1,3,3)
imshow(combImg, [])
title('MOSAICO')

%%%%%%%%%%Inciso c%%%%%%%%%%
combImg2 = imfuse(imagensinzonanula, imagensinzonanulaB, 'montage');
figure("name", "Mosaico Traslape")
imshow(combImg2)
title('Mosaico Traslape')

%TRASLAPE 
%C=imcrop(combImg2);
%imshow(C)
traslape = imcrop(combImg2,[1632.5 0.5 262 1500]);
%imshow(traslape)

figure("name", "Traslape y su histograma")
subplot(1,2,1)
imhist(traslape)
subplot(1,2,2)
imshow(traslape)
title('TRASLAPE')

%%%%%%%%%%Inciso e%%%%%%%%%%
histeqMosaico = histeq(combImg);
figure("name","Mosaico con histograma ecualizado")
subplot(1,2,1)
imshow(histeqMosaico)
subplot(1,2,2)
imhist(histeqMosaico)

%%%%%%%%%%Inciso f%%%%%%%%%%
mosaico128 = histeq(combImg,128);
figure("name","Mosaico con 128 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico128)
subplot(1,2,2)
imhist(mosaico128)

mosaico64 = histeq(combImg,64);
figure("name","Mosaico con 64 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico64)
subplot(1,2,2)
imhist(mosaico64)

mosaico32 = histeq(combImg,32);
figure("name","Mosaico con 32 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico32)
subplot(1,2,2)
imhist(mosaico32)

mosaico16 = histeq(combImg,16);
figure("name","Mosaico con 16 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico16)
subplot(1,2,2)
imhist(mosaico16)

mosaico8 = histeq(combImg,8);
figure("name","Mosaico con 8 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico8)
subplot(1,2,2)
imhist(mosaico8)

mosaico2 = histeq(combImg,2);
figure("name","Mosaico con 2 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico2)
subplot(1,2,2)
imhist(mosaico2)