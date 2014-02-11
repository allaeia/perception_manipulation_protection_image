%% TP4

clc;
clear all;
close all;

img = imread('le_cervin.png');
[w h] = size(img);

%% Question 1
% save random seed as key
key = rng('default');
% generate random noise 
u = randn(w, h);

figure; imagesc(img); colormap('gray'); colorbar; title('Image d''origine');
figure; imagesc(u); colormap('gray'); colorbar; title('Bruit blanc');


%% Question 2



