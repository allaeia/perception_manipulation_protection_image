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

w = perceptron( numbers, out, .1618, 50)
numbers*w>0

function err = influence_iterations(max_iter)
    err = zeros(max_iter,1);
    cpt=1;
    for i=-2:0.01:max_iter
        lw = perceptron( numbers, out, i, 50);
        res = xor(numbers*lw>0, (out+1)/2);
        err(cpt) = 100* (res' * ones(size(out))) / size(out,1);
        cpt=cpt+1;
    end
    disp('erreur');
    disp(err);
end
figure('Name','evoluticlon erreur','NumberTitle','off');
plot(influence_iterations(2));
end
