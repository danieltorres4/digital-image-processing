%%%%%%%%%%%%
%Ejercicio 1
%%%%%%%%%%%%
A = imread("pentagon256x256.tif");

%Sobremuestreo 2x2
M = 2;
N = 2;

B = zeros([size(A,1) * M size(A,2) * N]);
B(1:M:end, 1:N:end) = A;

%Sobremuestreo 4x4
O = 4;
P = 4;

C = zeros([size(A,1) * O size(A,2) * P]);
C(1:O:end, 1:P:end) = A;

subplot(3,2,1);
imshow(A);
title("PENTAGON (original)");

subplot(3,2,2);
imshow(fftshift(abs(log(fft2(A)))), []);
title("DFT de pentagon.tif");

subplot(3,2,3);
image(B);
colormap(gray);
title("IS factor 2x2");

subplot(3,2,5);
image(c);
colormap(gray);
title("IS factor 4x4");

subplot(3,2,6);
imshow(fftshift(abs(log(fft2(C)))), []);
title("DFT IS factor 4x4");

%%%%%%%%%%%%
%Ejercicio 2
%%%%%%%%%%%%
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

%%%%%%%%%%%%
%Ejercicio 3
%%%%%%%%%%%%
Img = imread("pentagon256x256.tif");
grayImg = Img;

%3.1 DFT de imagen original
DFTOriginal = fft2(Img);
imshow(log(DFTOriginal), []);
title("3.1 DFT ORIGINAL")

%3.2 DFT con ceros alrededor
DFTwithPading2x2 = padarray(fftshift(DFTOriginal), fix(size(Img)/2), 0, 'both');
DFTwithPading4x4 = padarray(fftshift(DFTOriginal), fix(size(Img)*(3/2)), 0, 'both');
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