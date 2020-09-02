clc
clear all
%统计所有属性的取值个数
statisticalinformation={};%存放统计信息
emptystatisticalinformation=[];%空的统计信息
[num,txt,raw1]=xlsread('preprocessedprospective0.xls');%读取训练数据

for index1=1:size(raw1,1)
    for index2=1:size(raw1,2)
            if ismember(index2,[2,16,17,40:46])~=1%此行针对原始问题和欠采样
                    raw1{index1,index2}=num2str(raw1{index1,index2});
            end
    end
end


for index=1:size(raw1,2)%列数
    if ismember(index,[2,16,17,40:46])==1%如果是数值型的
        
        tempmatrix=cell2mat(raw1(:,index));
        [tempcounts,tempcenters]=hist(tempmatrix);
        
        statisticalinformation{index}=[tempcenters;tempcounts];
    else%如果是非数值型的
        values=unique(raw1(:,index))';
        valuescount=zeros(1,numel(values));
        for index2=1:numel(values)
            temp=values{index2};
            for index3=1:size(raw1,1)%行数
               if isequal(raw1{index3,index},temp)==1
                   valuescount(index2)=valuescount(index2)+1;
               end
            end
        end
        statisticalinformation{index}=[values;num2cell(valuescount)];
    end
end

for index=1:size(raw1,2)%列数
    temp=0;
    for index1=1:size(raw1,1)
        if isnan(raw1{index1,index})==1
            temp=temp+1;
        end
    end
    emptystatisticalinformation=[emptystatisticalinformation temp];
end



% %将最后的statisticalinformation变成可以写成excel的数据
% statisticalinformationexcel={};
% for index=1:numel(statisticalinformation)
%     statisticalinformationexcel=[statisticalinformationexcel num2cell(statisticalinformation{index})];
%     statisticalinformationexcel=[statisticalinformationexcel {'*','*'}'];
% end
% xlswrite('statistical0.xls',statisticalinformationexcel);%写不了，因为某些元素写不出来，画图时使用即可
xlswrite('prospectiveemptystatistical0.xls',emptystatisticalinformation);