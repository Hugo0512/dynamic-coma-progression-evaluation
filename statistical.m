clc
clear all
%ͳ���������Ե�ȡֵ����
statisticalinformation={};%���ͳ����Ϣ
emptystatisticalinformation=[];%�յ�ͳ����Ϣ
[num,txt,raw1]=xlsread('preprocessedprospective0.xls');%��ȡѵ������

for index1=1:size(raw1,1)
    for index2=1:size(raw1,2)
            if ismember(index2,[2,16,17,40:46])~=1%�������ԭʼ�����Ƿ����
                    raw1{index1,index2}=num2str(raw1{index1,index2});
            end
    end
end


for index=1:size(raw1,2)%����
    if ismember(index,[2,16,17,40:46])==1%�������ֵ�͵�
        
        tempmatrix=cell2mat(raw1(:,index));
        [tempcounts,tempcenters]=hist(tempmatrix);
        
        statisticalinformation{index}=[tempcenters;tempcounts];
    else%����Ƿ���ֵ�͵�
        values=unique(raw1(:,index))';
        valuescount=zeros(1,numel(values));
        for index2=1:numel(values)
            temp=values{index2};
            for index3=1:size(raw1,1)%����
               if isequal(raw1{index3,index},temp)==1
                   valuescount(index2)=valuescount(index2)+1;
               end
            end
        end
        statisticalinformation{index}=[values;num2cell(valuescount)];
    end
end

for index=1:size(raw1,2)%����
    temp=0;
    for index1=1:size(raw1,1)
        if isnan(raw1{index1,index})==1
            temp=temp+1;
        end
    end
    emptystatisticalinformation=[emptystatisticalinformation temp];
end



% %������statisticalinformation��ɿ���д��excel������
% statisticalinformationexcel={};
% for index=1:numel(statisticalinformation)
%     statisticalinformationexcel=[statisticalinformationexcel num2cell(statisticalinformation{index})];
%     statisticalinformationexcel=[statisticalinformationexcel {'*','*'}'];
% end
% xlswrite('statistical0.xls',statisticalinformationexcel);%д���ˣ���ΪĳЩԪ��д����������ͼʱʹ�ü���
xlswrite('prospectiveemptystatistical0.xls',emptystatisticalinformation);