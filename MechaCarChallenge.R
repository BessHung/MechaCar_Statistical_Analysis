library(dplyr) 
library(tidyr)
library(ggplot2)

#Deliverable -1
#import csv files
mecha_car <- read.csv("Resources/MechaCar_mpg.csv",stringsAsFactors = F,check.name=F)
head(mecha_car)
#generate multiple linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_car)
#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_car))


#Deliverable -2
suspension_coil <- read.csv("Resources/Suspension_Coil.csv",check.names = F,stringsAsFactors = F)
head(suspension_coil)

#create summary table for PSI data
total_summary <-suspension_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

#create lot_summary table for PSI data
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

#charts
#import dataset into ggplot2
plt <- ggplot(suspension_coil,aes(x=Manufacturing_Lot,y=PSI))
#add boxplot with labels rotated 45 degrees
plt + geom_boxplot()


#Deliverable -3
#create table for each lot
Lot1_table <- subset(suspension_coil, Manufacturing_Lot == 'Lot1')
Lot2_table <- subset(suspension_coil, Manufacturing_Lot == 'Lot2')
Lot3_table <- subset(suspension_coil, Manufacturing_Lot == 'Lot3')
#apply t.test for each lot
t.test(Lot1_table$PSI,mu=1500)
t.test(Lot2_table$PSI,mu=1500)
t.test(Lot3_table$PSI,mu=1500)



