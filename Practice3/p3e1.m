%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       Practice 3 - Equalization         %%% 
%%%             Team members                %%%
%%%     +Herrera Godina Adriana Jocelyn     %%%
%%%        +Miranda Miranda Emiliano        %%%
%%%      +Nicolás Marín Brian Geovanny      %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
pinesimg = imread("Practice3/pinos512.tif");

% 1a- Show the original image and its histogram
figure(1)
imshow(pinesimg)

figure(2)
imhist(pinesimg)

% 1b- Equalize the image histogram and show the
% result: new image and new histogram
pineshisteq = histeq(pinesimg);

figure(3)
imshow(pineshisteq)

figure(4)
imhist(pineshisteq)

% 1c- Equalize the histogram using 128, 64,
% 32, 16, 8, and 2 quantization levels. 
lvl128 = histeq(pinesimg, 128);
figure(5)
imshow(lvl128)
figure(6)
imhist(lvl128)

lvl64 = histeq(pinesimg, 64);
figure(7)
imshow(lvl64)
figure(8)
imhist(lvl64)

lvl32 = histeq(pinesimg, 32);
figure(9)
imshow(lvl32)
figure(10)
imhist(lvl32)

lvl16 = histeq(pinesimg, 16);
figure(11)
imshow(lvl16)
figure(12)
imhist(lvl16)

lvl8 = histeq(pinesimg, 8);
figure(13)
imshow(lvl8)
figure(14)
imhist(lvl8)

lvl2 = histeq(pinesimg, 2);
figure(15)
imshow(lvl2)
figure(16)
imhist(lvl2)