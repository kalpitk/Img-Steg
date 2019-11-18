ORG_IMG_NAME = 'org_img.png';
HIDDEN_IMG_NAME = 'hid_img.png';

% Target image size multiple of Hidden image size
TARGET_IMG_SIZE = 512;
HIDDEN_IMG_SIZE = 8;

target_img = rgb2gray(imread(ORG_IMG_NAME));
hidden_img = rgb2gray(imread(HIDDEN_IMG_NAME));

target_img = imresize(target_img, [TARGET_IMG_SIZE TARGET_IMG_SIZE]);
hidden_img = imresize(hidden_img, [HIDDEN_IMG_SIZE HIDDEN_IMG_SIZE]);



