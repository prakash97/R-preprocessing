df<-read.csv("D:/DS Training Videos/pandasdatasets/FlightDelays.csv",header=T,sep=",")
##Question1
print(dim(df[df$Flight.Status=="delayed" & df$DAY_WEEK>0 & df$DAY_WEEK<6,])[1])

##Question2
fridaydelayedflights=df$DISTANCE[df$DAY_WEEK==4 & df$Flight.Status=="delayed",]
mean(unlist(fridaydelayedflights$DISTANCE, use.names=FALSE))
sum(unlist(fridaydelayedflights$DISTANCE, use.names=FALSE))
length(unlist(fridaydelayedflights$DISTANCE, use.names=FALSE))

##Question3
ontimeflights_weekday=df[df$DAY_WEEK>0 & df$DAY_WEEK<6 & df$Flight.Status=="ontime",]
print(dim(ontimeflights_weekday)[1])
ontimeflights_weekend=df[df$DAY_WEEK==0 | df$DAY_WEEK==6 & df$Flight.Status=="ontime",]
print(dim(ontimeflights_weekend)[1])

##Question4
library(dplyr)
res <- df %>%
  select(DAY_WEEK,DEST) %>%
  filter(DAY_WEEK>0 & DAY_WEEK<6 ) %>%
  group_by(DEST)
print(res)

##Question5
print(dim(df[df$Weather==0 & df$DAY_WEEK>0 & df$DAY_WEEK<6 ,])[1])

##Question6
library(lubridate)

df$FL_DATE<-mdy(df$FL_DATE)
print(class(df$FL_DATE))

##Question7
for (col in colnames(df))
{
  if(is.character(class(df[col])))
    df[col]<-apply(df[col],2,function(x)
      {if (grepl("\\d{4}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])", x)) 
        {
           print(as.Date(x))
      }}
)
}
print(class(df$FL_DATE))