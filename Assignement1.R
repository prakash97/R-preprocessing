##Assignment1

##Question1
print(1:5)

##Question2
print(seq(22,75,2))

##Question3
s<-"RProgramming"
s_split <- strsplit(s, "")[[1]]
#print(s_split)
for(i in s_split)
  print(i)

##Question4
s<-c('Hello','World','Happy')
for(v in s)
  print(v)

for(i in seq_along(1:length(s)))
  print(s[i])

##Question5
o<- c(6, 5, 3, 8, 4, 2, 5, 4, 1)
print(sum(o))
print(cumsum(o))

##Question6
S1<-c(7,14,21,28,35,42,49,56,63,70,77,84)
result=list()
for(i in seq_along(1:length(S1)))
{
  if(i%%2==0)
  {
    result=c(result,S1[i])
    S1=S1[-i]

  }
  
}
print(S1)
print(result)

##Question7
a=list('hello','world','barbie','hello')
b=list('hello','barbie','hai')
c=list(a,b)
d=list()
for(i in seq_along(1:length(c)))
{
  for(j in seq_along(1:length(c[[i]])))
  {d=c(d,c[[i]][[j]])
  }
}
print(table(e))
