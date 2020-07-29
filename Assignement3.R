#### Questions 1-5 are repeated from Assignement2.So started with Q-6


##Question6
l <- 1:10
l*5

##Question8
l <-c(7,3,8,2,5,9,12,78)
l<-l+2

##Question9
print(sum(l))
print(cumsum(l))

##Question10

a <-c(1, 2, -3)
b <-c(17, -12, 18)
c <-c(-1, -4, 5)
d <- a + b 
d<-d-c
d

##Question11
add<-function(x) paste(x,'.')
#s<-readline(prompt="Enter name: ")
add('prakash')

##Question12
squarelist <-list()
for (i in 1:15)
{
  squarelist<-c(squarelist,i^2)
}
print(squarelist)

##Question13
for (i in 0:9)
{
  if(i%%2==0)
    print(i^2)
  else
    print(i^3)
}