%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%        Practice - Interpolation         %%%
%%%             Team members                %%%
%%%     +Herrera Godina Adriana Jocelyn     %%%
%%%        +Miranda Miranda Emiliano        %%%
%%%      +Nicolás Marín Brian Geovanny      %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ejercicio 1 - Sobremuestreo espacial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pentImg = imread("pentagon256x256.tif");
figure('name',"IMAGEN ORIGINAL");
imshow(pentImg);
title("Imagen Original");

%1.1 Obtenga el sobremuestreo de la imagen original insertando ceros entre 
%los pixeles de la misma con factores $T \uparrow = 2 \times 2$ y $T 
%\uparrow = 4 \times 4$
%Sobremuestreo 2x2
B = zeros([size(pentImg,1) * 2 size(pentImg,2) * 2]);
B(1:2:end, 1:2:end) = pentImg;

%Sobremuestreo 4x4
C = zeros([size(pentImg,1) * 4 size(pentImg,2) * 4]);
C(1:4:end, 1:4:end) = pentImg;

figure('name',"1.1")
subplot(1,2,1);
image(B);
colormap(gray);
title("SOBREMUESTREO DE 2x2");

subplot(1,2,2);
image(C);
colormap(gray);
title("SOBREMUESTREO DE 4x4");

%1.2 Obtenga a la magnitud del espectro de la DFT (abs) de cada una de las 
%imágenes sobremuestreadas y de la imagen original. Despliegue los 
%resultados en una misma figura para efectos de comparación (en Matlab se 
%puede usar el comando subplot). Recuerde usar fftshift para centrar los 
%espectros y una función de escalamiento para el despliegue, ejemplo: 
%ImFDespliegue=log(1.0 + ImF), donde ImF es la DFT de la imagen con sobremuestreo.
dftor = fftshift(abs(log(fft2(pentImg))));
dft2x2 = fftshift(abs(log(fft2(pentImg))));
dft4x4 = fftshift(abs(log(fft2(B))));

figure('name',"1.2");
subplot(2,2,1);
imshow(dftor, []);
title("DFT DE IMAGEN ORIGINAL");

subplot(2,2,2);
imshow(dft2x2, []);
title("DFT DE IMAGEN CON SOBREMUESTREO 2x2");

subplot(2,2,3);
imshow(dft4x4, []);
title("DFT DE IMAGEN CON SOBREMUESTREO 4x4");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ejercicio 2 - Interpolación espacial. Interpole las imágenes con
%sobremuestreo obtenidas en el inciso anterior (con factores $T \uparrow = 
%2 \times 2$ y $T \uparrow = 4 \times 4$) usando interpoladores:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Img = imread("pentagon256x256.tif");
grayImg = Img;

up2x2 = uint8(UPSAMPLE(grayImg, 2, 2));
up4x4 = uint8(UPSAMPLE(grayImg, 4, 4));

%Interpolación de orden cero
ordenCero2x2 = [1; 1]*[1, 1];   
interOrdenCero2x2 = uint8(conv2(up2x2, ordenCero2x2));
figure("name", "Interpolacion de orden cero 2x2");
imshow(interOrdenCero2x2)

ordenCero4x4 = [1; 1; 1; 1]*[1, 1, 1, 1];   
interOrdenCero4x4 = uint8(conv2(up4x4, ordenCero4x4));
figure("name", "Interpolacion de orden cero 4x4");
imshow(interOrdenCero4x4)

%Interpolación lineal 
lineal2x2 = [1/2; 1; 1/2]*[1/2 1 1/2];
interLineal2x2 = uint8(conv2(up2x2, lineal2x2));
figure("name", "Interpolacion lineal 2x2");
imshow(interLineal2x2)

lineal4x4 = [1/2; 1; 1; 1; 1/2]*[1/2, 1, 1, 1, 1/2];
interLineal4x4 = uint8(conv2(up4x4, lineal4x4));
figure("name", "Interpolacion lineal 4x4");
imshow(interLineal4x4)

%Interpolación cubica 
cubica2x2 = cubic([-2:4/9:2])'*cubic([-2:4/9:2]);
intercubica2x2 = uint8(conv2(up2x2, cubica2x2));
figure("name", "Interpolacion cubica 2x2");
imshow(intercubica2x2)

cubica4x4 = cubic([-2:4/17:2])'*cubic([-2:4/17:2]);
intercubica4x4 = uint8(conv2(up4x4, cubica4x4));
figure("name", "Interpolacion cubica 4x4");
imshow(intercubica4x4)

