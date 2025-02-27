
fprintf('running feed forward\n');
data=normalized_data;

% for i = train_info.Number_of_traning+1:train_info.Number_of_samples
for i =1:train_info.Number_of_samples
    x   = [data(1:2,i);1];
    hiddenR = cell(length(Number_of_neurons)-1,1);
    hiddenR{1}   = x;
    for j = 2:length(Number_of_neurons)-1
        hiddenR{j} = [hyperb(w1{j-1}*hiddenR{j-1} );1];          % hidden neurons responce
    end
    o(:,i)= hyperb(w1{end}*hiddenR{end});
    
end
figure
fprintf('plotting result\n');
plot2colors(data(1:2,:),o,1,-1)
figure
fprintf('ploting confucion matrix\n');
dataPos = find(o<0);
o2=o;
o2(dataPos)=0;
ans2=data(3,:);
dataPos = find(ans2<0);
ans2(dataPos)=0;
plotconfusion(ans2,o2)
