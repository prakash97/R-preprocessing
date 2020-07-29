library(data.table)
library(dplyr)
library(stringr)
library(ggplot2)
##Question1
airfares<-fread("D:/DS Training Videos/pandasdatasets/Airfares.csv",header=T,sep=",")
#df1<-read.csv("D:/DS Training Videos/pandasdatasets/Airfares.csv",header=T,sep=",")

##Question2
print(dim(airfares))
print(sapply(airfares,class))
#print(sapply(df,typeof))
#print(lapply(df,typeof))

##Question3

sum(sapply(airfares,function(x)sum(x=='*')))

missingrows<-airfares %>%
  select(everything()) %>%
  filter_all(any_vars(. =='*')) %>%
  count()
print(dim(airfares)[1]-missingrows[1])

##Question4
airfares[airfares=='*']<-"Missing Value"
air<-head(airfares)
for(i in names(airfares))
{#print(i)
  #air[[i]]<-gsub("[^[:alnum:]]", "", air[[i]])
  airfares[[i]]<-str_replace(airfares[[i]],"[$]","")
  airfares[[i]]<-str_replace(airfares[[i]],"[,]","")
}
airfares
airfares$E_INCOME<-as.integer(airfares$E_INCOME)
airfares$S_INCOME<-as.integer(airfares$S_INCOME)
airfares$FARE<-as.numeric(airfares$FARE)

##Question5
vacation_mean <-airfares %>%
             select(everything()) %>%
             group_by(VACATION) %>%
             summarise(mean=mean(FARE))
vacation_mean
vacation_mean_DT <- airfares[,
               .(avg=mean(FARE),.N),
               by = VACATION]
vacation_mean_DT

##Question6
air$S_CITY_NAME<-str_split(air$S_CITY," ")
air$S_CITY_NAME
for(i in 1:length(airfares$S_CITY))
  {
  airfares$S_CITY_NAME[i]<-str_split(airfares$S_CITY[i]," ")[[1]][1]
  airfares$S_STATE_NAME[i]<-str_split(airfares$S_CITY[i]," ")[[1]][length(airfares$S_CITY[[1]])]
}

##Question7
slot_mean <-airfares %>%
  select(everything()) %>%
  group_by(SLOT) %>%
  summarise(mean=mean(FARE))
slot_mean

##Question8
gate_mean <-airfares %>%
  select(everything()) %>%
  group_by(GATE) %>%
  summarise(mean=mean(FARE))
gate_mean

##Question9
city_mean<-airfares %>%
  select(everything()) %>%
  group_by(S_CITY,E_CITY) %>%
  summarise(mean=mean(FARE))
scity_mean<-airfares %>%
  select(everything()) %>%
  group_by(S_CITY) %>%
  summarise(mean=mean(FARE))
ecity_mean<-airfares %>%
  select(everything()) %>%
  group_by(E_CITY) %>%
  summarise(mean=mean(FARE))
city_mean
scity_mean
ecity_mean

##Question10
#cut(airfares$S_INCOME,10)
#cut(airfares$E_INCOME,10)

##Question11
S_INCOME_IQR<-airfares$S_INCOME[5]-airfares$S_INCOME[2]
S_INCOME_LB<-airfares$S_INCOME[2]-1.5*(S_INCOME_IQR)
S_INCOME_UB<-airfares$S_INCOME[5]+1.5*(S_INCOME_IQR)
outlier<-airfares %>%
        select(S_INCOME) %>%
        filter(S_INCOME<S_INCOME_LB  & S_INCOME>S_INCOME_UB) %>%
        count()   
outlier
## Same is repeated for all numeric columns