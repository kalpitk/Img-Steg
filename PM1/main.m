ORG_IMG_NAME = 'org_img.png';
STEG_IMG_NAME = 'steg_img.png';

POP_SIZE = 3;
MUTATION_RATE = 0.03;
TOTAL_ITER = 2;
MAX_GEN_WO_IMP = 20;

QUALITY = 89;

TARGET_IMG_SIZE = 2048;

SUB_BLOCK_SIZE = 8;

target_img = imread(ORG_IMG_NAME);

secMsg = getRandomData(100000);
secMsg = toBinary(secMsg);

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

bestChromosome = zeros(1,length(locations));
bestChromosomeFitness = 0;

% Graph Data Points
x = zeros(1, TOTAL_ITER);
y = zeros(1, TOTAL_ITER);

genWithoutImp = 0;

for iter = 1:TOTAL_ITER

	disp(iter);

	for i = 1:POP_SIZE
		population_fitness(i) = chromosomeFitness(population(i,:),target_img,AC,DC,locations);

		disp(i);
		disp(population_fitness(i));
	end

	[maxFit, index] = max(population_fitness);

	% Graph Data Points
	x(iter) = iter;
	y(iter) = maxFit;

	if maxFit > bestChromosomeFitness
		bestChromosome = population(index,:);
		bestChromosomeFitness = maxFit;

		genWithoutImp = 0;
    else
        genWithoutImp = genWithoutImp + 1;

        if genWithoutImp == MAX_GEN_WO_IMP
        	break;
        end
	end

	population = nextGen(population, population_fitness, MUTATION_RATE);
end


% Plot Graph
p = plot(x, y, '-b.');
p.MarkerSize = 15;
xlabel('Generation');
ylabel('Max Fitness');
title(["Population Size: " + num2str(POP_SIZE), "Mutation Rate: " + num2str(MUTATION_RATE)]);
saveas(p, 'plot.png');
% scatter(x, y);


AC1 = updateCoeff(AC, locations, bestChromosome);
disp(psnr(AC1,AC));

% IDCT

dct_img = array2coeff(DC, AC1, TARGET_IMG_SIZE, TARGET_IMG_SIZE*3);


K = invDCT(dct_img, row, coln);


%----------------------------------------------------------
%Display of Results
%----------------------------------------------------------
% figure(1); imshow(target_img);
% figure(2); imshow(K);

disp(psnr(target_img,K));
disp(bestChromosomeFitness);

imwrite(K,'steg_img.png');