ORG_IMG_NAME = 'org_img.png';
STEG_IMG_NAME = 'steg_img.png';
HIDDEN_IMG_NAME = 'hide.jpg';

TARGET_IMG_SIZE = 512;
HIDDEN_IMG_SIZE = 200;

SUB_BLOCK_SIZE = 8;

target_img = imread(ORG_IMG_NAME);
hidden_img = imread(HIDDEN_IMG_NAME);

target_img = imresize(target_img, [TARGET_IMG_SIZE TARGET_IMG_SIZE]);
hidden_img = imresize(hidden_img, [HIDDEN_IMG_SIZE HIDDEN_IMG_SIZE]);

steg_img = embed_img(target_img, hidden_img, 0.01);

disp(psnr(target_img, steg_img));

extHidden = extractHidden(target_img, steg_img, 0.01);
extHidden = imresize(extHidden, [HIDDEN_IMG_SIZE HIDDEN_IMG_SIZE]);

figure;
imshow(hidden_img);

figure;
imshow(extHidden);

disp(psnr(hidden_img, extHidden));