clc%ע���21��ʼ��������ȫ����
clear all
[num,txt,raw]=xlsread('prospective0.xlsx');
%��������
tempraw={};
for index=2:size(raw,1)
    if isnumeric(raw{index,3})==1
        tempraw{index,3}=num2str(raw{index,3});
    end
    if isnan(raw{index,3})==1
        tempraw{index,3}=[];
    end
    %���������䲻��Ҫ���ֶδ����ͱ���ԭ������
    if isnumeric(raw{index,4})==1
        tempraw{index,4}=num2str(raw{index,4});
    end
    if isnan(raw{index,4})==1
        tempraw{index,4}=[];
    end
%     if isnumeric(raw{index,5})==1
%         tempraw{index,5}=num2str(raw{index,5});
%     end
%     if isnan(raw{index,5})==1
%         tempraw{index,5}=[];
%     end
    %�����д����4��
     if isnumeric(raw{index,5})==1
         raw{index,5}=num2str(raw{index,5});
     end
     
     
     
      if isnan(raw{index,5})==1
     tempraw{index,5}=[];
     tempraw{index,6}=[];
     tempraw{index,7}=[];
     tempraw{index,8}=[];
      else
     tempraw{index,5}=num2str(0);
     tempraw{index,6}=num2str(0);
     tempraw{index,7}=num2str(0);
     tempraw{index,8}=num2str(0);
      end
    
     temp=raw{index,5};
    for index2=1:numel(temp)
        tempraw{index,4+str2num(temp(index2))}=num2str(1);
    end
      
    
    %��������ԺGCS����
    %�����6�г�3��
    temp=raw{index,6};
    tempraw{index,9}=temp(2);
    tempraw{index,10}=temp(4);
    %����T
    if strfind(tempraw{index,10},'T')==1
        tempraw{index,10}=[];
    end
    tempraw{index,11}=temp(6);%�Ѿ����˵�8��
    
    
    for index1=7:16%17-23
             
        if isnumeric(raw{index,index1})==1
            tempraw{index,5+index1}=num2str(raw{index,index1});
        end
        if isnan(raw{index,index1})==1
            tempraw{index,5+index1}=[];
        end
             
      
       
    end
    %��17�д����4��
    
    if isnumeric(raw{index,17})==1
         raw{index,17}=num2str(raw{index,17});
     end
     
     
     
      if isnan(raw{index,5})==1
     tempraw{index,22}=[];
     tempraw{index,23}=[];
     tempraw{index,24}=[];
     tempraw{index,25}=[];
      else
     tempraw{index,22}=num2str(0);
     tempraw{index,23}=num2str(0);
     tempraw{index,24}=num2str(0);
     tempraw{index,25}=num2str(0);
      end
    
     temp=raw{index,17};
     if isequal(temp,'NaN')~=1
            for index2=1:numel(temp)
                tempraw{index,21+str2num(temp(index2))}=num2str(1);%22-25�����
            end
     end
    
    
    
    %��18�о���1��
     if isnumeric(raw{index,18})==1
        tempraw{index,26}=num2str(raw{index,18});
    end
    if isnan(raw{index,18})==1
        tempraw{index,26}=[];%���25��
    end
    %��19�д����4��
    
    
    if isnumeric(raw{index,19})==1
         raw{index,19}=num2str(raw{index,19});
     end
     
     
     
      if isnan(raw{index,19})==1
     tempraw{index,27}=[];
     tempraw{index,28}=[];
     tempraw{index,29}=[];
     tempraw{index,30}=[];
      else
     tempraw{index,27}=num2str(0);
     tempraw{index,28}=num2str(0);
     tempraw{index,29}=num2str(0);
     tempraw{index,30}=num2str(0);
      end
    
     temp=raw{index,19};
     if isequal(temp,'NaN')~=1
    for index2=1:numel(temp)
        tempraw{index,26+str2num(temp(index2))}=num2str(1);%27-30�����
    end
     end
    
    
    
    %��20�д����3��
    
     if isnumeric(raw{index,20})==1
         raw{index,20}=num2str(raw{index,20});
     end
     
     
     
      if isnan(raw{index,20})==1
     tempraw{index,31}=[];
     tempraw{index,32}=[];
     tempraw{index,33}=[];
      else
     tempraw{index,31}=num2str(0);
     tempraw{index,32}=num2str(0);
     tempraw{index,33}=num2str(0);
      end
    
     temp=raw{index,20};
     if isequal(temp,'NaN')~=1
    for index2=1:numel(temp)
        tempraw{index,30+str2num(temp(index2))}=num2str(1);%31-33�����
    end
     end
    
    %21-23��ȫ������һ��
     if isnumeric(raw{index,21})==1
        tempraw{index,34}=num2str(raw{index,21});
    end
    if isnan(raw{index,21})==1
        tempraw{index,34}=[];%���34��
    end
     if isnumeric(raw{index,22})==1
        tempraw{index,35}=num2str(raw{index,22});
    end
    if isnan(raw{index,22})==1
        tempraw{index,35}=[];%���35��
    end
    
     if isnumeric(raw{index,23})==1
        tempraw{index,36}=num2str(raw{index,23});
    end
    if isnan(raw{index,23})==1
        tempraw{index,36}=[];%���36��
    end
    
    %     %�����24�г�5��
     if isnumeric(raw{index,24})==1
         raw{index,24}=num2str(raw{index,24});
     end
     
     
     
      if isnan(raw{index,24})==1
     tempraw{index,37}=[];
     tempraw{index,38}=[];
     tempraw{index,39}=[];
     tempraw{index,40}=[];
     tempraw{index,41}=[];
      else
          tempraw{index,37}=num2str(0);
     tempraw{index,38}=num2str(0);
     tempraw{index,39}=num2str(0);
     tempraw{index,40}=num2str(0);
     tempraw{index,41}=num2str(0);
     end
     
    temp=raw{index,24};
    if isequal(temp,'NaN')~=1
    for index2=1:numel(temp)
        tempraw{index,36+str2num(temp(index2))}=num2str(1);%37-41�����
    end
    end
    %26��33�д������ֵ������27����Ҫ����T
      for index1=26:32%42-48�����
             
        if isnumeric(raw{index,index1})==1
            tempraw{index,16+index1}=num2str(raw{index,index1});
        end
        if isnan(raw{index,index1})==1
            tempraw{index,16+index1}=[];
        end
         if index1==27
       if isempty(strfind(raw{index,index1},'T'))~=1
            tempraw{index,16+index1}=[];
       end
         end
       
    end
