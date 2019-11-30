%--------------------------------------------
% Calculate DCT of an RGB image of 8x8 Size
%--------------------------------------------
function dct_image = dct_rgb(image)

	dct_image = zeros(8,8,3);

	for i = 1:3
		dct_image(:,:,i) = dct2(image(:,:,i));
    end

end