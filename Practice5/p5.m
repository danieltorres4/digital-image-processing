%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       Practice 5 - Linear, Circular,    %%%
%%%           and Fourier Convolution       %%%
%%%             Team members                %%%
%%%     +Herrera Godina Adriana Jocelyn     %%%
%%%        +Miranda Miranda Emiliano        %%%
%%%      +Nicolás Marín Brian Geovanny      %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

originalImage = imread('pentagon256x256.tif');

figure("name","Original Image")
imshow(originalImage)

%linearConv7x7 = conv2(originalImage,'full');
%linearConv9x9
%linearConv11x11