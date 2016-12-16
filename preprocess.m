k = 1;
for i = 1:9

    iset = data(class_index==i);
    
    for j =1:length(iset)
        c = DownSData(:,:,k);
        figure(1)
        scatter(d(:,1),d(:,2));
        subplot(3,1,1);
        scatter(c(:,1),c(:,2));
        
        subplot(3,1,2);
        scatter(c(:,1),c(:,3));

        subplot(3,1,3);
        scatter(c(:,2),c(:,3));    
        
        pause(0.1);
    k = k+1;
    end
    
end

%%
idx = 1;
for i = 1:9

    iset = data(class==i);
    
    for j =1:length(iset)
        if k_result(idx)
            continue
        end
        c = cell2mat(iset(j));
        [m1 m2 m3] = pca(mm_normalize(c(:,1:3)));
        d = m2(1:17,:)*m1
        
        figure(1)
        plot3((c(:,1)-min(c(:,1)))/(max(c(:,1))-min(c(:,1))),...
            (c(:,2)-min(c(:,2)))/(max(c(:,2))-min(c(:,2))),...
            (c(:,3)-min(c(:,3)))/(max(c(:,3))-min(c(:,3)))...
            ,'bx');
        hold on;
        
        plot3((d(:,1)-min(d(:,1)))/(max(d(:,1))-min(d(:,1))),...
            (d(:,2)-min(d(:,2)))/(max(d(:,2))-min(d(:,2))),...
            (d(:,3)-min(d(:,3)))/(max(d(:,3))-min(d(:,3)))...
            ,'ro');
        hold off;
    pause(0.1);
    idx = idx + 1;
    end
    
end

%%
pca_dataset = zeros(17,3,774);
k = 1;
for i = 0:9

    iset = data(class==i);
    
    for j =1:length(iset)
        c = cell2mat(iset(j));
        [m1 m2 m3] = pca(c(:,1:3));
        d = m2(1:17,:)*m1;
        pca_dataset(:,:,k) = d;
        k = k + 1;
  end
    
end

