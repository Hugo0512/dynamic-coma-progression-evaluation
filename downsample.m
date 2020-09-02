clc
clear all
[num,txt,raw] =xlsread('train4.xls');%载入数据
%本程序删除多数类样本，随机删除

raw1={};
count=0;
for index1=size(raw,1):-1:1
    index1
%         if raw{index1,end}==0%raw1中是多数类，对raw1才去随机删除操作
            if raw{index1,end}==1%raw1中是多数类，对raw1才去随机删除操作,针对问题1
            count=count+1;
            raw1(count,:)=raw(index1,:);
              raw(index1,:)=[];
        end
end
samplenumber=size(raw,1);%样本数

% for index=1:size(raw,1)
%     for index1=1:size(raw,2)
%         if ischar(raw{index,index1})~=1
%             raw{index,index1}=num2str(raw{index,index1});
%         end
%     end
% end
trianclass1=raw(:,[2,13,14]);%只保留数值类型的
trianclass1=cell2mat(trianclass1);
trianlabel1=1*ones(1,size(trianclass1,1));%少数类标签
s=2;%删除比例

artificialsamples=[];%存放产生的人工样本


%随机删除样本，全排列，删除前边的
order=randperm(size(raw1,1));
remain=1/s*size(raw1,1);
delete=round((s-1)/s*size(raw1,1));
raw1(order(1:delete),:)=[];
downsamplearray=[raw;raw1];
% save('downsampletrain1.mat','downsamplearray')
xlswrite('downsampletrain4.xls',downsamplearray)