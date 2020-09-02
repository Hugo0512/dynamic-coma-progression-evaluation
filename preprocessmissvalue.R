setwd("F:/程序文件/matlab/XW5清醒");
library("missForest")
library("caret")
library("mlbench")
library("lattice")
library("rpart")
library("adabag") #调入函数包
library("foreach")
library("doParallel")
library("iterators")
library("parallel") #调入函数包
library("gdata")
library("WriteXLS")
perlx<-"H:\\perl\\perl\\bin\\perl.exe"
data1<-read.xls("preprocessedprospective0.xls",na.strings=c("NA","#DIV/0!"),verbose = TRUE,header=F,perl=perlx)

#data1 <- as.factor(data1)
#data1=apply(data1,2,factor)
str(data1)
data1$V2=as.numeric(data1$V2)
data1$V16=as.numeric(data1$V16)
data1$V17=as.numeric(data1$V17)


data1$V40=as.numeric(data1$V40)
data1$V41=as.numeric(data1$V41)
data1$V42=as.numeric(data1$V42)
data1$V43=as.numeric(data1$V43)
data1$V44=as.numeric(data1$V44)
data1$V45=as.numeric(data1$V45)
data1$V46=as.numeric(data1$V46)


data1$V1=as.factor(data1$V1)
data1$V3=as.factor(data1$V3)
data1$V4=as.factor(data1$V4)
data1$V5=as.factor(data1$V5)
data1$V6=as.factor(data1$V6)
data1$V7=as.factor(data1$V7)
data1$V8=as.factor(data1$V8)
data1$V9=as.factor(data1$V9)
data1$V10=as.factor(data1$V10)
data1$V11=as.factor(data1$V11)
data1$V12=as.factor(data1$V12)
data1$V15=as.factor(data1$V15)
data1$V18=as.factor(data1$V18)
data1$V13=as.factor(data1$V13)
data1$V14=as.factor(data1$V14)
data1$V19=as.factor(data1$V19)
data1$V20=as.factor(data1$V20)
data1$V21=as.factor(data1$V21)
data1$V22=as.factor(data1$V22)
data1$V23=as.factor(data1$V23)
data1$V24=as.factor(data1$V24)
data1$V25=as.factor(data1$V25)
data1$V26=as.factor(data1$V26)
data1$V27=as.factor(data1$V27)
data1$V28=as.factor(data1$V28)
data1$V29=as.factor(data1$V29)
data1$V30=as.factor(data1$V30)
data1$V31=as.factor(data1$V31)


data1$V32=as.factor(data1$V32)
data1$V33=as.factor(data1$V33)
data1$V34=as.factor(data1$V34)
data1$V35=as.factor(data1$V35)
data1$V36=as.factor(data1$V36)
data1$V37=as.factor(data1$V37)
data1$V38=as.factor(data1$V38)
data1$V39=as.factor(data1$V39)



str(data1)
data1 <- missForest(data1)
#第41列四舍五入，因为是T
a=data1$ximp

a[,41]=round(a[,41])#下标从1开始
WriteXLS(a,"prospectivemissforest0.xls") 