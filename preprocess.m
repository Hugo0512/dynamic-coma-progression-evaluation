clc%注意从21开始是新增补全数据
clear all
[num,txt,raw]=xlsread('prospective0.xlsx');
%处理数据
tempraw={};
for index=2:size(raw,1)
    if isnumeric(raw{index,3})==1
        tempraw{index,3}=num2str(raw{index,3});
    end
    if isnan(raw{index,3})==1
        tempraw{index,3}=[];
    end
    %第四列年龄不需要做分段处理，就保持原有数字
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
    %第五列处理成4列
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
      
    
    %第六列入院GCS评分
    %处理第6列成3列
    temp=raw{index,6};
    tempraw{index,9}=temp(2);
    tempraw{index,10}=temp(4);
    %处理T
    if strfind(tempraw{index,10},'T')==1
        tempraw{index,10}=[];
    end
    tempraw{index,11}=temp(6);%已经到了第8列
    
    
    for index1=7:16%17-23
             
        if isnumeric(raw{index,index1})==1
            tempraw{index,5+index1}=num2str(raw{index,index1});
        end
        if isnan(raw{index,index1})==1
            tempraw{index,5+index1}=[];
        end
             
      
       
    end
    %第17列处理成4列
    
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
                tempraw{index,21+str2num(temp(index2))}=num2str(1);%22-25列填充
            end
     end
    
    
    
    %第18列就是1列
     if isnumeric(raw{index,18})==1
        tempraw{index,26}=num2str(raw{index,18});
    end
    if isnan(raw{index,18})==1
        tempraw{index,26}=[];%填充25列
    end
    %第19列处理成4列
    
    
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
        tempraw{index,26+str2num(temp(index2))}=num2str(1);%27-30列填充
    end
     end
    
    
    
    %第20列处理成3列
    
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
        tempraw{index,30+str2num(temp(index2))}=num2str(1);%31-33列填充
    end
     end
    
    %21-23列全部都是一列
     if isnumeric(raw{index,21})==1
        tempraw{index,34}=num2str(raw{index,21});
    end
    if isnan(raw{index,21})==1
        tempraw{index,34}=[];%填充34列
    end
     if isnumeric(raw{index,22})==1
        tempraw{index,35}=num2str(raw{index,22});
    end
    if isnan(raw{index,22})==1
        tempraw{index,35}=[];%填充35列
    end
    
     if isnumeric(raw{index,23})==1
        tempraw{index,36}=num2str(raw{index,23});
    end
    if isnan(raw{index,23})==1
        tempraw{index,36}=[];%填充36列
    end
    
    %     %处理第24列成5列
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
        tempraw{index,36+str2num(temp(index2))}=num2str(1);%37-41列填充
    end
    end
    %26到33列处理成数值，并且27列需要处理T
      for index1=26:32%42-48列填充
             
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
%     %处理第19列成5列
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
%      %处理第20列成6列
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
% %第9,10列变成数字
% tempraw{:,9}=str2num(tempraw{:,9});
% tempraw{:,10}=str2num(tempraw{:,10});
tempraw(:,[1 2])=[];
xlswrite('preprocessedprospective0.xls',tempraw)