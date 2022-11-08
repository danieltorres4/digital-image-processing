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

figure("name","sobremuestreo 2x2");
imshow(c_pad);
%zoom(10)
title("sobremuestreo de 2x2")

figure("name","sobremuestreo 4x4");
imshow(c_pad2);
%zoom(10)
title("sobremuestreo de 4x4")
%Ejercicio1.2

figure("name"," DFT sobremuestreo 2x2");
imshow(fftshift(abs(log(fft2(c_pad)))), []);
title("DFT sobremuestreo 2x2");

figure("name"," DFT sobremuestreo 4x4");
imshow(fftshift(abs(log(fft2(c_pad2)))), []);
title("DFT sobremuestreo 2x2");

%Ejercicio 2
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


figure("name","Interpolador de orden cero 2x2");
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
figure("name","Zoom 2x2");
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

