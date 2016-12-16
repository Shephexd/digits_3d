clear;
[ data,class ] = parsing();

C = digit_classfiy(data);

plot(C-class,'x');
disp(sum(C-class==0)/length(C));
disp(k);
