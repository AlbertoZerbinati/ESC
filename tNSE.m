clear all
warning off

cd 'C:\Users\vincm\Desktop\Vincenzo\Universita\3.2\AI\Progetto\Spiral\release'

load('SpiralPat_ESC50_data.mat','DATA');



DIV=DATA{3};


DIM1=length(DIV) * 0.8;
DIM2=length(DIV);

label=DATA{2};

myLabels = label.';

Pattern=DATA{1};

rng("default")



foldData = Pattern;


c = cvpartition(label,"Holdout",0.2);

indiciTR = training(c);
indiciTE = test(c);

dataTR.feature = foldData(indiciTR,:);
dataTR.label = myLabels(indiciTR);


% ESC-50 1-fold (153,5e-4,1e-8) = 56.25%
% ESC-10 1-fold (153,1e-8,1e-10,1e-10) = 81.25%


Y = tsne(dataTR.feature,'Standardize',true);
%scatter3(Y(:,1),Y(:,2),Y(:,3),10,dataTR.label,'filled')
gscatter(Y(:,1),Y(:,2),dataTR.label);




