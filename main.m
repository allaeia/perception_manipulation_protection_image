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
numbers = numbers * 2 - 1
out = [0;1;0;1;0;1;0;1;0;1];
out = out *2 -1;
%numbers = [ 1,0,0;1,0,1;1,1,0;1,1,1]
%out=[-1;1;1;1]

w = perceptron( numbers, out, .1618, 50);
numbers*w>0;

function err = influence_iterations(max_iter)
    err = zeros(max_iter,1);
    for i=1:max_iter+1
        lw = perceptron( numbers, out, .2, i);
        res = xor(numbers*lw>0, (out+1)/2);
        err(i) = 100* (res' * ones(size(out))) / size(out,1);
    end
    disp('erreur');
    disp(err);
end

function numbers_noisy = noise(numbers, nb_changes)
    numbers_noisy = numbers;
        for row=1:size(numbers,1)
            % array of nb_changes random numbers between 1 and size(numbers,2)
            % computed by random unique permutation of elements 
            cols = randperm(size(numbers, 2), nb_changes);
            for i=1:nb_changes
                numbers_noisy(row, cols(i)) = -numbers(row, cols(i));
        end
    end
end
noisy = noise(numbers, size(numbers,2))
function err = influence_noise(numbers, w, out, max_changes_per_row)
    err = zeros(1, max_changes_per_row);
    for changes=1:max_changes_per_row
        numbers_noisy = noise(numbers,changes);        
        res = xor(numbers_noisy*w>0, (out+1)/2);
        err(1, changes) = 100* (res' * ones(size(out)) / size(out,1)); 
    end
end
figure;
plot(influence_noise(numbers, w, out, size(numbers, 2)));
axis([0 9 0 100]);
title('influence bruit en fction du nbre de changements par nombre');


function err_moyenne = influence_noise_mean(numbers, w, out, max_changes_per_row, nb_tests)
   err_moyenne = zeros(1, max_changes_per_row);
    for i=1:nb_tests
        err_moyenne = err_moyenne + influence_noise(numbers, w, out, max_changes_per_row);
    end
    err_moyenne = err_moyenne / nb_tests;
    disp(err_moyenne');
end
figure;
plot(influence_noise_mean(numbers, w, out, size(numbers,2), 1000));
title('influence moyenne du bruit en fction du nbre de changements par nombre');
axis([0 size(numbers,2) 0 100]);

%figure('Name','evoluticlon erreur','NumberTitle','off');
%plot(influence_iterations(60));

%tic
%for i=1:300
%perceptron( numbers, out, .1618, 100);
%end
%toc

end
