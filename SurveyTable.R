library(readxl)
library(dplyr)
survey<-read_xlsx("survey.xlsx")
original_survey<-read_xlsx("survey.xlsx")
survey

glimpse(survey)

survey<- survey[,-2]
name<-survey$`Name:(first name, middle initial, last name )`
age<- survey$`Age:`
gender<-survey$`Sex:`

survey$`Education Level`<-ifelse(is.na(survey$`Education Level`), "College", survey$`Education Level`)
education_level<-survey$`Education Level`
education_level

experience<-survey$`How satisfied were you with the overall experience of ordering food through food deliveries service?`
experience<-as.data.frame(experience)
experience<-replace(experience,experience>="Satisfied",1)
experience<-replace(experience,experience>="Average",2)
experience<-replace(experience,experience>="Disatisfied",3)
experience
survey$`How satisfied were you with the overall experience of ordering food through food deliveries service?`<-experience

scale<-survey$`On a scale of 1 to 10, how would you rate the quality of the food you received?`
scale

orderarrival<-survey$`Did your order arrive within the estimated delivery time?`
orderarrival

p1<-survey$`I would find the food delivery app useful for my needs` 
p1 <- recode(p1, 
             "Strongly Agree" = 1,
             "Agree" = 2,
             "Neutral" = 3,
             "Disagree" = 4,
             "Strongly Disagree" = 5)
p1mean<-mean(p1)
p1sd<-sd(p1)
survey$`I would find the food delivery app useful for my needs`<-p1


p2 <- survey$`Using the app enables me to order food more quickly and efficiently`
p2 <- recode(p2, 
             "Strongly Agree" = 1,
             "Agree" = 2,
             "Neutral" = 3,
             "Disagree" = 4,
             "Strongly Disagree" = 5)
survey$`Using the app enables me to order food more quickly and efficiently` <- p2
p2mean<-mean(p2)
p2sd<-sd(p2)

p3 <- survey$`Using the app increases my satisfaction with the food delivery process`
p3 <- recode(p3, 
             "Strongly Agree" = 1,
             "Agree" = 2,
             "Neutral" = 3,
             "Disagree" = 4,
             "Strongly Disagree" = 5)
survey$`Using the app increases my satisfaction with the food delivery process` <- p3
p3mean<-mean(p3)
p3sd<-sd(p3)

p4 <- survey$`If I use the app, I believe it will enhance my overall dining experience`
p4 <- recode(p4, 
             "Strongly Agree" = 1,
             "Agree" = 2,
             "Neutral" = 3,
             "Disagree" = 4,
             "Strongly Disagree" = 5)
survey$`If I use the app, I believe it will enhance my overall dining experience` <- p4
p4mean<-mean(p4)
p4sd<-sd(p4)

e1<-survey$`My interaction with the app would be clear and understandable`
e1<-recode(e1, 
           "Strongly Agree" = 1,
           "Agree" = 2,
           "Neutral" = 3,
           "Disagree" = 4,
           "Strongly Disagree" = 5)
e1mean<-mean(e1)
e1sd<-sd(e1)
survey$`My interaction with the app would be clear and understandable`<-e1

