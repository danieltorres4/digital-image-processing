%PROYECTO FINAL %
info = dicominfo("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\PROYECTO\Estudio 1\1\BOULLOSA-MADRAZO-ANTONIO1r.0140");
Y = dicomread(info);
%figure
img =imshow(Y,[]);
%figure
%imshow(BW);

roi = images.roi.AssistedFreehand(img);
draw(roi)

mask = createMask(roi);
bw = activecontour(Y,mask,200,'edge');
hold on;
visboundaries(bw,'Color','r'); 
%figure
img2 = labeloverlay(Y,bw);
BW = imbinarize(img2,0.4);
figure
imshow(img2);

