%% Matrix 
% [ one : 0,1,1,0,0,0,0
%   two : 1,1,0,1,1,0,1
%   ...
% ]

numbers = [1,1,1,1,1,1,0; 0,1,1,0,0,0,0; 1,1,0,1,1,0,1; 1,1,1,1,0,0,1; 0,0,1,0,0,1,1; 1,0,1,1,0,1,1; 0,0,1,1,1,1,1; 1,1,1,0,0,0,1; 1,1,1,1,1,1,1; 1,1,1,0,0,1,1 ]
out = [0;1;0;1;0;1;0;1;0;1]

function result = sigma(x)
    result = 1./(1+exp(-x));
end

function result = sigma_p(x)
    s = sigma(x);
    result = s.*(1-s);
end

w = perception(sigma, sigma_p, numbers, out, 1., 10000);
numbers*w
