function w = perceptron(sigma,sigma_prim,in,out, epsilon, max_iter)
	w = rand(size(out),1);
	delta_w = zeros(size(out),1);
	iter=0;
	while iter < max_iter
		delta_w = delta_w * 0;
		in_w = in * w;
		for i = 1 : size(out)
			delta_w(i) = delta_w(i) + epsilon*(in_w-out)*'in(:,i) * sigma_prim(in_w);
		end
		w = w + delta_w;
		iter++
	end
end

