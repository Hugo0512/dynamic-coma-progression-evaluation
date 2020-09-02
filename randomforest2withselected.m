clc
clear all
TP=0;
FN=0;
TN=0;
FP=0;
recall=0;
selected=load('selectedfeaturenumber.txt');%����0����û�б�ѡ�У�1����ѡ��
[num,txt,raw1]=xlsread('downsampletrain1.xls');%��ȡѵ������
% [num,txt,raw4]=xlsread('data152');
% [num,txt,raw3]=xlsread('temp14');
% [num,txt,raw4]=xlsread('temp15');

raw=[raw1];
%raw=raw1;
train_label=raw(:,end);
raw(:,end)=[];
train_data=raw;

train_data(:,40:end)=[];%��һ������ɾ����벿�����ݣ�������ҩ
% train_data(:,29:35)=[];
% train_data(:,end-10:end-4)=[];
% train_data(:,29:35)=[];%ɾ��ǰ�벿������

clear raw1
[num,txt,raw9]=xlsread('prospectivetest1.xls');%��ȡ��������
raw13=raw9;
test_data=raw13;
test_label=raw13(:,end);
test_data(:,end)=[];
test_data(:,40:end)=[];%��һ������ɾ����벿������,������ҩ
% test_data(:,29:35)=[];
%  test_data(:,end-10:end-4)=[];
% test_data(:,29:35)=[];%ɾ��ǰ�벿������
% test_label=num2cell(ones(size(test_data,1),1));

for index=1:numel(test_label)
    test_label{index}=num2str(test_label{index});
end

for index=1:numel(train_label)
    if ischar(train_label{index})~=1
        train_label{index}=num2str(train_label{index});
    end
end
% for index=1:size(train_data,1)
%     for index1=1:size(train_data,2)
%         if ischar(train_data{index,index1})~=1
%             train_data{index,index1}=num2str(train_data{index,index1});
%         end
%     end
% end
% for index=1:size(test_data,1)
%     for index1=1:size(test_data,2)
%         if ischar(test_data{index,index1})~=1
%             test_data{index,index1}=num2str(test_data{index,index1});
%         end
%     end
% end
for index1=1:size(train_data,1)
    for index2=1:size(train_data,2)
%         if ismember(index2,[2,16,17,32:45])~=1
%             if ismember(index2,[29:45])~=1
          if ismember(index2,[2,16,17])~=1%�������ԭʼ�����Ƿ����
%             if ismember(index2,[37,38,39])~=1%�������ԭʼ�����Ƿ����
%             if ismember(index2,[29,30,31])~=1%�������ԭʼ�����Ƿ����
%             if ismember(index2,[29:31])~=1%�������ԭʼ�����Ƿ����
%              if ismember(index2,[40,41,42])~=1
%         if ismember(index2,[26:35])~=1
            train_data{index1,index2}=num2str(train_data{index1,index2});
        end
    end
end
for index1=1:size(test_data,1)
    for index2=1:size(test_data,2)
%         if ismember(index2,[2,16,17,32:45])~=1%�������ԭʼ�����Ƿ����
           if ismember(index2,[2,16,17])~=1%�������ԭʼ�����Ƿ����
%                if ismember(index2,[37,38,39])~=1%�������ԭʼ�����Ƿ����
%           if ismember(index2,[29:45])~=1%�������ԭʼ�����Ƿ����
%                if ismember(index2,[29,30,31])~=1%�������ԭʼ�����Ƿ����
%                 if ismember(index2,[29:31])~=1%�������ԭʼ�����Ƿ����
%             if ismember(index2,[40,41,42])~=1%�Ⱥ���Թ�����
%          if ismember(index2,[26:35])~=1
            test_data{index1,index2}=num2str(test_data{index1,index2});
        end
    end
end

[colnum,coltxt,colnames]=xlsread('clonames.xls');
%clonames2��42�У�2�����
%colnames5��35�У�һ�����
%colnames5��49�У��������
% colnames(24:end)=[];%ɾ����벿����������������ҩ
%colnames(1:28)=[];%ɾ��ǰ�벿��������
%��ѵ�����ݺ���֤���ݽ����ų���ֻҪ��ѡ�еģ�ͬʱ�е�����ҲҪ�ų�
deleteindex=[];
for index=1:numel(selected)
    if selected(index)~=1
        deleteindex=[deleteindex index];

    end
