clc
clear all
extendedvalue={};%������չʱ����������
%�ڶ��ִ���ʱ�����еķ�ʽ���������죬ÿ��7��������ÿ��������������ȫ����Ϊ��ֵ����

count=0;%��¼��չ����������
daythreshold=7;%Ԥ������֮���Ƿ�����ѣ������޸ģ������������
%����ʱ����������
%����ԭʼ���ݣ��˴��������Ѿ�������������
[num,txt,raw1]=xlsread('missforest1.xls');%��ȡѵ������,����ֻ�����ѻ��ߵ����ݣ�1��������
[num,txt,raw2]=xlsread('1.xlsx');%��ȡѵ�������еĽ��ʱ�䣬���ڼ�������
target=raw2(:,end-1);%�����ڶ����ǽ��ʱ��
target(1)=[];
train_label=target;
raw1(1,:)=[];

%�����������
for index=1:size(raw1,1)
    if index==78
        disp('sdddddddddddddddddddddddddddddddddd')
    end
    targetvalue=train_label{index};
    tempcount=0;%���ڱ���¼�ļ�����
    for index1=1:targetvalue
        count=count+1;
        tempcount=tempcount+1;
        extendedvalue(count,1:38)=raw1(index,:);
        %�޸ĺ��μ�¼
        if targetvalue<=daythreshold+1
             extendedvalue{count,39}=1;%1�����ѣ�0�ǲ�����
            for index2=32:38%30:36
                if raw1{index,index2}==0
                   extendedvalue{count,index2}=0;
                else 
                    
                    if index1<raw1{index,index2}
                        extendedvalue{count,index2}=0;
                    else
                        extendedvalue{count,index2}=index1-extendedvalue{count,index2}+1;
                    end
                end
            end
        else
                if tempcount<targetvalue-daythreshold+1
                    extendedvalue{count,39}=0;
                    for index2=32:38%30:36
                        if raw1{index,index2}==0
                              extendedvalue{count,index2}=0;
                        else 
                        
                            if index1<raw1{index,index2}
                                extendedvalue{count,index2}=0;
                            else
                                extendedvalue{count,index2}=index1-extendedvalue{count,index2}+1;
                            end
                        end
                    end
                else

                    extendedvalue{count,39}=1;
                    for index2=32:38
                        if raw1{index,index2}==0
                              extendedvalue{count,index2}=0;
                        else 
                            if index1<raw1{index,index2}
                                extendedvalue{count,index2}=0;
                            else
                                extendedvalue{count,index2}=index1-extendedvalue{count,index2}+1;
                            end
                        end
                    end
                end
        end
    end
end
%��Ҫ��ҩ����
%extendedvalue(:,24:29)=[];
%�°������ҩ�����Ѿ�ȥ����������һ��ע�͵�
xlswrite('extendedtime1.xls',extendedvalue)