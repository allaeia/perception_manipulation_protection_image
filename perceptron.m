function w = perceptron(in,out, epsilon, max_iter)
function result = sigma(x)
    result = 1./(1+exp(-x));
end

function result = sigma_p(x)
    s = sigma(x);
    %result=1;
    result = s.*(1-s);
end


	w = rand(size(in,2),1)*2-1;
    w
	delta_w = zeros(size(in,2),1);
	iter=0;
	while iter < max_iter
		delta_w = delta_w * 0;
		in_w = in * w;
		for i = 1 : size(w)
			delta_w(i) = delta_w(i) + epsilon*((out-in_w)'*(in(:,i))) * sigma_p(in_w(i,1));
		end
		w = w + delta_w;
		iter = iter + 1;
	end
end

