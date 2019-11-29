
function bl = getBlockiness(img)
	[n m] = size(img);

	bl = 0;

	for i = 1:n
		for j = 8:8:m-1
			bl = bl + abs(int64(img(i,j)) - int64(img(i,j+1)));
		end
	end

	for i = 1:m
		for j = 8:8:n-1
			bl = bl + abs(int64(img(j,i)) - int64(img(j+1,i)));
		end
	end

	bl = double(bl);
end