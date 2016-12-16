[ data,class,class_index ] = parsing();
DownSData = zeros(10,3,774);
k = 1;
for i = 0:9
    iset = data(class_index==i);
    for j =1:length(iset)
        c = cell2mat(iset(j));
        div = size(c,1);
        d = downsample(c,round((div/14)));
        DownSData(:,:,k) = d(1:10,:);
        k = k + 1;
    end
end
ridx = randperm(774,774);
DownSData(:,:,ridx(1:387));


%%



%%

pca_dataset = zeros(10,3,774);
k = 1;
for i = 0:9
    iset = data(class_index==i);
    for j =1:length(iset)
        c = cell2mat(iset(j));
        div = size(c,1);
        d = downsample(c,round((div/14)));
        disp(size(c,1));
        disp(size(d,1));
        pca_dataset(:,:,k) = d(1:10,:);
        k = k + 1;
    end
end

%%

%%
N = size(pca_dataset,1);
% K = size(pca_dataset,3);
K = size(pca_dataset,3);
vectorized_data = zeros(N*2,K);

    % Data vectorized 17*17 -> 34*1
    for k =1:K
        idx = 1;
        for j = 1:2
            for i = 1:17
                vectorized_data(idx,k) = pca_dataset(i,j,k);
                idx = idx+1;
            end
        end
    end


