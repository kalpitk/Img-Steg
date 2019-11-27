function bl = getBlockiness(img)
	[n m] = size(img);

	bl = 0;

	for i = 1:n
		for j = 1:8:m-1
			bl = bl + abs(img(i,j) - img(i,j+1));
		end
	end

	for i = 1:m
		for j = 1:8:m-1
			bl = bl + abs(img(j,i) - img(j+1,i));
		end
	end
end