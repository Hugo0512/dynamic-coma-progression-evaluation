clc
clear all
extendedvalue={};%用于扩展时间序列数据
%第二种处理时间序列的方式，连续两天，每天7个变量，每个变量用天数，全部变为数值变量

count=0;%记录扩展出来的行数
daythreshold=7;%预测七天之内是否会清醒，可以修改，根据情况而定
%处理时间序列数据
%读入原始数据（此处的数据已经经过初步处理）
[num,txt,raw1]=xlsread('missforest1.xls');%读取训练数据,这里只用清醒患者的数据，1类是清醒
[num,txt,raw2]=xlsread('1.xlsx');%读取训练数据中的结局时间，即第几天清醒
target=raw2(:,end-1);%倒数第二列是结局时间
target(1)=[];
train_label=target;
raw1(1,:)=[];

%处理后半段数据
for index=1:size(raw1,1)
    if index==78
        disp('sdddddddddddddddddddddddddddddddddd')
    end
    targetvalue=train_label{index};
    tempcount=0;%属于本记录的计数器
    for index1=1:targetvalue
        count=count+1;
        tempcount=tempcount+1;
        extendedvalue(count,1:38)=raw1(index,:);
        %修改后半段记录
        if targetvalue<=daythreshold+1
             extendedvalue{count,39}=1;%1是清醒，0是不清醒
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
%不要用药数据
%extendedvalue(:,24:29)=[];
%新版程序用药数据已经去掉，所以上一行注释掉
xlswrite('extendedtime1.xls',extendedvalue)