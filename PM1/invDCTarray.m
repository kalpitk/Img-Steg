% Convert array of AC, DC coeff to Img
function img = invDCTarray(DC, AC, n, m)

	dct_img = zeros(n,m);

	DC = invPermute(DC);
	AC = invPermute(AC);

	coeffIter = 1;
	for i = 1:8:n
		for j = 1:8:m
			dct_img(i,j) = DC(coeffIter);
			coeffIter = coeffIter + 1;
		end
	end

	coeffIter = 1;
	for i = 1:n
		for j = 1:m
			if mod(i,8)==1 & mod(j,8)==1
				continue;
			end

			dct_img(i,j) = AC(coeffIter);
			coeffIter = coeffIter + 1;
		end
	end

	img = invDCT(dct_img, n, m);
end