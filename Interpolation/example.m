
A = imread('pentagon256x256.tif');
[x, y] = size(A);

B = imresize(A,[x*2 y*2]);
%B = imresize(A,[2 2]);
D = imresize(A,[x*4 y*4]);

figure("name","uno");
imshow(A);
title("Imagen Original")
figure("name","dos");
imshow(B);
%zoom(10)
title("2x2 Usando imresize")
figure("name","tres");
imshow(D);
%zoom(10)
title("4x4 Usando imresize")


C = [ 1 2 3; 4 5 6; 7 8 9];

ceros_col = zeros(length(A),1); %1
ceros_row = zeros(1, length(A)*2);%1
ceros_row2 = zeros(1, length(A)*4);%1
c_col = [];
c_col2 = [];
c_pad = [];
c_pad2 = [];

%rellenado de columnas 2x2
for i=1:length(A)
   aux = A(1:end, i);
   aux2 = [aux ceros_col];
   c_col = [c_col  aux2];
end

%rellenado de filas 2x2
for i=1:length(A)
    filas = [c_col(i,1:end);ceros_row];
    c_pad = [c_pad;filas];
end

%rellenado de columnas 4x4
for i=1:length(A)
   aux = A(1:end, i);
   ceros_col2 = [ceros_col ceros_col];
   ceros_col3 = [ceros_col2 ceros_col];
   aux2 = [aux ceros_col3];
   c_col2 = [c_col2  aux2];
end

%rellenado de filas 4x4
for i=1:length(A)
    ceros_row3 = [ceros_row2; ceros_row2];
    ceros_row4 = [ceros_row3; ceros_row2];
    filas = [c_col2(i,1:end);ceros_row4];
    c_pad2 = [c_pad2;filas];
end

figure("name","sobremuestreo 2x2");
imshow(c_pad);
%zoom(10)
title("sobremuestreo de 2x2")

figure("name","sobremuestreo 4x4");
imshow(c_pad2);
%zoom(10)
title("sobremuestreo de 4x4")

%convolución 2x2
aux = 0;
for i=1:length(c_pad)
    for j=1:length(c_pad)
        if mod(i,2) ~= 0
            if c_pad(i,j) == 0
                c_pad(i,j) = aux;
            else
                aux = c_pad(i,j);
            end
        else
            c_pad(i,j) = c_pad(i-1,j);
        end
        
    end
end

%convolución 4x4
aux = 0;
pos = 1;
for i=1:length(A)
    for k=pos:(pos+3)
        if k == pos
            for j=1:length(c_pad2)
                if c_pad2(k,j) == 0
                    c_pad2(k,j) = aux;
                else
                    aux = c_pad2(k,j);
                end
            end
        else
            for j=1:length(c_pad2)
                if c_pad2(k,j) == 0
                    c_pad2(k,j) = c_pad2(k-1,j);
                end
            end
        end
    end
    pos = k + 1;
end

p2 = uint8([1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1]);
conv = conv2(c_pad, p2);
%conv = c_pad .* p2;

conv(length(conv),:) = []; %se elimina la ultima fila
conv(:,length(conv)) = []; %se elimina la ultima columna


figure("name","Interpolador de orden cero 2x2");
imshow(c_pad);
%zoom(10)
title("Interpolador de orden cero de 2x2")

figure("name","Interpolador de orden cero 4x4");
imshow(c_pad2);
%zoom(10)
title("Interpolador de orden cero de 4x4")


E = repmat(C,2);
