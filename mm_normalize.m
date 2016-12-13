function norm_data = mm_normalize(denorm_data)
    norm_data = zeros(size(denorm_data));
    for i = 1:size(denorm_data,2)
        norm_data(:,i) = ((denorm_data(:,i)-min(denorm_data(:,i)))/...
            (max(denorm_data(:,i))-min(denorm_data(:,i))))*2-1;        %MAX-MIN normalization
    end
end


