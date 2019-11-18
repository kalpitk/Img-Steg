function dct_image = dct_rgb(image)

	for i = 1:3
		dct_image(:,:,i) = dct2(image(:,:,i));
	end

	dct_image = uint8(dct_image);

end