%--------------------------------------------
% Extracts Secret Image from Steganographic Image
%--------------------------------------------
function hidden_img = extractHidden(target_img, steg_img, Beta)

	TARGET_IMG_SIZE = 512;
	STEG_IMG_SIZE = 512;
	HIDDEN_IMG_SIZE = 200;

	SUB_BLOCK_SIZE = 8;

	target_img_dct = zeros(TARGET_IMG_SIZE, TARGET_IMG_SIZE,3);
	steg_img_dct = zeros(STEG_IMG_SIZE, STEG_IMG_SIZE,3);

	for i = 1:SUB_BLOCK_SIZE:TARGET_IMG_SIZE
		for j = 1:SUB_BLOCK_SIZE:TARGET_IMG_SIZE
			target_img_dct(i:i+SUB_BLOCK_SIZE-1, j:j+SUB_BLOCK_SIZE-1,:) = dct_rgb(target_img(i:i+SUB_BLOCK_SIZE-1, j:j+SUB_BLOCK_SIZE-1,:));
		end
	end

	for i = 1:SUB_BLOCK_SIZE:TARGET_IMG_SIZE
		for j = 1:SUB_BLOCK_SIZE:TARGET_IMG_SIZE
			steg_img_dct(i:i+SUB_BLOCK_SIZE-1, j:j+SUB_BLOCK_SIZE-1,:) = dct_rgb(steg_img(i:i+SUB_BLOCK_SIZE-1, j:j+SUB_BLOCK_SIZE-1,:));
		end
	end

	hidden_img = get_hidden(steg_img_dct, target_img_dct, Beta);

	hidden_img = uint8(hidden_img);
    
    % figure;
	% imshow(hidden_img);

end
