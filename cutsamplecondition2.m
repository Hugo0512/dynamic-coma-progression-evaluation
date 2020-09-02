clc
clear all
%第二种情况下分数据
%把一个数据集中的数据分成2个部分
[num,txt,raw1]=xlsread('externaltask2.xls');%读取训练数据，多天数据时使用此行
% [num,txt,raw1]=xlsread('externalextendedtime1.xls');%读取训练数据,只用一天的数据时实用此行
class0={};
class1={};
for index=1:size(raw1,1)
    if raw1{index,end}==0
        class0=[class0;raw1(index,:)];
    else
        class1=[class1;raw1(index,:)];
    end
end
xlswrite('external0task2.xls',class0);
xlswrite('external1task2.xls',class1);