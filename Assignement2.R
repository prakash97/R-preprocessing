
##Question1
num = as.integer(readline(prompt="Enter a number: "))
flag = 0
if(num > 1) {
  flag = 1
  for(i in 2:(num-1)) {
    if ((num %% i) == 0) {
      flag = 0
      break
    }
  }
} 
if(num == 2)    flag = 1
if(flag == 1) {
  print(paste(num,"is a prime number"))
} else {
  print(paste(num,"is not a prime number"))
}

##Question2
cube <-function(x)
{
  return (x^3)
}
cube(78)

##Question3
power<-function(x)
{
 if (log(x, base = 3)==round(log(x,base=3)))
     print("true")
     else
       print("false")
}
power(23)

##Question4
factorial <-function(x)
{
  if (x==1||x==0)
    return (1);
  return (x*factorial(x-1));
}
factorial(6)

##Question5
maxnumber<-function(a,b,c)
{ max=a;
  if(b>a)
    max=b;
  if(c>b && c>a)
    max=c;
  return (max);
}
maxnumber(1,5,10)

##Question6
D <-"I felt happy because I saw the others were happy and because I knew I should feel happy, but I was not really happy"
D
s<-strsplit(D," ")[[1]]
s
print(table(s))

##Question7&9
sum<-0
count<-0
for(i in 555:1111)
{
  if(i%%7==0)
  {
    sum=sum+i
  count=count+1
  }
}
print(sum)
print(count)

##Question8
for(i in 1:30)
{
  if(sqrt(i)==round(sqrt(i)))
    print(i)
}

##Question10
for(i in 110:130)
{
  if(i==124)
    print("124 is found")
  else
    print(i)
}

##Question11
for(i in 1:10)
{
  if(i==6)
    break
  else
    print(i)
}

##Question12
for(i in 1:20)
{
  if(i%%5!=0)
    print(i)
    
}

##Question13
print(length(1111))
lis <- c(234, 45, 4, 44, 454, 32445)
for (i in lis)
{
  if(nchar(i)>=3)
    print(i)
}