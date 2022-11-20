%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%         MATHEMATICAL MORPHOLOGY         %%%
%%%                                         %%%
%%%      +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread("ImagenSegmentada.png");
figure("name","ORIGINAL IMAGE");
imshow(img);
title("ORIGINAL IMAGE");

se1 = strel('line',11,90);
se2 = offsetstrel('ball',5,5);

%Dilatation
dilatedImage1 = imdilate(img,se1);
dilatedImage2 = imdilate(img,se2);
figure("name","DILATED IMAGES");
imshowpair(dilatedImage1,dilatedImage2,'montage');
title("USING 'line' AS PARAMETER vs USING 'ball' AS PARAMETER");

%Erosion
eroredImg1 = imerode(img, se1);
eroredImg2 = imerode(img, se2);

figure("name","ERORED IMAGES");
imshowpair(eroredImg1,eroredImg2,'montage');
title("USING 'line' AS PARAMETER vs USING 'ball' AS PARAMETER");

%Opening
seo = strel('disk',5);
openingImg = imopen(img,seo);
figure("name","OPENING");
imshow(openingImg,[]);
title("IMAGE WITH OPENING");

%Closing
closingImage = imclose(img,seo);
figure("name","CLOSING");
imshow(closingImage);
title("IMAGE WITH CLOSING");