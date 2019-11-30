%--------------------------------------------------
% Calculate inverse DCT of an RGB image of 8x8 Size
%--------------------------------------------------
function idct_image = idct_rgb(image)

    idct_image = zeros(8,8,3);

	for i = 1:3
		idct_image(:,:,i) = idct2(image(:,:,i));
    end

end