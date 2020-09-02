clc
clear all
part1={};%�洢��һ���������Ƭ���ֳ��Ĳ���
part2={};%�洢�ڶ����������Ƭ���ֳ��Ĳ���
part3={};
[num,txt,raw]=xlsread('missforest0.xls');
raw(1,:)=[];%�ڵ�һ��������Ҫ���ڵڶ��������ϲ�Ҫ
len=size(raw,1); %����ļ��ĸ���
sampleorder=randperm(len);%����ȫ����
grouparray={};%�洢������ȫ����λ��
for index=1:4
    grouparray{index}=sampleorder(round((index-1)/4*len)+1:round(index/4*len));
end
for index=1:4
    part1{index}=raw(grouparray{index},:);
end


[num,txt,raw]=xlsread('missforest1.xls');
raw(1,:)=[];%�ڵ�һ��������Ҫ���ڵڶ��������ϲ�Ҫ
len=size(raw,1); %����ļ��ĸ���
sampleorder=randperm(len);%����ȫ����
grouparray={};%�洢������ȫ����λ��
for index=1:4
    grouparray{index}=sampleorder(round((index-1)/4*len)+1:round(index/4*len));
end
for index=1:4
    part2{index}=raw(grouparray{index},:);
end


%����ı�������֤
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
%д�ļ�
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
%����2�Լ��ֶ�ɾ�����һ��