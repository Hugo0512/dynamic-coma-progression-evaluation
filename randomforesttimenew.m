clc
clear all

%�ü���ʱ���Ԥ��
numtime=2;%����ʱ���޸�
extendedvaluemultiple={};
testextendedvaluemultiple={};
[num,txt,raw1]=xlsread('extendedtime0.xls');%��ȡѵ������
target=raw1(:,end);%���һ����Ŀ��ֵ�������Ѿ�������1����0������preprocesstime�д������
target=cell2mat(target);

raw=raw1;
%raw=raw1;
train_label=target;
train_data=raw;
train_data(:,end)=[];
clear raw1
[num,txt,raw9]=xlsread('externalextendedtime0.xls');%��ȡѵ������

target1=raw9(:,end);%���һ����Ŀ��ֵ�������Ѿ�������1����0����preprocesstime�д������

raw13=raw9;
test_data=raw13;
test_data(:,end)=[];
target1=cell2mat(target1);

test_label=target1;
% test_label=num2cell(ones(size(test_data,1),1));

%����numtime����������
[num,txt,raw2]=xlsread('0.xlsx');%��ȡѵ������
originaltarget=raw2(:,end-1);
originaltarget(1)=[];
originaltarget=cell2mat(originaltarget);

for index1=1:numel(originaltarget)
    %����ڼ��е��ڼ�����Ŀ�귶Χ
%     if index1==78
%         disp('sssssssssssssssssssssssss')
%     end

    if index1==1
       if originaltarget(index1)>90
           originaltarget(index1)=90;
        end
        tempdata=train_data(1:originaltarget(index1),:);
        localtarget=target(1:originaltarget(index1));
        for index2=1:size(tempdata,1)-numtime+1
            temptarget=localtarget(index2);
            tempsample=tempdata(index2,:);
            for index3=1:numtime-1
              tempsample=[tempsample tempdata(index2+index3,32:38)];
              temptarget=temptarget+localtarget(index2+index3);
            end
              if temptarget==0
                  tempsample={tempsample{:} 0};
              else
                  tempsample={tempsample{:} 1};
              end
            extendedvaluemultiple=[extendedvaluemultiple;tempsample];  
        end
    else
        if originaltarget(index1)>90
           originaltarget(index1)=90;
        end
        tempdata=train_data(sum(originaltarget(1:index1-1))+1:sum(originaltarget(1:index1)),:);
        localtarget=target(sum(originaltarget(1:index1-1))+1:sum(originaltarget(1:index1)));
         for index2=1:size(tempdata,1)-numtime+1
            temptarget=localtarget(index2);
            tempsample=tempdata(index2,:);
            for index3=1:numtime-1
              tempsample=[tempsample tempdata(index2+index3,32:38)];
              temptarget=temptarget+localtarget(index2+index3);
            end
              if temptarget==0
                  tempsample={tempsample{:} 0};
              else
                  tempsample={tempsample{:} 1};
              end
            extendedvaluemultiple=[extendedvaluemultiple;tempsample];  
        end
    end
end




%����numtime����������
[num,txt,raw2]=xlsread('external0.xlsx');%��ȡѵ������
originaltarget=raw2(:,end-1);
originaltarget(1)=[];
originaltarget=cell2mat(originaltarget);

for index1=1:numel(originaltarget)
    %����ڼ��е��ڼ�����Ŀ�귶Χ
    if index1==1
        if originaltarget(index1)>90
           originaltarget(index1)=90;
        end
        tempdata=test_data(1:originaltarget(index1),:);
        localtarget1=target1(1:originaltarget(index1));
        for index2=1:size(tempdata,1)-numtime+1
            temptarget=localtarget1(index2);
            tempsample=tempdata(index2,:);
            for index3=1:numtime-1
              tempsample=[tempsample tempdata(index2+index3,29:35)];
              temptarget=temptarget+localtarget1(index2+index3);
            end
              if temptarget==0
                  tempsample={tempsample{:} 0};
              else
                  tempsample={tempsample{:} 1};
              end
            testextendedvaluemultiple=[testextendedvaluemultiple;tempsample];  
        end
    else
        if originaltarget(index1)>90
           originaltarget(index1)=90;
        end
        tempdata=test_data(sum(originaltarget(1:index1-1))+1:sum(originaltarget(1:index1)),:);
        localtarget1=target1(sum(originaltarget(1:index1-1))+1:sum(originaltarget(1:index1)));
         for index2=1:size(tempdata,1)-numtime+1
            temptarget=localtarget1(index2);
            tempsample=tempdata(index2,:);
            for index3=1:numtime-1
              tempsample=[tempsample tempdata(index2+index3,29:35)];
              temptarget=temptarget+localtarget1(index2+index3);
            end
              if temptarget==0
                  tempsample={tempsample{:} 0};
              else
                  tempsample={tempsample{:} 1};
              end
            testextendedvaluemultiple=[testextendedvaluemultiple;tempsample];  
        end
    end
end
test_label=testextendedvaluemultiple(:,end);
test_data=testextendedvaluemultiple(:,1:end-1);
train_label=extendedvaluemultiple(:,end);
train_data=extendedvaluemultiple(:,1:end-1);


for index=1:numel(test_label)
    test_label{index}=num2str(test_label{index});
%     if isequal(test_label{index},'2')==1
%         test_label{index}='1';
%     end
%     if isequal(test_label{index},'3')==1
%         test_label{index}='2';
%     end
%     if isequal(test_label{index},'4')==1
%         test_label{index}='2';
%     end
end

for index=1:numel(train_label)
    if ischar(train_label(index))~=1
        train_label{index}=num2str(train_label{index});
    end
%     if isequal(train_label{index},'2')==1
%         train_label{index}='1';
%     end
%     if isequal(train_label{index},'3')==1
%         train_label{index}='2';
%     end
%     if isequal(train_label{index},'4')==1
%         train_label{index}='2';
%     end
end



for index1=1:size(train_data,1)
    for index2=1:size(train_data,2)
        if ismember(index2,[7,8])~=1
            train_data{index1,index2}=num2str(train_data{index1,index2});
        end
    end
end
for index1=1:size(test_data,1)
    for index2=1:size(test_data,2)
        if ismember(index2,[7,8])~=1
            test_data{index1,index2}=num2str(test_data{index1,index2});
        end
    end
end
% test_data(:,30:end)=[];%ɾ����벿������,������ҩ
% train_data(:,30:end)=[];%ɾ����벿�����ݣ�������ҩ

[colnum,coltxt,colnames]=xlsread('clonames2.xls');
% colnames(30:end)=[];%ɾ����벿����������������ҩ
% colnames(24:29)=[];%������ҩ
train_data=cell2table(train_data,'VariableNames', colnames);
test_data=cell2table(test_data,'VariableNames', colnames);

Factor = TreeBagger(5000, train_data, train_label);
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