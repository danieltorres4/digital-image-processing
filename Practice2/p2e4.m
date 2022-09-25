%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%           Practice 2 - Dithering            %%% 
%%%                 Team members                %%%
%%%         +Herrera Godina Adriana Jocelyn     %%%
%%%            +Miranda Miranda Emiliano        %%%
%%%          +Nicolás Marín Brian Geovanny      %%%
%%%          +Sanchez Torres Sergio Daniel      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%a) Cuantice una imagen con 1 bit de profundidad
%AGREGANDO IMAGEN EN ESCALA DE GRISES
zebraengrises=imread('original.jpeg');
%ABRIENDO IMAGEN PARA COMPARAR
figure(1),imagesc(zebraengrises),axis image
%CALCULANDO LA INTENSIDAD PROMEDIO DE LA IMAGEN PARA BINARIZAR 
%USANDO A(:) CONVIRTIENDO UNA MATRIZ BIDIMENSIONAL EN UN VECTOR 
%DIVIDIMOS EL VALOR MÁXIMO DE ESE VECTOR QUE TOMA LA IMAGEN 
level=mean(zebraengrises(:))/double(max(zebraengrises(:)));
%COMPARAMOS EL VECTOR 
figure(2), imagesc(zebraengrises/max(zebraengrises(:))>level), axis image 




%d) Implemente el método de dithering con difusión del error de Floyd-Steinberg
image = double(imread("original.jpeg")) ./ 255;
level = round(image .* 1) ./ 1; %MULTIPLICAMOS ELEMENTO POR ELEMENTO LA MATRIZ DE LA IMAGEN Y LUEGO LA DIVIDIMOS Y REDONDEAMOS 
error = image - level;  %RESTAMOS LA IMAGEN MENOS LA CUANTIZACION PARA EL ERROR 
height = size(image(:, :, 1), 1);  %CONVERTIMOS LA MATRIZ BIDIMENSIONAL DE LA IMAGEN EN UN VECTOR PARA LA ALTURA
width = size(image(:, :, 1), 2); %CONVERTIMOS LA MATRIZ BIDIMENSIONAL DE LA IMAGEN EN UN VECTOR PARA EL ANCHO

image_dithered = level; 

%APLICANDO EL METODO DE dithering con difusión del error de Floyd-Steinberg
for y = 1:height - 1
    for x = 2:width - 1
                
        image_dithered(y    , x + 1, :) = image_dithered(y    , x + 1, :) + error(y, x, :) .* 7 / 16;
        image_dithered(y + 1, x - 1, :) = image_dithered(y + 1, x - 1, :) + error(y, x, :) .* 3 / 16;
        image_dithered(y + 1, x    , :) = image_dithered(y + 1, x    , :) + error(y, x, :) .* 5 / 16;
        image_dithered(y + 1, x + 1, :) = image_dithered(y + 1, x + 1, :) + error(y, x, :) .* 1 / 16;
        
    end
end
figure(3),imshow(dither(mean(image, 3))), axis image  % Image 2