e2 <- survey$`It would be easy for me to become skillful at using the app`
e2 <-  recode(e2, 
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
e2mean <- mean(e2)
e2sd <- sd(e2)
survey$`It would be easy for me to become skillful at using the app`<-e2

e3 <- survey$`I would find the app easy to navigate and use`
e3 <-  recode(e3, 
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
e3mean <- mean(e3)
e3sd <- sd(e3)
survey$`I would find the app easy to navigate and use`<-e3

e4 <- survey$`Learning to operate the app is easy for me`
e4 <-  recode(e4, 
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
e4mean <- mean(e4)
e4sd <- sd(e4)
survey$`Learning to operate the app is easy for me`<-e4

s1 <- survey$`People who influence my dining choices think that I should use the app`
s1 <-  recode(s1, 
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
s1mean <- mean(s1)
s1sd <- sd(s1)
survey$`People who influence my dining choices think that I should use the app`<-s1

s2 <- survey$`People who are important to me recommend using the food delivery app`
s2 <-  recode(s2, 
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
s2mean <- mean(s2)
s2sd <- sd(s2)
survey$`People who influence my dining choices think that I should use the app`<-s2

s3 <-survey$`Using the app helps me to put more time to other chores`
s3 <-  recode(s3,
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly agree" = 5)
s3mean <- mean(s3)
s3sd <- sd(s3)
survey$`Using the app helps me to put more time to other chores`<-s3  

s4 <- survey$`In general, the food delivery app organization has supported its use`
s4 <-  recode(s4, 
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
s4mean <- mean(s4)
s4sd <- sd(s4)
survey$`In general, the food delivery app organization has supported its use`<-s4

f1 <- survey$`I have the resources necessary to use the food delivery app`
f1 <-  recode(f1, 
              "Strongly Agreee" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
f1mean <- mean(f1)
f1sd <- sd(f1)
survey$`I have the resources necessary to use the food delivery app`<-f1

f2 <- survey$`I have the knowledge required to use the app effectively`
f2 <-  recode(f2, 
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
f2mean <- mean(f2)
f2sd <- sd(f2)
survey$`I have the knowledge required to use the app effectively`<-f2

f3 <- survey$`The app is compatible with other device I use for ordering food`
f3 <-  recode(f3, 
              "Strongly Agree" = 1,
              "Agree" = 2,
              "Neutral" = 3,
              "Disagree" = 4,
              "Strongly Disagree" = 5)
f3mean <- mean(f3)
f3sd <- sd(f3)
survey$`The app is compatible with other device I use for ordering food`<-f3

survsumtable <- data.frame(
  Variable = c("p1","p2","p3","p4","e1","e2","e3","e4","s1","s2","s3","s4","f1","f2","f3"),
  Mean = c(p1mean, p2mean, p3mean, p4mean, e1mean, e2mean, e3mean, e4mean, s1mean, s2mean, s3mean, s4mean, f1mean, f2mean, f3mean),
  SD = c(p1sd, p2sd, p3sd, p4sd, e1sd, e2sd, e3sd, e4sd, s1sd, s2sd, s3sd, s4sd, f1sd, f2sd, f3sd)
)
library(openxlsx)
survsumtable
write.xlsx(survsumtable, "survey_mean_sd_table.xlsx")


#Demographics

survey <- survey %>%
  mutate(age_group = ifelse(`Age:` <= 19, "19 and below",
                            ifelse(`Age:` == 20, "20",
                                   ifelse(`Age:` == 21, "21",
                                          ifelse(`Age:` == 22, "22", "23 and above")))))
age_counts <- table(survey$age_group)
age_counts

#Age of the people who answer the surveys 
ggplot(survey, aes(x = `Age:`, y = `Name:(first name, middle initial, last name )`, fill = `Age:`)) +
  geom_point(shape = 21, size = 3) + 
  labs(title = "Scatter Plot of Age of the People",
       x = "Age",
       y = "Name") +
  theme_minimal() +
  scale_fill_gradient(low = "blue", high = "red")
#------------------------------------------------------------------------------------------------------------------
#Educational Level of the people who answer the surveys 
EducationalLevel<- survey %>%
  group_by(`Education Level`) %>%
  summarise(count=n())

colors <- c("maroon", "pink")
pie(EducationalLevel$count, labels = EducationalLevel$count, col = colors, main = "School Level of the Surveyed People",)
legend("bottomleft", legend = EducationalLevel$`Education Level`, fill = colors, title = "School Level")
#-----------------------------------------------------------------------------------------------------------------------------------------------
#Gender of the people who answer the surveys 
Gender<- survey %>%
  group_by(survey$`Sex:`) %>%
  summarise(count=n())

colors <- c("pink","skyblue")
pie(Gender$count, labels = Gender$count, col = colors, main = "Genders of the Surveyed People",)
legend("bottomleft", legend = Gender$`survey$\`Sex:\``, fill = colors, title = "Genders")
#-------------------------------------------------------------------------------------------------------------------------------------------------
experience<-data.frame(
  survey$`Age:`,
  survey$`How satisfied were you with the overall experience of ordering food through food deliveries service?`$experience
)
colnames(experience)<-c("age","satisfaction")
satisfaction_labels <- c("1" = "Satisfied", "2" = "Average")

ggplot(experience, aes(x = factor(age), fill = factor(satisfaction))) +
  geom_bar(position = "dodge", width = 0.7) +
  labs(title = "Satisfaction per Age Group",
       x = "Age Group",
       y = "Count") +
  scale_fill_manual(name = "Satisfaction Level", 
                    values = c("1" = "purple", "2" = "green"),  
                    labels = satisfaction_labels) + 
  theme_minimal()
#-----------------------------------------------------------------------------------------------------
#scaling of the people who uses the delivery app
scale<-survey$`On a scale of 1 to 10, how would you rate the quality of the food you received?`

scaling <- data.frame(scale)
ggplot(scaling, aes(x = scale)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who use the food delivery app",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value") 
#---------------------------------------------------------------------------------------------------------------
#arrival on time
arrival<- survey %>%
  group_by(survey$`Did your order arrive within the estimated delivery time?`) %>%
  summarise(count=n())

colors <- c("pink","skyblue")
pie(Gender$count, labels = arrival$count, col = colors, main = "Surveyed People Arrived on time order",)
legend("bottomleft", legend = arrival$`survey$\`Did your order arrive within the estimated delivery time?\``, fill = colors, title = "Arrived on time")



#------------------------------------------------------------------------------------------------
#p1
p1<-survey$`I would find the food delivery app useful for my needs`
p1s <- data.frame(p1)
ggplot(p1s, aes(x = p1)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery app useful for their needs",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value") 


#p2
p2<-survey$`Using the app enables me to order food more quickly and efficiently`
p2s <- data.frame(p2)
ggplot(p2s, aes(x = p2)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who uses food delivery app that  enables them to order food more quickly and efficiently",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")

#p3
p3<-survey$`Using the app increases my satisfaction with the food delivery process`
p3s <- data.frame(p3)
ggplot(p3s, aes(x = p3)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who uses food delivery app that increases their satisfaction with the food delivery process",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")

#p4
p4<-survey$`If I use the app, I believe it will enhance my overall dining experience`
p4s <- data.frame(p4)
ggplot(p4s, aes(x = p4)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who uses food delivery app that believes that it will enhance their overall dining experience",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")
#---------------------------------------------------------------------------------------------------------------------------------------------------------------

#e1
e1<-survey$`My interaction with the app would be clear and understandable`
e1s <- data.frame(e1)
ggplot(e1s, aes(x = e1)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery app clear and understandable",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")

# e2
e2<-survey$`It would be easy for me to become skillful at using the app`
e2s <- data.frame(e2)
ggplot(e2s, aes(x = e2)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery easy for them to become skillful at using the app",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")

# e3
e3<-survey$`I would find the app easy to navigate and use`
e3s <- data.frame(e3)
ggplot(e3s, aes(x = e3)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery easy for them to navigate to use",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")

# e4
e4<-survey$`Learning to operate the app is easy for me`
e4s <- data.frame(e4)
ggplot(e4s, aes(x = e4)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery easy for them to learn and to operate",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")

#------------------------------------------------------------------------------------------------------------------------
#s1
s1<-survey$`People who influence my dining choices think that I should use the app`
s1s <- data.frame(s1)
ggplot(s1s, aes(x = s1)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who influence dining choices think that I should use the app",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")
#s2
s2<-survey$`People who are important to me recommend using the food delivery app`
s2s <- data.frame(s2)
ggplot(s2s, aes(x = s2)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of are important to me recommend using the food delivery app",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")
#s3
s3<-survey$`Using the app helps me to put more time to other chores`
s3s <- data.frame(s3)
ggplot(s3s, aes(x = s3)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who are using the app to help put more time to other chores",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")
#s4
s4<-survey$`In general, the food delivery app organization has supported its use`
s4s <- data.frame(s4)
ggplot(s4s, aes(x = s4)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery organization has supported its use",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")
#---------------------------------------------------------------------------------------------------------------------------------
#f1
f1<-survey$`I have the resources necessary to use the food delivery app`
f1s <- data.frame(f1)
ggplot(f1s, aes(x = f1)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery app as intimidating",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")
#f2
f2<-survey$`I have the knowledge required to use the app effectively`
f2s <- data.frame(f2)
ggplot(f2s, aes(x = f2)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery app as intimidating",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")
#f3
f3<-survey$`The app is compatible with other device I use for ordering food`
f3s <- data.frame(f3)

ggplot(f3s, aes(x = f3)) +
  geom_bar(fill = "blue", alpha = 0.5) + 
  labs(title = "Bar Plot of Scale Values of people who find the food delivery app as intimidating",
       x = "Scale Values",
       y = "Count") +
  scale_fill_hue(name = "Scale Value")



