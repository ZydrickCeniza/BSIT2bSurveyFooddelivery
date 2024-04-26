library(readxl)
library(dplyr)
survey<-read_xlsx("survey.xlsx")
original_survey<-read_xlsx("survey.xlsx")
survey
View(survey)
glimpse(survey)


name<-survey$`Name:(first name, middle initial, last name )`
age<- survey$`Age:`
gender<-survey$`Sex:`
education_level<-survey$`Education Level`

experience<-survey$`How satisfied were you with the overall experience of ordering food through food deliveries service?`
experience<-as.data.frame(experience)
experience<-replace(experience,experience>="Satisfied",1)
experience<-replace(experience,experience>="Average",3)
experience<-replace(experience,experience>="Disatisfied",2)
experience

scale<-survey$`On a scale of 1 to 10, how would you rate the quality of the food you received?`
scale

oderarrival<-survey$`Did your order arrive within the estimated delivery time?`

p1<-survey$`I would find the food delivery app useful for my needs`
p1<-as.data.frame(p1)
p1<-replace(p1,p1>="Strongly Disagree",1)
p1<-replace(p1,p1>="Disagree",2)
p1<-replace(p1,p1>="Neutral",3)
p1<-replace(p1,p1>="Agree",4)
p1<-replace(p1,p1>="Strongly Agree",5)
p1<-as.numeric(p1$p1)
p1mean<-mean(p1)
p1sd<-sd(p1)

p2<-survey$`Using the app enables me to order food more quickly and efficiently`
p2<-as.data.frame(p2)
p2<-replace(p2,p2>="Strongly Disagree",1)
p2<-replace(p2,p2>="Disagree",2)
p2<-replace(p2,p2>="Neutral",3)
p2<-replace(p2,p2>="Agree",4)
p2<-replace(p2,p2>="Strongly Agree",5)
p2<-as.numeric(p2$p2)
p2mean<-mean(p2)
p2sd<-sd(p2)

p3<-survey$`Using the app increases my satisfaction with the food delivery process`
p3<-as.data.frame(p3)
p3<-replace(p3,p3>="Strongly Disagree",1)
p3<-replace(p3,p3>="Disagree",2)
p3<-replace(p3,p3>="Neutral",3)
p3<-replace(p3,p3>="Agree",4)
p3<-replace(p3,p3>="Strongly Agree",5)
p3<-as.numeric(p3$p3)
p3mean<-mean(p3)
p3sd<-sd(p3)

p4<-survey$`If I use the app, I believe it will enhance my overall dining experience`
p4<-as.data.frame(p4)
p4<-replace(p4,p4>="Strongly Disagree",1)
p4<-replace(p4,p4>="Disagree",2)
p4<-replace(p4,p4>="Neutral",3)
p4<-replace(p4,p4>="Agree",4)
p4<-replace(p4,p4>="Strongly Agree",5)
p4<-as.numeric(p4$p4)
p4mean<-mean(p4)
p4sd<-sd(p4)

e1<-survey$`My interaction with the app would be clear and understandable`
e1<-as.data.frame(e1)
e1<-replace(e1,e1>="Strongly Disagree",1)
e1<-replace(e1,e1>="Disagree",2)
e1<-replace(e1,e1>="Neutral",3)
e1<-replace(e1,e1>="Agree",4)
e1<-replace(e1,e1>="Strongly Agree",5)
e1<-as.numeric(e1$e1)
e1mean<-mean(e1)
e1sd<-sd(e1)

e2 <- survey$`It would be easy for me to become skillful at using the app`
e2 <- as.data.frame(e2)
e2 <- replace(e2, e2 >= "Strongly Disagree", 1)
e2 <- replace(e2, e2 >= "Disagree", 2)
e2 <- replace(e2, e2 >= "Neutral", 3)
e2 <- replace(e2, e2 >= "Agree", 4)
e2 <- replace(e2, e2 >= "Strongly Agree", 5)
e2 <- as.numeric(e2$e2)
e2mean <- mean(e2)
e2sd <- sd(e2)

e3 <- survey$`I would find the app easy to navigate and use`
e3 <- as.data.frame(e3)
e3 <- replace(e3, e3 >= "Strongly Disagree", 1)
e3 <- replace(e3, e3 >= "Disagree", 2)
e3 <- replace(e3, e3 >= "Neutral", 3)
e3 <- replace(e3, e3 >= "Agree", 4)
e3 <- replace(e3, e3 >= "Strongly Agree", 5)
e3 <- as.numeric(e3$e3)
e3mean <- mean(e3)
e3sd <- sd(e3)

