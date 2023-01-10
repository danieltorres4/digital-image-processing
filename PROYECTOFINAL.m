%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%             FINAL PROJECT               %%% 
%%%             Team members                %%%
%%%     +Herrera Godina Adriana Jocelyn     %%%
%%%        +Miranda Miranda Emiliano        %%%
%%%      +Nicolás Marín Brian Geovanny      %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%PROYECTO FINAL %
%1.Visualización de las mascaras de segmentación en blanco y negro
%CORTE 1
dicom1 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0140.dcm");
y = dicomread(dicom1);
%CORTE2
dicom2 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0141.dcm");
y2 = dicomread(dicom2);
%CORTE3
dicom3 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0142.dcm");
y3 = dicomread(dicom3);
%CORTE4
dicom4 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0143.dcm");
y4 = dicomread(dicom4);
%CORTE5
dicom5 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0144.dcm");
y5 = dicomread(dicom5);
%CORTE6
dicom6 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0145.dcm");
y6 = dicomread(dicom6);
%CORTE7
dicom7 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0146.dcm");
y7 = dicomread(dicom7);
%CORTE8
dicom8 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0147.dcm");
y8 = dicomread(dicom8);
%CORTE9
dicom9 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0148.dcm");
y9 = dicomread(dicom9);
%CORTE10
dicom10 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0149.dcm");
y10 = dicomread(dicom10);
%CORTE11
dicom11 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0150.dcm");
y11 = dicomread(dicom11);
%CORTE12
dicom12 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0151.dcm");
y12 = dicomread(dicom12);
%CORTE13
dicom13 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0152.dcm");
y13 = dicomread(dicom13);
%CORTE14
dicom14 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0153.dcm");
y14 = dicomread(dicom14);
%CORTE15
dicom15 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0154.dcm");
y15 = dicomread(dicom15);
%CORTE16
dicom16 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0155.dcm");
y16 = dicomread(dicom16);
%CORTE6
dicom17 = dicominfo("BOULLOSA-MADRAZO-ANTONIO1r.0156.dcm");
y17 = dicomread(dicom17);

%DISMINUCIÒN DE RUIDO 
%Se hace un filtrado de mediana en el que cada pixel de salida
%contiene el valor de la mediana. Se usa medfilt
Y = medfilt2(y);
Y2 = medfilt2(y2);
Y3 = medfilt2(y3);
Y4 = medfilt2(y4);
Y5 = medfilt2(y5);
Y6 = medfilt2(y6);
Y7 = medfilt2(y7);
Y8 = medfilt2(y8);
Y9 = medfilt2(y9);
Y10 = medfilt2(y10);
Y11 = medfilt2(y11);
Y12 = medfilt2(y12);
Y13 = medfilt2(y13);
Y14 = medfilt2(y14);
Y15 = medfilt2(y15);
Y16 = medfilt2(y16);
Y17 = medfilt2(y17);

%SEGMENTACION MANUAL
%Mostramos la imagen con imshow. Luego, usamos roi (región de interés de
%una imagen). Sirve para trazar figuras (cuadrados, polígonos, etc.). A su
%vez, con AssistedFreehand podemos especificar forma de la región de
%interés siguiendo los bordes "automáticamente". Usamos draw para dibujar
%la figura antes plasmada. Al final, se crea la máscara de la roi en blanco
%y negro por default
img =imshow(Y,[]);
roi = images.roi.AssistedFreehand(img);
draw(roi)
mask = createMask(roi);

img2 =imshow(Y2,[]);
roi2 = images.roi.AssistedFreehand(img2);
draw(roi2)
mask2 = createMask(roi2);

img3 =imshow(Y3,[]);
roi3 = images.roi.AssistedFreehand(img3);
draw(roi3)
mask3 = createMask(roi3);

img4 =imshow(Y2,[]);
roi4 = images.roi.AssistedFreehand(img4);
draw(roi4)
mask4 = createMask(roi4);

img5 =imshow(Y5,[]);
roi5 = images.roi.AssistedFreehand(img5);
draw(roi5)
mask5 = createMask(roi5);

img6 =imshow(Y6,[]);
roi6 = images.roi.AssistedFreehand(img6);
draw(roi6)
mask6 = createMask(roi6);

img7 =imshow(Y7,[]);
roi7 = images.roi.AssistedFreehand(img7);
draw(roi7)
mask7 = createMask(roi7);

img8 =imshow(Y8,[]);
roi8 = images.roi.AssistedFreehand(img8);
draw(roi8)
mask8 = createMask(roi8);

img9 =imshow(Y9,[]);
roi9 = images.roi.AssistedFreehand(img9);
draw(roi9)
mask9 = createMask(roi9);

img10 =imshow(Y10,[]);
roi10 = images.roi.AssistedFreehand(img10);
draw(roi10)
mask10 = createMask(roi10);

img11 =imshow(Y11,[]);
roi11 = images.roi.AssistedFreehand(img11);
draw(roi11)
mask11 = createMask(roi11);

img12 =imshow(Y12,[]);
roi12 = images.roi.AssistedFreehand(img12);
draw(roi12)
mask12 = createMask(roi12);

img13 =imshow(Y13,[]);
roi13 = images.roi.AssistedFreehand(img13);
draw(roi13)
mask13 = createMask(roi13);

