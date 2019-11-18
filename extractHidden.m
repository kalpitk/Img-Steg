function extHidden = extractHidden(target_img, steg_img, Beta)
	ORG_IMG_NAME = 'org_img.png';
	STEG_IMG_NAME = 'steg_img.png';

	% Target image size multiple of Hidden image size
	STEG_IMG_SIZE = 512;
	TARGET_IMG_SIZE = 512;

	SUB_BLOCK_SIZE = 8;

	steg_img = imread(STEG_IMG_NAME);
	target_img = imread(ORG_IMG_NAME);

	steg_img = imresize(steg_img, [STEG_IMG_SIZE STEG_IMG_SIZE]);
	target_img = imresize(target_img, [TARGET_IMG_SIZE TARGET_IMG_SIZE]);

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

	extHidden = hidden_img;

	% figure;
	% imshow(hidden_img);
