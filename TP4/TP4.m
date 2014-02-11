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
gamma = 10;
% We're hiding the bit b=0
b=1;
w = img + gamma .* (-1)^b .* u;
figure; imagesc(w); colormap('gray');colorbar; title('Image marquee'); 
figure; imagesc(abs(w-img)); colormap('gray');colorbar; title('Difference entre image marquee et image d''origine');


%% Question3
function det = detecteur(key, gamma, threshold, img)
    rng(key);
    % regenerate the same noise 
    u = gamma .* double(randn(size(img)));
    % Coefficient de correlation
    corr = sum(dot(img, u))/(size(img,1)*size(img,2))
    if corr > threshold
        det = 1;
    elseif ((corr > threshold) & (corr <= threshold))
        det = -1;
    else
        det = 0;
    end
end
det = detecteur(key, gamma, 10, w)

end




