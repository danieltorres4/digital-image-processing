%Ejercicio 3

Img = imread("pentagon256x256.tif");
grayImg = Img;

%DFT de imagen original
DFTOriginal = fft2(Img);
imshow(log(DFTOriginal), []);

%DFT con ceros alrededor
DFTwithPading2x2 = padarray(fftshift(DFTOriginal), fix(size(Img)/2), 0, 'both');
DFTwithPading4x4 = padarray(fftshift(DFTOriginal), fix(size(Img)*(3/2)), 0, 'both');
figure("name", "DFT(abs) con ceros alrededor 2x2")
imshow((log(DFTwithPading2x2)), [])
figure("name", "DFT(abs) con ceros alrededor 4x4")
imshow((log(DFTwithPading4x4)), [])

%Comparacion de DFT
subplot(4, 1, 1)
imshow(fftshift(abs(log(fft2(interOrdenCero2x2)))), []);
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

%DFT Inversa
DFTinverse2x2 = abs(ifft2(DFTwithPading2x2));
DFTinverse4x4 = abs(ifft2(DFTwithPading4x4));
figure("name", "DFT Inversa 2x2")
imshow(DFTinverse2x2, [])
figure("name", "DFT Inversa 4x4")
imshow(DFTinverse4x4, [])