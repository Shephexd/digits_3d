function [ C ] = digit_classify( testdata )
%DIGIT_CLASSFIY Summary of this function goes here
%Detailed explanation goes here

[data,class] = parsing();

N = size(testdata,1);

TRAIN_N = size(class,2);

downSData = zeros(N,3,TRAIN_N);
TRAIN_PERCENT = 1;

for i = 1:TRAIN_N
    c = cell2mat(data(i));
    div = size(c,1);
    d = downsample(c,floor((div/14)));
    downSData(:,:,i) = d(1:N,:);
end

%DownSData = mm_normalize(DownSData);
SAMPLE_N = size(downSData,3);
ridx = randperm(SAMPLE_N,SAMPLE_N);
cutidx = round(SAMPLE_N*TRAIN_PERCENT);

traindata = downSData(:,:,ridx(1:cutidx));
trainclass = class(ridx(1:cutidx));

k = 3;
C = knn(trainclass,traindata,testdata,k);

end
