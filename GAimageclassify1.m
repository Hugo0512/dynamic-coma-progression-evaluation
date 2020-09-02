clc
clear all
warning off
result1=[];
result2=[];
load train.mat%存储全部的训练数据，最后一列是标签
load test.mat%存储全部的测试数据，最后一列是标签
load clonames.mat
 colnames(32:end)=[]; 
for index00012=1:20
    index00012
population=[];%种群
populationsize=30;
historybestfitness=-Inf;
historybestchromosome=[];
featurenumber=31;%特征个数,待定，针对死亡和清醒的第一个预测，31个特征
maxgeneration=200;%最大迭代次数
newpopulation=[];
crossoverrate=0.7;
mutationrate=0.3;
fitness=[];
for index1=1:populationsize
    for index2=1:featurenumber
        if rand()>=0.5
            population(index1,index2)=1;
        else
            population(index1,index2)=0;
        end
    end
end

for k=1:maxgeneration 
    k
   %计算适应度
   parfor index9=1:populationsize
      currentchromosome=population(index9,:);
      tempaccuracy=[];
      for index100=1:4
          triandata=train{index100};
          trianlabel=triandata(:,end);
          triandata(:,end)=[];
          testdata=test{index100};
          testlabel=testdata(:,end);
          testdata(:,end)=[];
                  temptriandata={};
                  temptestdata={};
                  tempcolnames={};
                      featurecount=0;
%                        [colnum,coltxt,colnames]=xlsread('clonames.xls');
                 
for index=1:numel(testlabel)
    testlabel{index}=num2str(testlabel{index});
end

for index=1:numel(trianlabel)
    if ischar(trianlabel{index})~=1
        trianlabel{index}=num2str(trianlabel{index});
    end
end
                 triandata(:,32:end)=[];%第一个问题删除后半部分数据,并且不带用药    
                 testdata(:,32:end)=[];
                     
                  for index10=1:featurenumber%准备特征
                      if currentchromosome(index10)==1
%                           temptriandata{:,featurecount+1}=triandata{:,index10};
                          if ismember(index10,[2,16,17])~=1%此处需要修改，因为有些书数值型的，有些不是
                              temptriandata(:,featurecount+1)=cellstr(num2str(cell2mat(triandata(:,index10))));
                              temptestdata(:,featurecount+1)=cellstr(num2str(cell2mat(testdata(:,index10))));
                          else
                              temptriandata(:,featurecount+1)=triandata(:,index10);
                              temptestdata(:,featurecount+1)=testdata(:,index10);
                          end
                         
                          tempcolnames{featurecount+1}=colnames{index10};
                          featurecount=featurecount+1;
                      end
                  end
                  
                  
              

                  
                  
                  
                  
                  %此处使用SVM分类，获得准确率
                  temptriandata=cell2table(temptriandata,'VariableNames', tempcolnames);
                  temptestdata=cell2table(temptestdata,'VariableNames', tempcolnames);
                  
%                   C=[;];%代价敏感矩阵，可选，如果不用注意注释
                  model=TreeBagger(5000,temptriandata,trianlabel);
                  [Predict_label,Scores] =predict(model,temptestdata);
%               model = svmtrain(trianlabel,temptriandata, '-s 0 -t 0 -e 0.001 -m 500 -b 1');
%               [predict_label, accuracy, dec_values] =svmpredict(testlabel, temptestdata, model,'-b 1');
%               tempaccuracy(index100)=accuracy(1);



correct=0;
for index=1:numel(testlabel)
    if isequal(testlabel{index},Predict_label{index})==1
        correct=correct+1;
    end
end
accuracy=correct/numel(testlabel);



tempaccuracy(index100)=accuracy;
      end
      fitness(index9)=mean(tempaccuracy);
   end
   if max(fitness)>historybestfitness
       historybestfitness=max(fitness);
   end
   maxchromosome=find(fitness==max(fitness));