%DFT 
subplot(3, 2, 1)
imshow(fftshift(abs(log(fft2(interOrdenCero2x2)))), []);
title("DFT Interpolación orden cero 2x2")
subplot(3, 2, 2)
imshow(fftshift(abs(log(fft2(interOrdenCero4x4)))), []);
title("DFT Interpolación orden cero 4x4")

subplot(3, 2, 3)
imshow(fftshift(abs(log(fft2(interLineal2x2)))), []);
title("DFT Interpolación Lineal 2x2")
subplot(3, 2, 4)
imshow(fftshift(abs(log(fft2(interLineal4x4)))), []);
title("DFT Interpolación Lineal 4x4")

subplot(3, 2, 5)
imshow(fftshift(abs(log(fft2(intercubica2x2)))), []);
title("DFT Interpolación Cubica 2x2")
subplot(3, 2, 6)
imshow(fftshift(abs(log(fft2(intercubica4x4)))), []);
title("DFT Interpolación Cubica 4x4")


%%%%%%%%%%%%
%Ejercicio 3
%%%%%%%%%%%%
grayImg = pentImg;

%3.1 DFT de imagen original
DFTOriginal = fft2(pentImg);
imshow(log(DFTOriginal), []);
title("3.1 DFT ORIGINAL")

%3.2 DFT con ceros alrededor
DFTwithPading2x2 = padarray(fftshift(DFTOriginal), fix(size(pentImg)/2), 0, 'both');
DFTwithPading4x4 = padarray(fftshift(DFTOriginal), fix(size(pentImg)*(3/2)), 0, 'both');
figure("name", "DFT(abs) con ceros alrededor 2x2")
imshow((log(DFTwithPading2x2)), [])
title("3.2 DFT CON CEROS ALREDEDOR 2x2")
figure("name", "DFT(abs) con ceros alrededor 4x4")
imshow((log(DFTwithPading4x4)), [])
title("3.2 DFT CON CEROS ALREDEDOR 4x4")


%3.3 Comparacion de DFT
subplot(4, 1, 1)
imshow(fftshift(abs(log(fft2(DFTwithPading2x2)))), []);
title("DFT Interpolación orden cero 2x2")
subplot(4, 1, 2)
imshow(fftshift(abs(log(fft2(interLineal2x2)))), []);
title("DFT Interpolación Lineal 2x2")
subplot(4, 1, 3)
imshow(fftshift(abs(log(fft2(intercubica2x2)))), []);
title("DFT Interpolación cubica 2x2")
subplot(4, 1, 4)
imshow((log(DFTwithPading2x2)), [])
title("DFT Interpolación en frecuencia 2x2")

figure();
subplot(4, 1, 1)
imshow(fftshift(abs(log(fft2(interOrdenCero4x4)))), []);
title("DFT Interpolación orden cero 4x4")
subplot(4, 1, 2)
imshow(fftshift(abs(log(fft2(interLineal4x4)))), []);
title("DFT Interpolación Lineal 4x4")
subplot(4, 1, 3)
imshow(fftshift(abs(log(fft2(intercubica4x4)))), []);
title("DFT Interpolación cubica 4x4")
subplot(4, 1, 4)
imshow((log(DFTwithPading4x4)), [])
title("DFT Interpolación en frecuencia 4x4")

%3.5 DFT Inversa
DFTinverse2x2 = abs(ifft2(DFTwithPading2x2));
DFTinverse4x4 = abs(ifft2(DFTwithPading4x4));
figure("name", "DFT Inversa 2x2")
imshow(DFTinverse2x2, [])
title("3.5 DFT INVERSA 1")
figure("name", "DFT Inversa 4x4")
imshow(DFTinverse4x4, [])
title("3.5 DFT INVERSA 2")



function B = UPSAMPLE(A,N,M)
    B = zeros([size(A,1)*M size(A,2)*N]);
    B(1:M:end,1:N:end) = A;
end 
 
function f = cubic(x)

        absx = abs(x);
        absx2 = absx.^2;
        absx3 = absx.^3;

        f = (1.5*absx3 - 2.5*absx2 + 1) .* (absx <= 1) + ...
                        (-0.5*absx3 + 2.5*absx2 - 4*absx + 2) .* ...
                        ((1 < absx) & (absx <= 2));
                    
end