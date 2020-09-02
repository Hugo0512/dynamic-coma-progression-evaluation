clc
clear all
[num,txt,raw] =xlsread('train4.xls');%��������


raw1={};
count=0;
for index1=size(raw,1):-1:1
    index1
        if raw{index1,end}==1%���������raw1�����Ҵ�raw��ɾ��������raw��ʣ�������࣬������������trainclass1��Ȼ������
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
% trianclass1=raw(:,[2,13,14,29:35]);%ֻ������ֵ���͵�
trianclass1=raw(:,[2,16,17,40:46]);%ֻ������ֵ���͵�
trianclass1=cell2mat(trianclass1);
trianlabel1=1*ones(1,size(trianclass1,1));%�������ǩ
s=1;%�������

artificialsamples=[];%��Ų������˹�����


k=5;%k���ڵĸ���
for index=1:size(trianclass1,1)%ֻ��������������
    distance=[];
   for index1=1:size(trianclass1,1) 
       distance(index1)=sqrt(sum((trianclass1(index,:)-trianclass1(index1,:)).^2));
   end
   
   mixarray=[distance' trianlabel1' [1:size(trianclass1,1)]'];
   
   for index2=1:size(mixarray,1)
       for index3=index2+1:size(mixarray,1)
           if mixarray(index2,1)>mixarray(index3,1)
               temp=mixarray(index2,:);
               mixarray(index2,:)=mixarray(index3,:);
               mixarray(index3,:)=temp;
           end
       end
   end
   for index4=1:s
        chosennumber=randint(1,1,[1,size(mixarray,1)]);
       artificialsample=trianclass1(index,:)+rand()*(trianclass1(mixarray(chosennumber,3),:)-trianclass1(index,:));
       artificialsamples(size(artificialsamples,1)+1,:)=artificialsample;
   end
   size(artificialsamples,1)
end
%��artificialsamples�������룬�ͽ�ȡ��
nearrange=[1,1.5 2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8];
for index1=1:size(artificialsamples,1)
    artificialsamples(index1,1)=round(artificialsamples(index1,1));
    absvalues=abs(nearrange-artificialsamples(index1,2));
    minposition=find(absvalues==min(absvalues));
    artificialsamples(index1,2)=nearrange(minposition(randint(1,1,[1,numel(minposition)])));
    absvalues=abs(nearrange-artificialsamples(index1,3));
    minposition=find(absvalues==min(absvalues));
    artificialsamples(index1,3)=nearrange(minposition(randint(1,1,[1,numel(minposition)])));
    artificialsamples(index1,4:10)=round(artificialsamples(index1,4:10));%��14����������ȡ��������ʱע���޸ģ��˴�ֻ��7�к���
end
SMOTEarray=[trianclass1;artificialsamples];
% SMOTEarray=[SMOTEarray;cell2mat(raw1(:,[2,13,14,29:35]))];%����0���2,13,14�������ݺϲ�
 SMOTEarray=[SMOTEarray;cell2mat(raw1(:,[2,16,17,40:46]))];
% xlswrite('numericalextendedtrain1.xls',SMOTEarray);
% SMOTEarray(:,4:10)=round(SMOTEarray(:,4:10));%��������������
% save('SMOTEarray.mat','SMOTEarray')
xlswrite('SMOTEarraytrain4.xls',SMOTEarray);