end


train_data(:,deleteindex)=[];
test_data(:,deleteindex)=[];
colnames(deleteindex)=[];
        
        
        
train_data=cell2table(train_data,'VariableNames', colnames);
test_data=cell2table(test_data,'VariableNames', colnames);
% C=[0 1;30 0];
% C=[0 3;1 0];
% Factor = TreeBagger(5000, train_data, train_label,'Cost',C);
Factor = TreeBagger(500, train_data, train_label);
% load Factor.mat
[Predict_label,Scores] = predict(Factor, test_data);
correct=0;
for index=1:numel(test_label)
    if isequal(test_label{index},Predict_label{index})==1
        correct=correct+1;
    end
end
accuracy=correct/numel(test_label);
confusionmatrix=zeros(2);
for index=1:numel(Predict_label)
   confusionmatrix(str2num(test_label{index})+1,str2num(Predict_label{index})+1)=confusionmatrix(str2num(test_label{index})+1,str2num(Predict_label{index})+1)+1;
end
test_label=cell2mat(test_label);
test_label=str2num(test_label);
number1=numel(find(test_label==1));%����������
number2=numel(test_label)-number1;
predict_label=cell2mat(Predict_label);
predict_label=str2num(predict_label);
for index1=1:number1+number2
    if predict_label(index1)==1 & test_label(index1)==1
        TP=TP+1;
    end
    if predict_label(index1)==0 & test_label(index1)==0
         TN=TN+1;
     end
end

% for index1=1:number2
%     if predict_label(index1+number1)==2 & test_label(index1+number1)==2
%         TN=TN+1;
%     end
% end
FP=number2-TN;
        P=number1;
        N=number2;
FN=number1-TP;
Accuracy=(TP+TN)/(P+N);
Sensitivity=TP/P;
FNR=1-Sensitivity;
Specificity=TN/N;
FPR=1-Specificity;
recall= 1 - FN/P;
ROC=[];%��ROC���ߵĴ洢����
PR=[];%��PR���ߵĴ洢����
largevalues=[];
largevalues=Scores(:,2);%���������ĸ���
templabel=[];


    %��Ͼ���
    comprehensivearray=[test_label largevalues];
    
     %����
    for index4=1:size(comprehensivearray,1)
        for index5=index4+1:size(comprehensivearray,1)
            if comprehensivearray(index4,2)<comprehensivearray(index5,2)
                %����
                temp=comprehensivearray(index4,:);
                comprehensivearray(index4,:)=comprehensivearray(index5,:);
                comprehensivearray(index5,:)=temp;
            end
        end
    end
   for index=1:size(comprehensivearray,1)
    benchmark=comprehensivearray(index,2);
    for index1=1:size(comprehensivearray,1)
        if comprehensivearray(index1,2)>=benchmark
           comprehensivearray(index1,3)=1;
        else
           comprehensivearray(index1,3)=0;
        end
    end

        FP1=0;
        TP1=0;
        FN1=0;
        for index2=1:size(comprehensivearray,1)
            if comprehensivearray(index2,1)==0 & comprehensivearray(index2,3)==1
                FP1=FP1+1;
            end
        end
        for index3=1:size(comprehensivearray,1)
            if comprehensivearray(index3,1)==1 & comprehensivearray(index3,3)==1
                TP1=TP1+1;
            end
        end
        for index3=1:size(comprehensivearray,1)
            if comprehensivearray(index3,1)==1 & comprehensivearray(index3,3)==0
                FN1=FN1+1;
            end
        end
  ROC(1,index)=FP1/N;%FPR
  ROC(2,index)=TP1/P; %FPR
  PR(2,index)=TP1/(FP1+TP1);%PRECISION
  PR(1,index)=TP1/(TP1+FN1);%RECALL
   end 
   
%   FP=ROC(1,:)*N;
%   TP=ROC(2,:)*P;
%   TN2=N-FP;
%   FN2=P-TP;
%   precision=TP./(TP+FP);
%   TPR=TP./(TP+FN);
%   recall=TPR;
% FPR=FP./(TN+FP);
% PR(1,:)=recall; PR(2,:)=precision;
%plot(PR(1,:),PR(2,:),'r-');
 plot(ROC(1,:),ROC(2,:),'-r');
%  save('Factor3.mat','Factor','-v7.3')