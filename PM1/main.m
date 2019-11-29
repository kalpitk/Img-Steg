ORG_IMG_NAME = 'org_img.png';
STEG_IMG_NAME = 'steg_img.png';

QUALITY = 89;

TARGET_IMG_SIZE = 512;

SUB_BLOCK_SIZE = 8;

target_img = imread(ORG_IMG_NAME);

secMsg = 'abc123';
secMsg = toBinary(secMsg);

target_img = imresize(target_img, [TARGET_IMG_SIZE TARGET_IMG_SIZE]);

[row coln]= size(target_img);

% Calculate Quantization & DCT Matrix
QX = calcQX(QUALITY);

DCT_matrix8 =  dctmtx(8);
iDCT_matrix8 = DCT_matrix8';

dct_img = applyDCT(target_img, DCT_matrix8, iDCT_matrix8, QX);

[DC, AC] = coeffToArray(dct_img);


% Start
locations = findLocations(AC, secMsg);
chr = [1 0 1];

AC = updateCoeff(AC, locations, chr);

% IDCT

dct_img = array2coeff(DC, AC, TARGET_IMG_SIZE, TARGET_IMG_SIZE*3);


