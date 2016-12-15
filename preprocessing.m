function [ vectorized_data ] = preprocessing( data,class_index )
%PREPROCESSING Summary of this function goes here
%   Detailed explanation goes here

pca_dataset = zeros(17,3,774);
k = 1;
for i = 0:9
    iset = data(class_index==i);
    for j =1:length(iset)
        c = cell2mat(iset(j));
        [m1 m2 m3] = pca(c(:,1:3));
        d = m2(1:17,:)*m1;
        pca_dataset(:,:,k) = d;
        k = k + 1;
  end
end

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

end

