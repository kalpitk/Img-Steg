function dct_image = idct_rgb(image)

	for i = 1:3
		dct_image(:,:,i) = idct2(image(:,:,i));
    end

end