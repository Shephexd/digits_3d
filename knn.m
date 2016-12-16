function C = knn(train_class, train_data, data, k)
    train_len = size(train_data, 3);
    test_len = size(data, 3);
    class_num = size(unique(train_class), 2);
    
    C = zeros(1, test_len);

    dist = zeros(train_len, 1);
    
    for i = 1 : test_len
        for j = 1 : train_len
            % Euclidean distance
            dist(j) = sqrt(sum(sum((train_data(:,:, j) - data(:,:, i)).^2)));
            % Manhattan distance
            %dist(idx) = sum(abs(x(idx,:) - newpoint));
        end
        
        [~, s_idx] = sort(dist);
        
        idx_closest = s_idx(1:k);
        class_closest = train_class(:, idx_closest);
        
        h = hist(class_closest, 1:class_num);
        [~, I] = max(h);
        
        C(1, i) = I;
    end
end