%     if isnumeric(raw{index,18})==1
%         tempraw{index,20}=num2str(raw{index,18});
%     end
%     if isnan(raw{index,20})==1
%         tempraw{index,20}=[];
%     end
%     
%     %�����19�г�5��
%      if isnumeric(raw{index,19})==1
%          raw{index,19}=num2str(raw{index,19});
%      end
%      
%      
%      
%       if isnan(raw{index,19})==1
%      tempraw{index,21}=[];
%      tempraw{index,22}=[];
%      tempraw{index,23}=[];
%      tempraw{index,24}=[];
%      tempraw{index,25}=[];
%       else
%           tempraw{index,21}=num2str(0);
%      tempraw{index,22}=num2str(0);
%      tempraw{index,23}=num2str(0);
%      tempraw{index,24}=num2str(0);
%      tempraw{index,25}=num2str(0);
%      end
%      
%     temp=raw{index,19};
%     for index2=1:numel(temp)
%         tempraw{index,20+str2num(temp(index2))}=num2str(1);
%     end
%      %�����20�г�6��
%      if isnumeric(raw{index,20})==1
%          raw{index,20}=num2str(raw{index,20});
%      end
%      if isnan(raw{index,20})==1
%          tempraw{index,26}=[];
%          tempraw{index,27}=[];
%          tempraw{index,28}=[];
%          tempraw{index,29}=[];
%          tempraw{index,30}=[];
%           tempraw{index,31}=[];
%           else
%            tempraw{index,26}=num2str(0);
%          tempraw{index,27}=num2str(0);
%          tempraw{index,28}=num2str(0);
%          tempraw{index,29}=num2str(0);
%          tempraw{index,30}=num2str(0);
%           tempraw{index,31}=num2str(0);
%      end
% %      if isnan(raw{index,22})~=1
% %          raw{index,20}=num2str(raw{index,20});
%          temp=raw{index,20};
%          for index2=1:numel(temp)
%             tempraw{index,25+str2num(temp(index2))}=num2str(1);
%          end
% %      end
%     if isnan(raw{index,21})==1
%         tempraw{index,32}=[];
%     else   
%         tempraw{index,32}=raw{index,21};
%     end
%      if isnan(raw{index,22})==1
%         tempraw{index,33}=[];
%     else   
%         tempraw{index,33}=raw{index,22};
%     end
%      if isnan(raw{index,23})==1
%         tempraw{index,34}=[];
%     else   
%         tempraw{index,34}=raw{index,23};
%     end
%      if isnan(raw{index,24})==1
%         tempraw{index,35}=[];
%     else   
%         tempraw{index,35}=raw{index,24};
%      end 
%    
%      if isnan(raw{index,25})==1
%         tempraw{index,36}=[];
%     else   
%         tempraw{index,36}=raw{index,25};
%     end 
%      
%      if isnan(raw{index,26})==1
%         tempraw{index,37}=[];
%     else   
%         tempraw{index,37}=raw{index,26};
%     end 
%      
%        if isnan(raw{index,27})==1
%         tempraw{index,38}=[];
%        else   
%         tempraw{index,38}=raw{index,27};
%        end 
%     
end
tempraw(1,:)=[];
% %��9,10�б������
% tempraw{:,9}=str2num(tempraw{:,9});
% tempraw{:,10}=str2num(tempraw{:,10});
tempraw(:,[1 2])=[];
xlswrite('preprocessedprospective0.xls',tempraw)