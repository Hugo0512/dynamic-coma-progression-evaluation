clc
clear all
%�ڶ�������·�����
%��һ�����ݼ��е����ݷֳ�2������
[num,txt,raw1]=xlsread('externaltask2.xls');%��ȡѵ�����ݣ���������ʱʹ�ô���
% [num,txt,raw1]=xlsread('externalextendedtime1.xls');%��ȡѵ������,ֻ��һ�������ʱʵ�ô���
class0={};
class1={};
for index=1:size(raw1,1)
    if raw1{index,end}==0
        class0=[class0;raw1(index,:)];
    else
        class1=[class1;raw1(index,:)];
    end
end
xlswrite('external0task2.xls',class0);
xlswrite('external1task2.xls',class1);