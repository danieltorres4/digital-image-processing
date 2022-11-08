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
%Ejercicio 1.1
A = imread('pentagon.tif');

N=2;
M=2;
C = [ 1 2 3; 4 5 6; 7 8 9];

ceros_col = zeros(length(A),1); %1
ceros_row = zeros(1, length(A)*2);%1
ceros_row2 = zeros(1, length(A)*4);%1
c_col = [];
c_col2 = [];
c_pad = [];
c_pad2 = [];

%rellenado de columnas 2x2
for i=1:length(A)
   aux = A(1:end, i);
   aux2 = [aux ceros_col];
   c_col = [c_col  aux2];
end

%rellenado de filas 2x2
for i=1:length(A)
    filas = [c_col(i,1:end);ceros_row];
    c_pad = [c_pad;filas];
end

%rellenado de columnas 4x4
for i=1:length(A)
   aux = A(1:end, i);
   ceros_col2 = [ceros_col ceros_col];
   ceros_col3 = [ceros_col2 ceros_col];
   aux2 = [aux ceros_col3];
   c_col2 = [c_col2  aux2];
end

%rellenado de filas 4x4
for i=1:length(A)
    ceros_row3 = [ceros_row2; ceros_row2];
    ceros_row4 = [ceros_row3; ceros_row2];
    filas = [c_col2(i,1:end);ceros_row4];
    c_pad2 = [c_pad2;filas];
end
%1.2 Obtenga a la magnitud del espectro de la DFT (abs) de cada una de las 
%imágenes sobremuestreadas y de la imagen original. Despliegue los 
%resultados en una misma figura para efectos de comparación (en Matlab se 
%puede usar el comando subplot). Recuerde usar fftshift para centrar los 
%espectros y una función de escalamiento para el despliegue, ejemplo: 
%ImFDespliegue=log(1.0 + ImF), donde ImF es la DFT de la imagen con sobremuestreo.
dftor = fftshift(abs(log(fft2(A))));
dft2x2 = fftshift(abs(log(fft2(c_pad))));
dft4x4 = fftshift(abs(log(fft2(c_pad2))));

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
%convolución 2x2
aux = 0;
for i=1:length(c_pad)
    for j=1:length(c_pad)
        if mod(i,2) ~= 0
            if c_pad(i,j) == 0
                c_pad(i,j) = aux;
            else
                aux = c_pad(i,j);
            end
        else
            c_pad(i,j) = c_pad(i-1,j);
        end
        
    end
end

%convolución 4x4
aux = 0;
pos = 1;
for i=1:length(A)
    for k=pos:(pos+3)
        if k == pos
            for j=1:length(c_pad2)
                if c_pad2(k,j) == 0
                    c_pad2(k,j) = aux;
                else
                    aux = c_pad2(k,j);
                end
            end
        else
            for j=1:length(c_pad2)
                if c_pad2(k,j) == 0
                    c_pad2(k,j) = c_pad2(k-1,j);
                end
            end
        end
    end
    pos = k + 1;
end

p2 = uint8([1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1]);
conv = conv2(c_pad, p2);
%conv = c_pad .* p2;

conv(length(conv),:) = []; %se elimina la ultima fila
conv(:,length(conv)) = []; %se elimina la ultima columna


figure("name","Interpolador de orden cero 2x2");  %AGREGAR EN SUBPLOT
imshow(c_pad);
%zoom(10)
title("Interpolador de orden cero de 2x2")

figure("name","Interpolador de orden cero 4x4");
imshow(c_pad2);
%zoom(10)
title("Interpolador de orden cero de 4x4")


E = repmat(C,2);

grayImg = A;

up2x2 = uint8(UPSAMPLE(grayImg, 2, 2));
up4x4 = uint8(UPSAMPLE(grayImg, 4, 4));

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

%Ejercicio 2.2
subplot(3, 2, 1)
imshow(fftshift(abs(log(fft2(c_pad)))), []);  
title("Zoom 4x4")
subplot(3, 2, 2)
imshow(fftshift(abs(log(fft2(c_pad2)))), []);
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
%3.1 DFT de imagen original
DFTOriginal = fft2(A);
imshow(log(DFTOriginal), []);
title("3.1 DFT ORIGINAL")
%3.2 DFT con ceros alrededor
DFTwithPading2x2 = padarray(fftshift(DFTOriginal), fix(size(A)/2), 0, 'both');
DFTwithPading4x4 = padarray(fftshift(DFTOriginal), fix(size(A)*(3/2)), 0, 'both'); %AGREGAR SUBPLOT
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
imshow(fftshift(abs(log(fft2(c_pad2)))), []);
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


