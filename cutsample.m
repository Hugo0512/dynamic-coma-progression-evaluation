clc
clear all
part1={};%存储第一类的所有照片，分成四部分
part2={};%存储第二类的所有照片，分成四部分
part3={};
[num,txt,raw]=xlsread('missforest0.xls');
raw(1,:)=[];%在第一个问题上要，在第二个问题上不要
len=size(raw,1); %获得文件的个数
sampleorder=randperm(len);%产生全排列
grouparray={};%存储样本的全排列位置
for index=1:4
    grouparray{index}=sampleorder(round((index-1)/4*len)+1:round(index/4*len));
end
for index=1:4
    part1{index}=raw(grouparray{index},:);
end


[num,txt,raw]=xlsread('missforest1.xls');
raw(1,:)=[];%在第一个问题上要，在第二个问题上不要
len=size(raw,1); %获得文件的个数
sampleorder=randperm(len);%产生全排列
grouparray={};%存储样本的全排列位置
for index=1:4
    grouparray{index}=sampleorder(round((index-1)/4*len)+1:round(index/4*len));
end
for index=1:4
    part2{index}=raw(grouparray{index},:);
end


%组成四倍交叉验证
train={};
test={};
for index0=1:4
    train1={};
    train2={};
    for index1=1:4
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
for index1=1:4
    xlsname=strcat(strcat('train',num2str(index1)),'.xls');
    temp=train{index1};
    xlswrite(xlsname,temp);
end
for index1=1:4
    xlsname=strcat(strcat('test',num2str(index1)),'.xls');
    temp=test{index1};
    xlswrite(xlsname,temp);
end
%问题2自己手动删除最后一列