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
function res = watermark(img, bit, key, gamma)
    rng(key);
    u = double(randn(size(img)));
    res = img + gamma .* (-1)^bit .* u;
end
w = watermark(img, 0, key, gamma);
figure; imagesc(w); colormap('gray');colorbar; title('Image marquee, (bit=0)'); 
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

w0 = watermark(img, 0, key, gamma);
w1 = watermark(img, 1, key, gamma);
disp('Watermark detecte pour le bit 0');
det = detecteur(key, gamma, 10, w0)
disp('Watermark detecte pour le bit 1');
det = detecteur(key, gamma, 10, w1)
disp('Watermark detecte pour l''image d''origine');
disp(detecteur(key, gamma, 10, img)); 


figure; plot([imhist(w0/255), imhist(img/255), imhist(w1/255)]); legend('w0', 'img', 'w1');
end




