ORG_IMG_NAME = 'org_img.png';
STEG_IMG_NAME = 'steg_img.png';
HIDDEN_IMG_NAME = 'hide.jpg';

BETA = 0.03;

% Target image size multiple of Hidden image size
TARGET_IMG_SIZE = 512;
HIDDEN_IMG_SIZE = 200;

SUB_BLOCK_SIZE = 8;

target_img = imread(ORG_IMG_NAME);
hidden_img = imread(HIDDEN_IMG_NAME);

target_img = imresize(target_img, [TARGET_IMG_SIZE TARGET_IMG_SIZE]);
hidden_img = imresize(hidden_img, [HIDDEN_IMG_SIZE HIDDEN_IMG_SIZE]);

target_img_dct = zeros(TARGET_IMG_SIZE, TARGET_IMG_SIZE,3);

for i = 1:SUB_BLOCK_SIZE:TARGET_IMG_SIZE
	for j = 1:SUB_BLOCK_SIZE:TARGET_IMG_SIZE
		target_img_dct(i:i+SUB_BLOCK_SIZE-1, j:j+SUB_BLOCK_SIZE-1,:) = dct_rgb(target_img(i:i+SUB_BLOCK_SIZE-1, j:j+SUB_BLOCK_SIZE-1,:));
	end
end

steg_dct = get_mr_ll(target_img_dct, hidden_img, BETA);

steg_img = zeros(TARGET_IMG_SIZE, TARGET_IMG_SIZE,3);

for i = 1:SUB_BLOCK_SIZE:TARGET_IMG_SIZE
	for j = 1:SUB_BLOCK_SIZE:TARGET_IMG_SIZE
		steg_img(i:i+SUB_BLOCK_SIZE-1, j:j+SUB_BLOCK_SIZE-1,:) = idct_rgb(steg_dct(i:i+SUB_BLOCK_SIZE-1, j:j+SUB_BLOCK_SIZE-1,:));
	end
end

steg_img = uint8(steg_img);

% figure
% imshow(target_img);

% figure
% imshow(steg_img);

imwrite(steg_img, STEG_IMG_NAME);

error = psnr(target_img, steg_img);
disp(error);
