function [DC, AC] = coeffToArray(dct_img)
	[n m] = size(dct_img);

	DC_sz = (int64((n-1)/8))*(int64((m-1)/8));
	AC_sz = n*m - DC_sz;

	DC = zeros(DC_sz);
	AC = zeros(AC_sz);

	coeffIter = 1;
	for i = 1:8:n
		for j = 1:8:m
			DC(coeffIter) = dct_img(i,j);
			coeffIter = coeffIter + 1;
		end
	end

	coeffIter = 1;
	for i = 1:n
		for j = 1:m
			if mod(i,8)==1 & mod(j,8)==1
				continue;
			end

			AC(coeffIter) = dct_img(i,j);
			coeffIter = coeffIter + 1;
		end
	end

	DC = permute(DC);
	AC = permute(AC);
end