img14 =imshow(Y14,[]);
roi14 = images.roi.AssistedFreehand(img14);
draw(roi14)
mask14 = createMask(roi14);

img15 =imshow(Y15,[]);
roi15 = images.roi.AssistedFreehand(img15);
draw(roi15)
mask15 = createMask(roi15);

img16 =imshow(Y16,[]);
roi16 = images.roi.AssistedFreehand(img16);
draw(roi16)
mask16 = createMask(roi16);

img17 =imshow(Y17,[]);
roi17 = images.roi.AssistedFreehand(img17);
draw(roi17)
mask17 = createMask(roi17);


%MASCARAS SOPREPUESTAS
%Usamos activecontour para técnica de contornos activos: es un algoritmo
%iterativo de segmentación de crecimiento de regiones para poder especficar
%curvas iniciales de una imagen con el fin de delimitar contornos o
%límites.
%
%Recibe varios parámetros:
%   * "edge" que calcula el gradiente por medio de la derivada de un 
%     filtro gaussiano (para detectar bordes intensos y débiles). Hay otros
%     métodos pero se eligió este porque se veía mejor
%   * 200 es la intensidad a observar
%   * máscara
%   * 'Y' es la imagen original
%
%Se usa hold on para mantener los cortes hechos en cada imagen
%visboundaries sirve para encontrar las ubicaciones de los pixeles del
%límite en la imagen. Recibe 3 parámetros:
%   * bw es el contorno
%   * color
%   * valor del color
%
%Labeloverlay fusiona la imagen de entrada (dicom) con la máscara. Esto se
%mostrará en la Figura 2 más adelante...
bw = activecontour(Y,mask,200,'edge');
hold on;
visboundaries(bw,'Color','r'); 
imge1 = labeloverlay(Y,bw);

bw2 = activecontour(Y2,mask2,200,'edge');
hold on;
visboundaries(bw2,'Color','r');
imge2 = labeloverlay(Y2,bw2);

bw3 = activecontour(Y3,mask3,200,'edge');
hold on;
visboundaries(bw3,'Color','r'); 
imge3 = labeloverlay(Y3,bw3);

bw4 = activecontour(Y4,mask4,200,'edge');
hold on;
visboundaries(bw4,'Color','r'); 
imge4 = labeloverlay(Y4,bw4);

bw5 = activecontour(Y,mask5,200,'edge');
hold on;
visboundaries(bw5,'Color','r'); 
imge5 = labeloverlay(Y,bw5);

bw6 = activecontour(Y,mask6,200,'edge');
hold on;
visboundaries(bw6,'Color','r'); 
imge6 = labeloverlay(Y,bw6);

bw7 = activecontour(Y7,mask7,200,'edge');
hold on;
visboundaries(bw,'Color','r'); 
imge7 = labeloverlay(Y7,bw7);

bw8 = activecontour(Y8,mask8,200,'edge');
hold on;
visboundaries(bw8,'Color','r');
imge8 = labeloverlay(Y8,bw8);

bw9 = activecontour(Y9,mask9,200,'edge');
hold on;
visboundaries(bw9,'Color','r'); 
imge9 = labeloverlay(Y9,bw9);

bw10 = activecontour(Y10,mask10,200,'edge');
hold on;
visboundaries(bw10,'Color','r'); 
imge10 = labeloverlay(Y10,bw10);

bw11 = activecontour(Y11,mask11,200,'edge');
hold on;
visboundaries(bw11,'Color','r'); 
imge11 = labeloverlay(Y11,bw11);

bw12 = activecontour(Y12,mask12,200,'edge');
hold on;
visboundaries(bw12,'Color','r'); 
imge12 = labeloverlay(Y12,bw12);

bw13 = activecontour(Y13,mask13,200,'edge');
hold on;
visboundaries(bw13,'Color','r'); 
imge13 = labeloverlay(Y13,bw13);

bw14 = activecontour(Y14,mask14,200,'edge');
hold on;
visboundaries(bw14,'Color','r'); 
imge14 = labeloverlay(Y14,bw14);

bw15 = activecontour(Y15,mask15,200,'edge');
hold on;
visboundaries(bw15,'Color','r'); 
imge15 = labeloverlay(Y15,bw15);

bw16 = activecontour(Y16,mask16,200,'edge');
hold on;
visboundaries(bw16,'Color','r'); 
imge16 = labeloverlay(Y16,bw16);

bw17 = activecontour(Y17,mask17,200,'edge');
hold on;
visboundaries(bw17,'Color','r'); 
imge17 = labeloverlay(Y17,bw17);


%Se muestran las imágenes resultantes por medio de un montaje
figure("name","MASCARAS SOBREPUESTAS A LA IMAGEN ORIGINAL")
montage({imge1,imge2,imge3,imge4,imge5,imge6,imge7,imge8,imge9,imge10,imge11,imge12,imge13,imge14,imge15,imge16,imge17})
title('MONTAJE MASCARA SOBREPUESTA A LA IMAGEN ORIGINAL 1-6');

figure("name","MASCARAS BLANCO Y NEGRO")
montage({mask,mask2,mask3,mask4,mask5,mask6,mask7,mask8,mask9,mask10,mask11,mask12,mask13,mask14,mask15,mask16,mask17})
title('MONTAJE MASCARA 1-6');
