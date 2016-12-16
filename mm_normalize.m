function norm_data = mm_normalize(denorm_data)
    norm_data = zeros(size(denorm_data));
    N = size(denorm_data,3);
    for i = 1:N
        for j = 1:3
        norm_data(:,j,i) = ((denorm_data(:,j,i)-min(denorm_data(:,j,i)))/...
            (max(denorm_data(:,j,i))-min(denorm_data(:,j,i))));        %MAX-MIN normalization
        end
    end
end