%    historybestchromosome=population(maxchromosome(randint(1,1,[1,numel(maxchromosome)])),:);
   historybestchromosome=population(maxchromosome(randi(numel(maxchromosome))));

   fitness=fitness./sum(fitness);
   %组成轮盘
       lunpan=[];
       lunpan(1)=fitness(1);
       for i=2:populationsize
         lunpan(i)=lunpan(i-1)+fitness(i);
       end
       %轮盘赌选择
    for i=1:populationsize 
        selectedposition=[];
        mark=rand();
        for index3=1:populationsize
            if lunpan(index3)>=mark
                selectedposition=index3;
                break;
            end
        end
        newpopulation(i,:)=population(selectedposition,:);
    end
       %交叉
       for index4=1:crossoverrate*populationsize
           temparray=randperm(populationsize);
           chromosome1=newpopulation(temparray(1),:);
           chromosome2=newpopulation(temparray(2),:);
%            crossoverpoint=randint(1,1,[1,featurenumber]);
           crossoverpoint=randi(featurenumber);
           tempelement=chromosome1(1:crossoverpoint);
           chromosome1(1:crossoverpoint)=chromosome2(1:crossoverpoint);
           chromosome2(1:crossoverpoint)=tempelement;
       end
       %变异
         for index5=1:mutationrate*populationsize
%           mutationposition=randint(1,1,[1,featurenumber]);
%           chosenchromosome=randint(1,1,[1,populationsize]);
          mutationposition=randi(featurenumber);
          chosenchromosome=randi(populationsize);
          
          character=newpopulation(chosenchromosome,mutationposition);
              if character==1
                  newpopulation(chosenchromosome,mutationposition)=0;
              else
                  newpopulation(chosenchromosome,mutationposition)=1;
              end
         end
         population=newpopulation;
end
%最后获得的结果分类
   
Accuracy=zeros(1,4);

     for index100=1:4
          triandata=train{index100};
          trianlabel=triandata(:,end);
          triandata(:,end)=[];
          testdata=test{index100};
          testlabel=testdata(:,end);
          testdata(:,end)=[];
                  temptriandata={};
                  temptestdata={};
                  tempcolnames={};
                      featurecount=0;
                       [colnum,coltxt,colnames]=xlsread('clonames.xls');
                 
for index=1:numel(testlabel)
    testlabel{index}=num2str(testlabel{index});
end

for index=1:numel(trianlabel)
    if ischar(trianlabel{index})~=1
        trianlabel{index}=num2str(trianlabel{index});
    end
end
                        triandata(:,32:end)=[];%第一个问题删除后半部分数据,并且不带用药    
                 testdata(:,32:end)=[];
                     colnames(32:end)=[];  
                       
                  for index10=1:featurenumber%准备特征
                      if historybestchromosome(index10)==1
                     
                          if ismember(index10,[2,16,17])~=1
                               temptriandata(:,featurecount+1)=cellstr(num2str(cell2mat(triandata(:,index10))));
                              temptestdata(:,featurecount+1)=cellstr(num2str(cell2mat(testdata(:,index10))));
                          else
                               temptriandata(:,featurecount+1)=triandata(:,index10);
                              temptestdata(:,featurecount+1)=testdata(:,index10);
                          end
                         
                          tempcolnames{featurecount+1}=colnames{index10};
                          featurecount=featurecount+1;
                      end
                  end
                  %此处使用SVM分类，获得准确率
                  
                   temptriandata=cell2table(temptriandata,'VariableNames', tempcolnames);
                  temptestdata=cell2table(temptestdata,'VariableNames', tempcolnames);
               model=TreeBagger(5000,temptriandata,trianlabel);
                  [Predict_label,Scores]=predict(model,temptestdata);
%               model = svmtrain(trianlabel,temptriandata, '-s 0 -t 0 -e 0.001 -m 500 -b 1');
%               [predict_label, accuracy, dec_values] =svmpredict(testlabel, temptestdata, model,'-b 1');
%               tempaccuracy(index100)=accuracy(1);
correct=0;
for index=1:numel(testlabel)
    if isequal(testlabel{index},Predict_label{index})==1
        correct=correct+1;
    end
end
accuracy=correct/numel(testlabel);

              Accuracy(index100)=accuracy;
              %计算正常和不正常样本个数
              
     end   
     result1(index00012,:)=historybestchromosome;
     result2(index00012)=historybestfitness;
end
save result1.txt -ascii result1
save result2.txt -ascii result2