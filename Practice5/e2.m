%2- Obtener la DFT de la imagen original y desplegarla de manera amplificada 
%utilizando el logaritmo del módulo de la DFT para dicha amplificación. 
pentImg = imread('pentagon256x256.tif');
%figure("name","Exercise 2");
imshow(pentImg,'InitialMagnification','fit')

F = fft2(pentImg);
F2 = log(abs(F));

%figure("name","Exercise 2 - pt 2");
imshow(F2,[-1 5],'InitialMagnification','fit');
colormap(jet); 
%Cambiar el eje de coordenadas (comando MATLAB ffshift) y nuevamente amplificar.
Y=fft2(pentImg);
F3 = log(abs(Y));
imagesc(abs(fftshift(F3)));