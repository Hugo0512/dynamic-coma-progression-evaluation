clc
clear all
part1={};%存储第一类的所有照片，分成四部分
part2={};%存储第二类的所有照片，分成四部分
part3={};
[num,txt,raw]=xlsread('prospectivemissforest0.xls');
raw(1,:)=[];
len=size(raw,1); %获得文件的个数
sampleorder=randperm(len);%产生全排列
grouparray={};%存储样本的全排列位置
for index=1:1
    grouparray{index}=sampleorder(round((index-1)/1*len)+1:round(index/1*len));
end
for index=1:1
    part1{index}=raw(grouparray{index},:);
end


[num,txt,raw]=xlsread('prospectivemissforest1.xls');
raw(1,:)=[];
len=size(raw,1); %获得文件的个数
sampleorder=randperm(len);%产生全排列
grouparray={};%存储样本的全排列位置
for index=1:1
    grouparray{index}=sampleorder(round((index-1)/1*len)+1:round(index/1*len));
end
for index=1:1
    part2{index}=raw(grouparray{index},:);
end


%组成四倍交叉验证
train={};
test={};
for index0=1:1
    train1={};
    train2={};
    for index1=1:1
        if index1==index0
            temp=part1{index1};
            temp=[temp num2cell(zeros(size(temp,1),1))];
            test{index0}=temp;
            temp=part2{index1};
            temp=[temp num2cell(ones(size(temp,1),1))];
            test{index0}=[test{index0};temp];
         
        else
            temp=part1{index1};
            temp=[temp num2cell(zeros(size(temp,1),1))];
            train1=[train1;temp];
            temp=part2{index1};
            temp=[temp num2cell(ones(size(temp,1),1))];
            train2=[train2;temp];
        
        end
    end
       train{index0}=[train1;train2];
end
%写文件

for index1=1:1
    xlsname=strcat(strcat('prospectivetest',num2str(index1)),'.xls');
    temp=test{index1};
    xlswrite(xlsname,temp);
end
%问题2自己手动删除最后一列