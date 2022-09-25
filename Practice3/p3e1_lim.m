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
figure("name","Original image and its histogram")
subplot(1,2,1)
imshow(pinesimg)
subplot(1,2,2)
imhist(pinesimg)

% 1b- Equalize the image histogram and show the
% result: new image and new histogram
pineshisteq = histeq(pinesimg);

figure("name","Equalized image and its histogram")
subplot(1,2,1)
imshow(pineshisteq)
subplot(1,2,2)
imhist(pineshisteq)

% 1c- Equalize the histogram using 128, 64,
% 32, 16, 8, and 2 quantization levels. 
lvl128 = histeq(pinesimg, 128);
figure("name","Equalized image with 128 quantization levels and its histogram")
subplot(1,2,1)
imshow(lvl128)
subplot(1,2,2)
imhist(lvl128)

lvl64 = histeq(pinesimg, 64);
figure("name","Equalized image with 64 quantization levels and its histogram")
subplot(1,2,1)
imshow(lvl64)
subplot(1,2,2)
imhist(lvl64)

lvl32 = histeq(pinesimg, 32);
figure("name","Equalized image with 32 quantization levels and its histogram")
subplot(1,2,1)
imshow(lvl32)
subplot(1,2,2)
imhist(lvl32)

lvl16 = histeq(pinesimg, 16);
figure("name","Equalized image with 16 quantization levels and its histogram")
subplot(1,2,1)
imshow(lvl16)
subplot(1,2,2)
imhist(lvl16)

lvl8 = histeq(pinesimg, 8);
figure("name","Equalized image with 8 quantization levels and its histogram")
subplot(1,2,1)
imshow(lvl8)
subplot(1,2,2)
imhist(lvl8)

lvl2 = histeq(pinesimg, 2);
figure("name","Equalized image with 2 quantization levels and its histogram")
subplot(1,2,1)
imshow(lvl2)
subplot(1,2,2)
imhist(lvl2)