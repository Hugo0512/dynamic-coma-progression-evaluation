clc
clear all
[num,txt,raw] =xlsread('train4.xls');%��������
%������ɾ�����������������ɾ��

raw1={};
count=0;
for index1=size(raw,1):-1:1
    index1
%         if raw{index1,end}==0%raw1���Ƕ����࣬��raw1��ȥ���ɾ������
            if raw{index1,end}==1%raw1���Ƕ����࣬��raw1��ȥ���ɾ������,�������1
            count=count+1;
            raw1(count,:)=raw(index1,:);
              raw(index1,:)=[];
        end
end
samplenumber=size(raw,1);%������

% for index=1:size(raw,1)
%     for index1=1:size(raw,2)
%         if ischar(raw{index,index1})~=1
%             raw{index,index1}=num2str(raw{index,index1});
%         end
%     end
% end
trianclass1=raw(:,[2,13,14]);%ֻ������ֵ���͵�
trianclass1=cell2mat(trianclass1);
trianlabel1=1*ones(1,size(trianclass1,1));%�������ǩ
s=2;%ɾ������

artificialsamples=[];%��Ų������˹�����


%���ɾ��������ȫ���У�ɾ��ǰ�ߵ�
order=randperm(size(raw1,1));
remain=1/s*size(raw1,1);
delete=round((s-1)/s*size(raw1,1));
raw1(order(1:delete),:)=[];
downsamplearray=[raw;raw1];
% save('downsampletrain1.mat','downsamplearray')
xlswrite('downsampletrain4.xls',downsamplearray)