%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       Practice 2 - Dithering            %%% 
%%%             Team members                %%%
%%%     +Herrera Godina Adriana Jocelyn     %%%
%%%        +Miranda Miranda Emiliano        %%%
%%%      +Nicolás Marín Brian Geovanny      %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imgp2 = imread('original.jpeg'); 
imgp2 = rgb2gray(imgp2);

%To double scale
imgp2 = im2double(imgp2);
sz = size(imgp2);

%Matrix coefficients
M2 = [1 2; 3 4];
M4 = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];

%Normalizing the matrix coefficients
M2 = (M2-1)/4;
M4 = (M4-1)/12;

%Creating mask by tiling the coefficient matrix 
%so that it covers the same area as the image
n_mat2 = size(M2);
n_mat4 = size(M4);

t2 = repmat(M2,ceil(sz./n_mat2));
t2 = t2(1:sz(1),1:sz(2));

t4 = repmat(M4,ceil(sz./n_mat4));
t4 = t4(1:sz(1),1:sz(2));

%Binarize image by comparing gray levels to tiled mask
dither_mat2 = imgp2 > t2;
dither_mat4 = imgp2 > t4;

figure(1)
imshow(dither_mat2)

figure(2)
imshow(dither_mat4)