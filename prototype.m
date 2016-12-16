[ data,class] = parsing();

DownSData = zeros(14,3,774);
k = 1;

for i = 0:9
    iset = data(class==i);
    for j =1:length(iset)
        c = cell2mat(iset(j));
        div = size(c,1);
        d = downsample(c,floor((div/14)));
        DownSData(:,:,k) = d(1:14,:);
        k = k + 1;
    end
end

%DownSData = mm_normalize(DownSData);
SAMPLE_N = size(DownSData,3);
ridx = randperm(SAMPLE_N,SAMPLE_N);
cutidx = round(SAMPLE_N*.7);

traindata = DownSData(:,:,ridx(1:cutidx));
trainclass = class(ridx(1:cutidx));
testdata = DownSData(:,:,ridx(1+cutidx));
testclass = class(ridx(1+cutidx));

k = 3;
C = knn(trainclass,traindata,testdata,k);

plot(C-testclass,'x');
disp(sum(C-testclass==0)/length(C));
disp(k);
