function [ data,class ] = parsing()
%PARSING Summary of this function goes here
%   Detailed explanation goes here

str1 = 'stroke_';
str_last = '.mat';

idx_list = [84 79 78 73 76 79 84 75 70 76];
class_idx = 1;

class = zeros(1,sum(idx_list));

for k=0:9
    c = strcat(str1,num2str(k));
    d = strcat(c,'_0');
    
    for i=1:idx_list(k+1)
        numi = num2str(i);
        if length(numi) <2
            numi = strcat('0',numi);
        end
        
        e = strcat(d,numi);
        f = strcat(e,str_last);
%        disp(f);
        p = load(f);
        data{class_idx} = p.pos;
        class(class_idx) = k;
        
        class_idx = class_idx + 1;
    end
end


end

