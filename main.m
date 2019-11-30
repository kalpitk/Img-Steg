ORG_IMG_NAME = 'org_img.png';
STEG_IMG_NAME = 'steg_img.png';
HIDDEN_IMG_NAME = 'hide.png';

% Hidden Image size = Target Image Size / 2
TARGET_IMG_SIZE = 512;
HIDDEN_IMG_SIZE = 256;

SUB_BLOCK_SIZE = 8;

iter = 100;

target_img = imread(ORG_IMG_NAME);
hidden_img = imread(HIDDEN_IMG_NAME);

target_img = imresize(target_img, [TARGET_IMG_SIZE TARGET_IMG_SIZE]);
hidden_img = imresize(hidden_img, [HIDDEN_IMG_SIZE HIDDEN_IMG_SIZE]);

betas = zeros(1,iter);
psnrHidden = zeros(1,iter);
psnrTarget = zeros(1,iter);

parfor i = 1:iter
	betas(i) = i/1000;

	steg_img = embed_img(target_img, hidden_img, betas(i));
	extHidden = extractHidden(target_img, steg_img, betas(i));

	psnrTarget(i) = psnr(target_img, steg_img);
	psnrHidden(i) = psnr(hidden_img, extHidden);
end

plot(betas, psnrTarget,'-r.',betas,psnrHidden,'-b.')
h = legend('Target Image', 'Hidden Image');
xlabel('Beta');
ylabel('PSNR');

set(h,'Interpreter','none');