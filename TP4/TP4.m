%% TP4


img = imread('le_cervin.png');
[w h] = size(img);

%% Question 1
% save random seed as key
key = rng
% generate random noise 
u = randn(w, h);

imagesc(u); colormap('gray'); colorbar;





