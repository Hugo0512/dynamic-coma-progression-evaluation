clc
clear all
% mark=0;
distance=[];
level=8;%��ɢ����
[num,txt,raw] =xlsread('train4.xls');%��������
% discrete=[];
% raw={raw{:,1};raw{:,4};raw{:,5};raw{:,7};raw{:,8};raw{:,9};raw{:,10};raw{:,11};raw{:,12};raw{:,13};raw{:,14};raw{:,15};raw{:,3}}';
% for index=1:size(raw,1)
%    raw{index,4}=raw{index,4}+1;
% end
%�������ɢ��
% for index1=1:size(raw,1)
%     if raw{index1,5}>=1 & raw{index1,5}<=3
%         discrete(index1)=1;
%     elseif raw{index1,5}>=4 & raw{index1,5}<=6
%          discrete(index1)=2;
%     elseif raw{index1,5}>=7 & raw{index1,5}<=9
%          discrete(index1)=3;
%     elseif raw{index1,5}>=10 & raw{index1,5}<=12
%          discrete(index1)=4;
%     elseif raw{index1,5}>=13 & raw{index1,5}<=18 
%          discrete(index1)=5;
%     elseif raw{index1,5}>=19 & raw{index1,5}<=24 
%          discrete(index1)=6;  
%     elseif raw{index1,5}>24    
%          discrete(index1)=7;
%     end
% end
% for index=1:size(raw,1)  
%    raw{index,5}=discrete(index);
% end
raw1={};
count=0;
%������Դ������raw���䣨�����ࣩ
for index1=size(raw,1):-1:1
    index1
        if raw{index1,end}==1%��0�����raw1����Ҫ�����һ��
            count=count+1;
            raw1(count,:)=raw(index1,:);%0��2�����raw1����raw����������µ�1��
              raw(index1,:)=[];
        end
end
samplenumber=size(raw,1);%��0��������

for index=1:size(raw,1)
    for index1=1:size(raw,2)
        if ischar(raw{index,index1})~=1
            raw{index,index1}=num2str(raw{index,index1});
        end
    end
end
%ȥ����ֵ���͵���
% raw(:,[2,13,14,29:35])=[];
% raw1(:,[2,13,14,29:35])=[];

raw(:,[2,16,17,40:46])=[];
raw1(:,[2,16,17,40:46])=[];

%�����ݷ��飬�ֱ�Ϊ��1����1����2����2
% x=0;
% for index=1:size(raw,1)
%     k=findstr(raw{index,end},'NULL');
%    if isempty(k)==1
%        raw{index,end}=num2str(1);
%        x=x+1;
%    else
%        raw{index,end}=num2str(2);
%    end
% end
% for index=1:size(raw,1)
%    if isequal(raw{index,3},'OU')==1
%        raw{index,4}='˫';
%    else
%        raw{index,4}='��';
%    end
% end
% rest={};%����ʣ�µ����ݣ��в���֢�����ݣ�
%������Ϊsmote,�������������������䣬����rest���������
%ɾ�����һ��Ϊ1���в�����
% for index=size(raw,1):-1:1
%     if isequal(raw{index,end},'2')==1
%         rest(size(rest,1)+1,:)=raw(index,:);
%         raw(index,:)=[];
%     end
% end

%���ø���ֵ�͵�SMOTE�㷨
ratio=1;%Ҳ������������������ʱ��Բ�ͬ��������޸�

rownumber=size(raw,1);
for index=1:size(raw,1)
    tempsample=raw(index,:);
    if floor(ratio)~=ratio
        %��������
        
         for index=1:floor(ratio)
                %ѡ��һ����һ��������
                another=randint(1,1,[1,rownumber]);
                while another==index
                    another=randint(1,1,[1,rownumber]);
                end
                anothersample=raw(another,:);
                %�������Ƶ��ԭ������˹�������֮��洢��raw�����һ��
                values={};
        %         stastistic=[];%�洢��������ȡֵ��ͳ�ƽ��
                artificialsample={};
                for index1=1:size(raw,2)
                    tempvalues={tempsample{index1},anothersample{index1}};
                    uniquevalues=unique(tempvalues);
                    if numel(uniquevalues)==1
                        values{index1}=uniquevalues;
                        artificialsample{index1}=uniquevalues{1};
                    else
                        values{index1}=uniquevalues;
                        if rand()>0.5
                            artificialsample{index1}=uniquevalues{1};
                        else
                            artificialsample{index1}=uniquevalues{2};
                        end
                    end
                end
                raw(size(raw,1)+1,:)=artificialsample;
            end
        
          for index=1:ceil(ratio-floor(ratio))
        %ѡ��һ����һ��������
        if rand()>0.5
                another=randint(1,1,[1,rownumber]);
                while another==index
                    another=randint(1,1,[1,rownumber]);
                end
                anothersample=raw(another,:);
                %�������Ƶ��ԭ������˹�������֮��洢��raw�����һ��
                values={};
        %         stastistic=[];%�洢��������ȡֵ��ͳ�ƽ��
                artificialsample={};
                for index1=1:size(raw,2)
                    tempvalues={tempsample{index1},anothersample{index1}};
                    uniquevalues=unique(tempvalues);
                    if numel(uniquevalues)==1
                        values{index1}=uniquevalues;
                        artificialsample{index1}=uniquevalues{1};
                    else
                        values{index1}=uniquevalues;
                        if rand()>0.5
                            artificialsample{index1}=uniquevalues{1};
                        else
                            artificialsample{index1}=uniquevalues{2};
                        end
                    end
                end
                raw(size(raw,1)+1,:)=artificialsample;

                end
         end
        
    else

        for index=1:floor(ratio)
                %ѡ��һ����һ��������
                another=randint(1,1,[1,rownumber]);
                while another==index
                    another=randint(1,1,[1,rownumber]);
                end
                anothersample=raw(another,:);
                %�������Ƶ��ԭ������˹�������֮��洢��raw�����һ��
                values={};
        %         stastistic=[];%�洢��������ȡֵ��ͳ�ƽ��
                artificialsample={};
                for index1=1:size(raw,2)
                    tempvalues={tempsample{index1},anothersample{index1}};
                    uniquevalues=unique(tempvalues);
                    if numel(uniquevalues)==1
                        values{index1}=uniquevalues;
                        artificialsample{index1}=uniquevalues{1};
                    else
                        values{index1}=uniquevalues;
                        if rand()>0.5
                            artificialsample{index1}=uniquevalues{1};
                        else
                            artificialsample{index1}=uniquevalues{2};
                        end
                    end
                end
                raw(size(raw,1)+1,:)=artificialsample;
        end
    end
end
nominalSMOTEarray=raw;
% xlswrite('extendedtrain1.xls',raw);
nominalSMOTEarray=[nominalSMOTEarray;raw1];%���ɵ��������0������ݺϲ�
% save('nominalSMOTEarray.mat','nominalSMOTEarray')
xlswrite('SMOTEnominalarraytrain4.xls',nominalSMOTEarray);