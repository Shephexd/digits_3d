%% Data pasring
[ data,class] = parsing();

traindata = zeros(14,3,774);

k = 1;

for i = 0:9
    iset = data(class==i);
    for j =1:length(iset)
        c = cell2mat(iset(j));
        div = size(c,1);
        d = downsample(c,floor((div/14)));
        traindata(:,:,k) = d(1:14,:);
        k = k + 1;
    end
end

%%
% ONE Sample way

echo off
sum = 0;
for i = 1:10
    N = randperm(774,1);
    C = digit_classify(traindata(:,:,N(1)));

    if class(N) == C
        sum = sum+1;
    end
end

disp(sum/(i));

%%
% Multiple way
TEST_SIZE = 100;
N = randperm(774,TEST_SIZE);
C = digit_classify(traindata(:,:,N));

plot((class(N)-C),'x');
