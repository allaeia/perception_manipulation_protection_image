%% Matrix 
% [ one : 0,1,1,0,0,0,0
%   two : 1,1,0,1,1,0,1
%   ...
% ]
function main()
numbers = [1,1,1,1,1,1,1,0;
           1,0,1,1,0,0,0,0;
           1,1,1,0,1,1,0,1;
           1,1,1,1,1,0,0,1;
           1,0,0,1,0,0,1,1;
           1,1,0,1,1,0,1,1;
           1,0,0,1,1,1,1,1;
           1,1,1,1,0,0,0,1;
           1,1,1,1,1,1,1,1;
           1,1,1,1,0,0,1,1 ]
       numbers = numbers * 2 - 1;
out = [0;1;0;1;0;1;0;1;0;1];
out = out *2 -1;
%numbers = [ 1,0,0;1,0,1;1,1,0;1,1,1]
%out=[-1;1;1;1]

w = perceptron( numbers, out, .1618, 100)
numbers*w>0

function err = influence_iterations(max_iter)
    err = zeros(max_iter,1);
    for i=1:max_iter+1
        w = perceptron( numbers, out, .1618, i);
        res = xor(numbers*w>0, (out+1)/2)
        err(i) = 100* (res' * ones(size(out))) / size(out,1);
    end
end
plot(influence_iterations(60));

%numbers*w
end
