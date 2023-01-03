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
dicom1 = dicominfo("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\PROYECTO\Estudio 1\1\BOULLOSA-MADRAZO-ANTONIO1r.0140.dcm");
Y = dicomread(dicom1);
%CORTE2
dicom2 = dicominfo("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\PROYECTO\Estudio 1\1\BOULLOSA-MADRAZO-ANTONIO1r.0141.dcm");
Y2 = dicomread(dicom2);
%CORTE3
dicom3 = dicominfo("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\PROYECTO\Estudio 1\1\BOULLOSA-MADRAZO-ANTONIO1r.0142.dcm");
Y3 = dicomread(dicom3);
%CORTE4
dicom4 = dicominfo("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\PROYECTO\Estudio 1\1\BOULLOSA-MADRAZO-ANTONIO1r.0143.dcm");
Y4 = dicomread(dicom4);
%CORTE5
dicom5 = dicominfo("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\PROYECTO\Estudio 1\1\BOULLOSA-MADRAZO-ANTONIO1r.0144.dcm");
Y5 = dicomread(dicom5);
%CORTE6
dicom6 = dicominfo("C:\Users\Adri\Documents\Adriana\2023-1\PROCESAMIENTO DIGITAL DE IMAGENES\PROYECTO\Estudio 1\1\BOULLOSA-MADRAZO-ANTONIO1r.0145.dcm");
Y6 = dicomread(dicom6);


%SEGMENTACION MANUAL
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

%MASCARAS SOPREPUESTAS
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
bw5 = activecontour(Y,mask,200,'edge');
hold on;
visboundaries(bw5,'Color','r'); 
imge5 = labeloverlay(Y,bw5);
bw6 = activecontour(Y,mask,200,'edge');
hold on;
visboundaries(bw6,'Color','r'); 
imge6 = labeloverlay(Y,bw6);
%figure

figure("name","MASCARAS SOBREPUESTAS A LA IMAGEN ORIGINAL")
montage({imge1,imge2,imge3,imge4,imge5,imge6})
title('MONTAJE MASCARA SOBREPUESTA A LA IMAGEN ORIGINAL 1-6');

figure("name","MASCARAS BLANCO Y NEGRO")
montage({mask,mask2,mask3,mask4,mask5,mask6})
title('MONTAJE MASCARA 1-6');
