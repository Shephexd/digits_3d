N = length(class_index);
m = 10;
rand_idx = randperm(N);
theta_new = zeros(m,1);

kdata = DownSData;
cutoff = round(N/10);

%%
dist = zeros(m,1);
k_class = zeros(N,1);
for i = 1:m
    theta_new(i) = mean(mean(mean(kdata(:,:,rand_idx(1+cutoff*(i-1):cutoff*i)))));
    k_class(rand_idx(1+cutoff*(i-1):cutoff*i)) = i-1;
end

theta_old = zeros(m,1);

%i = 1;
%j = 1;


%%

while not(theta_new == theta_old)    
    for i = 1:N
        for j = 1:m
            dist(j) = sqrt(sum(kdata(:,i) - theta_new(j)).^2);
        end

        
        [a,idx] = min(dist);
        k_class(i) = idx;

    end

    theta_old = theta_new;

    for j = 1:m
        theta_new(j) = mean(mean(mean(kdata(:,k_class==j))));
    end
    for i = 0:9

            a = sprintf('the result of class %d = %d',i,sum(k_result & class_index' ==i));
            disp(a);

    end
    break
end


%%
k_result = k_class==class_index';
plot(k_class==class_index','x')
disp(sum(k_class==class_index'))

for i = 0:9
    
        a = sprintf('the result of class %d = %d',i,sum(k_result & class_index' ==i));
        disp(a);
    
end