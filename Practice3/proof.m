I = imread('pinos512.tif');

figure("name","Equalized image and its histogram")
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imhist(I)

J = histeq(I);

figure(2)
subplot(1,2,1)
imshow(J)
subplot(1,2,2)
imhist(J)