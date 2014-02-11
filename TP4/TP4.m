%% TP4

function TP4()
clc;
clear all;
close all;

img = double(imread('le_cervin.png'));
[w h] = size(img);

%% Question 1
% save random seed as key
key= rng;
% generate random noise 
u = double(randn(w, h));

figure; imagesc(img); colormap('gray'); colorbar; title('Image d''origine');
figure; imagesc(u); colormap('gray'); colorbar; title('Bruit blanc');


%% Question 2
gamma = 1;
w = img + gamma .* (-1).^floor(u) * u;
%w = img + gamma .* u;
figure; imshow(w, [0 255]); colorbar; title('Image marquee'); 

figure; imshow(abs(w-img)*20, [0 255]); title('Difference entre image marquee et image d''origine (x20)');


%% Question3
function dec = decode(key, img)
    rng(key);
    % regenerate the same noise 
    u = double(randn(w, h));
end



end




