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
title('HISTOGRAMA')
subplot(1,2,2)
imshow(imagensinzonanula)
title('ZONA A')

histeqZonaB = histeq(imagensinzonanulaB);
figure("name", "Imagen ZonaB y su histograma")
subplot(1,2,1)
imhist(imagensinzonanulaB)
title('HISTOGRAMA')
subplot(1,2,2)
imshow(imagensinzonanulaB)
title('ZONA B')

%%%%%%%%%%Inciso b%%%%%%%%%%
combImg = imadd(imagensinzonanula, imagensinzonanulaB, 'uint16');
figure("name", "Mosaico de Zona A y Zona B")
imshow(combImg,[])
title('MOSAICO RESULTANTE')

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
figure("name", "Inciso C Mosaico Traslape")
imshow(combImg2)
title('MOSAICO TRASLAPE')

%TRASLAPE 
%C=imcrop(combImg2);
%imshow(C)
traslape = imcrop(combImg2,[1632.5 0.5 262 1500]);
%imshow(traslape)

figure("name", "Inciso C Traslape y su histograma")
subplot(1,2,1)
imhist(traslape)
title('HISTOGRAMA')
subplot(1,2,2)
imshow(traslape)
title('TRASLAPE')

%%%%%%%%%%Inciso d%%%%%%%%%%
imagenrecortada_A = imcrop(zonaA,[0.5 0.5 1765 1500]);
x = histeq(imagenrecortada_A,128);
figure("Name","Inciso D Zona A recortada y su histograma")
subplot(1,2,1)
imshow(imagensinzonanula)
title("Zona A recortada")
subplot(1,2,2)
imhist(x)
title('HISTOGRAMA ZONA A RECORTADA')

imagensinzonanulaB = imcrop(zonaB,[1222.5 4.5 1278 1496]);
y = histeq(imagensinzonanulaB);
figure("Name","Inciso D Zona B recortada y su histograma")
subplot(1,2,1)
imshow(imagensinzonanulaB)
title("Zona B recortada")
subplot(1,2,2)
imhist(y)
title('HISTOGRAMA ZONA B RECORTADA')

%%%%%%%%%%Inciso e%%%%%%%%%%
histeqMosaico = histeq(combImg);
figure("name","Inciso E Mosaico con histograma ecualizado")
subplot(1,2,1)
imshow(histeqMosaico)
title('MOSAICO ECUALIZADO')
subplot(1,2,2)
imhist(histeqMosaico)
title('HISTOGRAMA')

%%%%%%%%%%Inciso f%%%%%%%%%%
mosaico128 = histeq(combImg,128);
figure("name","Mosaico con 128 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico128)
title('MOSAICO CON 128 NIVELES DE CUANTIZACIÓN')
subplot(1,2,2)
imhist(mosaico128)
title('HISTOGRAMA')

mosaico64 = histeq(combImg,64);
figure("name","Mosaico con 64 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico64)
title('MOSAICO CON 64 NIVELES DE CUANTIZACIÓN')
subplot(1,2,2)
imhist(mosaico64)
title('HISTOGRAMA')

mosaico32 = histeq(combImg,32);
figure("name","Mosaico con 32 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico32)
title('MOSAICO CON 32 NIVELES DE CUANTIZACIÓN')
subplot(1,2,2)
imhist(mosaico32)
title('HISTOGRAMA')

mosaico16 = histeq(combImg,16);
figure("name","Mosaico con 16 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico16)
title('MOSAICO CON 16 NIVELES DE CUANTIZACIÓN')
subplot(1,2,2)
imhist(mosaico16)
title('HISTOGRAMA')

mosaico8 = histeq(combImg,8);
figure("name","Mosaico con 8 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico8)
title('MOSAICO CON 8 NIVELES DE CUANTIZACIÓN')
subplot(1,2,2)
imhist(mosaico8)
title('HISTOGRAMA')

mosaico2 = histeq(combImg,2);
figure("name","Mosaico con 2 niveles de cuantización")
subplot(1,2,1)
imshow(mosaico2)
title('MOSAICO CON 2 NIVELES DE CUANTIZACIÓN')
subplot(1,2,2)
imhist(mosaico2)
title('HISTOGRAMA')