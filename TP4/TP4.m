%% TP4

clc;
clear all;
close all;

img = double(imread('le_cervin.png'));
[w h] = size(img);

%% Question 1
% save random seed as key
key = rng('default');
% generate random noise 
u = double(randn(w, h));

figure; imagesc(img); colormap('gray'); colorbar; title('Image d''origine');
figure; imagesc(u); colormap('gray'); colorbar; title('Bruit blanc');


%% Question 2
gamma = 1;
w = img + gamma .* (-1).^floor(u);
figure; imshow(w, [0 255]); colorbar; title('Image marquee'); 