e4 <- survey$`Learning to operate the app is easy for me`
e4 <- as.data.frame(e4)
e4 <- replace(e4, e4 >= "Strongly Disagree", 1)
e4 <- replace(e4, e4 >= "Disagree", 2)
e4 <- replace(e4, e4 >= "Neutral", 3)
e4 <- replace(e4, e4 >= "Agree", 4)
e4 <- replace(e4, e4 >= "Strongly Agree", 5)
e4 <- as.numeric(e4$e4)
e4mean <- mean(e4)
e4sd <- sd(e4)

s1 <- survey$`People who influence my dining choices think that I should use the app`
s1 <- as.data.frame(s1)
s1 <- replace(s1, s1 >= "Strongly Disagree", 1)
s1 <- replace(s1, s1 >= "Disagree", 2)
s1 <- replace(s1, s1 >= "Neutral", 3)
s1 <- replace(s1, s1 >= "Agree", 4)
s1 <- replace(s1, s1 >= "Strongly Agree", 5)
s1 <- as.numeric(s1$s1)
s1mean <- mean(s1)
s1sd <- sd(s1)

s2 <- survey$`People who are important to me recommend using the food delivery app`
s2 <- as.data.frame(s2)
s2 <- replace(s2, s2 >= "Strongly Disagree", 1)
s2 <- replace(s2, s2 >= "Disagree", 2)
s2 <- replace(s2, s2 >= "Neutral", 3)
s2 <- replace(s2, s2 >= "Agree", 4)
s2 <- replace(s2, s2 >= "Strongly Agree", 5)
s2 <- as.numeric(s2$s2)
s2mean <- mean(s2)
s2sd <- sd(s2)

s3 <- survey$`Using the app helps me to put more time to other chores`
s3 <- as.data.frame(s3)
s3 <- replace(s3, s3 >= "Strongly Disagree", 1)
s3 <- replace(s3, s3 >= "Disagree", 2)
s3 <- replace(s3, s3 >= "Neutral", 3)
s3 <- replace(s3, s3 >= "Agree", 4)
s3 <- replace(s3, s3 >= "Strongly Agree", 5)
s3 <- as.numeric(s3$s3)
s3mean <- mean(s3)
s3sd <- sd(s3)

s4 <- survey$`In general, the food delivery app organization has supported its use`
s4 <- as.data.frame(s4)
s4 <- replace(s4, s4 >= "Strongly Disagree", 1)
s4 <- replace(s4, s4 >= "Disagree", 2)
s4 <- replace(s4, s4 >= "Neutral", 3)
s4 <- replace(s4, s4 >= "Agree", 4)
s4 <- replace(s4, s4 >= "Strongly Agree", 5)
s4 <- as.numeric(s4$s4)
s4mean <- mean(s4)
s4sd <- sd(s4)

f1 <- survey$`I have the resources necessary to use the food delivery app`
f1 <- as.data.frame(f1)
f1 <- replace(f1, f1 >= "Strongly Disagree", 1)
f1 <- replace(f1, f1 >= "Disagree", 2)
f1 <- replace(f1, f1 >= "Neutral", 3)
f1 <- replace(f1, f1 >= "Agree", 4)
f1 <- replace(f1, f1 >= "Strongly Agree", 5)
f1 <- as.numeric(f1$f1)
f1mean <- mean(f1)
f1sd <- sd(f1)

f2 <- survey$`I have the knowledge required to use the app effectively`
f2 <- as.data.frame(f2)
f2 <- replace(f2, f2 >= "Strongly Disagree", 1)
f2 <- replace(f2, f2 >= "Disagree", 2)
f2 <- replace(f2, f2 >= "Neutral", 3)
f2 <- replace(f2, f2 >= "Agree", 4)
f2 <- replace(f2, f2 >= "Strongly Agree", 5)
f2 <- as.numeric(f2$f2)
f2mean <- mean(f2)
f2sd <- sd(f2)

f3 <- survey$`The app is compatible with other device I use for ordering food`
f3 <- as.data.frame(f3)
f3 <- replace(f3, f3 >= "Strongly Disagree", 1)
f3 <- replace(f3, f3 >= "Disagree", 2)
f3 <- replace(f3, f3 >= "Neutral", 3)
f3 <- replace(f3, f3 >= "Agree", 4)
f3 <- replace(f3, f3 >= "Strongly Agree", 5)
f3 <- as.numeric(f3$f3)
f3mean <- mean(f3)
f3sd <- sd(f3)

survsumtable <- data.frame(
  Variable = c("p1","p2","p3","p4","e1","e2","e3","e4","s1","s2","s3","s4","f1","f2","f3"),
  Mean = c(p1mean, p2mean, p3mean, p4mean, e1mean, e2mean, e3mean, e4mean, s1mean, s2mean, s3mean, s4mean, f1mean, f2mean, f3mean),
  SD = c(p1sd, p2sd, p3sd, p4sd, e1sd, e2sd, e3sd, e4sd, s1sd, s2sd, s3sd, s4sd, f1sd, f2sd, f3sd)
)

survsumtable



