ORG_IMG_NAME = 'org_img.png';
STEG_IMG_NAME = 'steg_img.png';

POP_SIZE = 3;
TOTAL_ITER = 2;

QUALITY = 89;

TARGET_IMG_SIZE = 512;

SUB_BLOCK_SIZE = 8;

target_img = imread(ORG_IMG_NAME);

secMsg = 'abc12jhfljdksssssssssssssssssssssssssssssssssskkkfhjkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk3';
secMsg = toBinary(secMsg);

secMsg = ones(1,32768);

target_img = imresize(target_img, [TARGET_IMG_SIZE TARGET_IMG_SIZE]);

[row coln]= size(target_img);

% Calculate Quantization & DCT Matrix
global QX
global DCT_matrix8
global iDCT_matrix8

QX = calcQX(QUALITY);

DCT_matrix8 =  dctmtx(8);
iDCT_matrix8 = DCT_matrix8';

dct_img = applyDCT(target_img, DCT_matrix8, iDCT_matrix8, QX);

[DC, AC] = coeffToArray(dct_img);


% Start
locations = findLocations(AC, secMsg);

population = initPop(length(locations), POP_SIZE);
population_fitness = zeros(1,POP_SIZE);

bestChromosome = zeros(length(locations));
bestChromosomeFitness = 0;

for iter = 1:TOTAL_ITER

	for i = 1:POP_SIZE
		population_fitness(i) = chromosomeFitness(population(i),target_img,AC,DC,locations);
	end

	[maxFit, index] = max(population_fitness);

	if maxFit > bestChromosomeFitness
		bestChromosome = population(index);
		bestChromosomeFitness = maxFit;
	end

	population = nextGen(population, population_fitness);
end

AC = updateCoeff(AC, locations, bestChromosome);

% IDCT

dct_img = array2coeff(DC, AC, TARGET_IMG_SIZE, TARGET_IMG_SIZE*3);


K = invDCT(dct_img, row, coln);


%----------------------------------------------------------
%Display of Results
%----------------------------------------------------------
figure(1);imshow(target_img);title('original image');
figure(2);imshow(K);title('restored image from dct');
disp(psnr(target_img,K));
disp(bestChromosomeFitness);

% imwrite(K,'org_img1.jpg');
% imwrite(K,'org_img1.png');