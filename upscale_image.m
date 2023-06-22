% Image upscaling code
% Kreinicker Gabor
% 2023.06.21.

close all
clc();
clear;

%% file betöltése

path = 'C:\Users\Kreinicker Gabor\Pictures\Piktúrák\Műhold';
img_set = imageDatastore(path);
mkdir([path, '\upscaled'])
scale = 2;

for i = 1:size(img_set.Files, 1)
    img = readimage(img_set, i);
    
    %figure('Name', 'Raw image');
    %imshow(img);
    
    %% felnagyítás
    
    img_resize = imresize(img, scale, 'bilinear');
    %figure('Name', 'Upscale');
    %imshow(img_resize);
    
    %% Gauss
    
    img_gauss = imgaussfilt(img_resize, 0.4*scale);
    %figure('Name', 'Gauss');
    %imshow(img_gauss);
    
    %% mentés
    
    imwrite(img_gauss, [path, '\upscaled\', num2str(i), '.png']);
end
disp('done')