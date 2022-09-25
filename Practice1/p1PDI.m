%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%               Practice 1 - MTF              %%% 
%%%                 Team members                %%%
%%%         +Herrera Godina Adriana Jocelyn     %%%
%%%            +Miranda Miranda Emiliano        %%%
%%%           +Nicolás Geovanny                 %%%
%%%          +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
%CONSTANTS
freq = 1000;
k1 = (2*pi)/((100/511)*log(50));
k2 = (log(50))/511;
k3 = 5;

%FUNCTIONS
fx = linspace(0,512,freq);
fy = linspace(0,1,freq);
fxx = sin(k1*exp(k2*fx));
fyy = exp(-k3*fy);

%figure(1);
%subplot(3,1,1);
%plot(fx, fxx);

%subplot(3,1,2);
%plot(fy,fyy);

%FUNCTION WITH 2 VARIABLES
fxy = fxx.*fyy;
%subplot(3,1,3);
%plot(fx,fxy);

%MATRICES TO MAP F(X) AND F(Y) VALUES 512 TIMES
matX = repmat(fxx,512,1);
matY = repmat(fyy,512,1);
mat1 = matX.*matY;

%SETTING THE IMAGE
matXX = imresize(matX,[512 512]);
matYY = imresize(flip(transpose(matY)),[512 512]);

%STIMULUS
matXY = matXX.*matYY;
figure(2);
imshow(matXY);
axis on