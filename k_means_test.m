N = length(class);
m = 10;
rand_idx = randperm(N);
theta_new = zeros(m,1);

kdata = pca_dataset;
cutoff = round(N/10);

%%
for i = 1:m
    theta_new(i) = mean(mean(mean(kdata(:,:,rand_idx(1+cutoff*(i-1):cutoff*i)))));
end
theta_old = zeros(m,1);

%i = 1;
%j = 1;

dist = zeros(m,1);
k_class = zeros(N,1);

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
    disp(sum(k_class==class));
end


%%
k_class = k_class - 1;
k_result = k_class==class;
plot(k_class==class,'x')
disp(sum(k_class==class))

for i = 0:9
    
        a = sprintf('the result of class %d = %d',i,sum(k_result & class ==i));
        disp(a);
    
end