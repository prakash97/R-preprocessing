library(data.table)
library(dplyr)
library(stringr)
library(ggplot2)

##Question1
df<-fread("D:/DS Training Videos/pandasdatasets/outcome-of-care-measures.csv",header=T,sep=",")
df$`Hospital 30-Day Death Mortality Rates from Heart Attack`[df$`Hospital 30-Day Death Mortality Rates from Heart Attack`=='Not Available']<-NA
df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`[df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`=='Not Available']<-NA
df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`[df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`=='Not Available']<-NA
df$`Hospital 30-Day Death Mortality Rates from Heart Attack`=as.numeric(df$`Hospital 30-Day Death Mortality Rates from Heart Attack`)
df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`=as.numeric(df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`)
df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`=as.numeric(df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`)
omit_na=na.omit(df$`Hospital 30-Day Death Mortality Rates from Heart Attack`)
df$`Hospital 30-Day Death Mortality Rates from Heart Attack`[is.na(df$`Hospital 30-Day Death Mortality Rates from Heart Attack`)]<-mean(omit_na)
head(df$`Hospital 30-Day Death Mortality Rates from Heart Attack`)
omit_na=na.omit(df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`)
df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`[is.na(df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`)]<-mean(omit_na)
head(df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`)
omit_na=na.omit(df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`)
df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`[is.na(df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`)]<-mean(omit_na)
head(df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`)

#ggplot(df) +geom_point((aes(x=`Provider Number`, y=`Hospital 30-Day Death Mortality Rates from Heart Attack`)))

##Question2
df$`Statewise Combined Moratlity Rate`=df$`Hospital 30-Day Death Mortality Rates from Heart Attack`+df$`Hospital 30-Day Death (Mortality) Rates from Heart Failure`+df$`Hospital 30-Day Death (Mortality) Rates from Pneumonia`
print(class(df$`Statewise Combined Moratlity Rate`))
groupbystate<-df %>%
  select(State,`Statewise Combined Moratlity Rate`,`Hospital Name`) %>%
  group_by(State) %>%
  arrange(State, `Statewise Combined Moratlity Rate`)  
groupbystate %>% top_n(1)

##Question3
groupbystate %>%mutate(rank = dense_rank(`Statewise Combined Moratlity Rate`))

##Question4
rankall<-df %>%
  select(`Statewise Combined Moratlity Rate`,`Hospital Name`) %>%
  arrange(`Statewise Combined Moratlity Rate`)  
rankall %>%mutate(rank = dense_rank(`Statewise Combined Moratlity Rate`))