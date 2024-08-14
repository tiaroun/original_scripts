###### Script for Hung Behavioral Data #####
### Fig 1B for Kucyi, A., Anderson, N., Bounyarith, T., et al. (2024) Net. Neuro.
## Written by Tiara Bounyarith ##
# Last updated: 12pm 09/06/2023 #

##### Set Up #####

#importing packages
library(dplyr)
library(ggplot2)
library(base)
library(stats)
library(stringr)
library(tibble)
library(tidyr)
library(data.table)
library(tidyverse)

#setting working directory
setwd("~/Desktop/BehavHungData/")

##### MW01 #####

###session 1 run 1 ###
#reading in text file from Session 1 Run 1 of MW01 as a data table
MW01sess1run1 <- read.table("MW01/Session1_run1.txt", header = F)

#adding column names 
colnames(MW01sess1run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess1run1$null <- NULL
 
#labeling each row with subject number, session, and run
MW01sess1run1 <- data.frame(sub = rep("MW01", nrow(MW01sess1run1)),
                              session = rep("1", nrow(MW01sess1run1)),
                              run = rep("1", nrow(MW01sess1run1)),
                            MW01sess1run1) 



###session 1 run 2###

#reading in text file from Session 1 Run 2 of MW01 as a data table
MW01sess1run2 <- read.table("MW01/Session1_run2.txt", header = F)

#adding column names 
colnames(MW01sess1run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess1run2$null <- NULL

#labeling each row with subject number, session, and run
MW01sess1run2 <- data.frame(sub = rep("MW01", nrow(MW01sess1run2)),
                            session = rep("1", nrow(MW01sess1run2)),
                            run = rep("2", nrow(MW01sess1run2)),
                            MW01sess1run2) 


###session 1 run 3###

#reading in text file from Session 1 Run 3 of MW01 as a data table
MW01sess1run3 <- read.table("MW01/Session1_run3.txt", header = F)

#adding column names 
colnames(MW01sess1run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess1run3$null <- NULL

#labeling each row with subject number, session, and run
MW01sess1run3 <- data.frame(sub = rep("MW01", nrow(MW01sess1run3)),
                            session = rep("1", nrow(MW01sess1run3)),
                            run = rep("3", nrow(MW01sess1run3)),
                            MW01sess1run3) 



###session 1 run 4###

#reading in text file from Session 1 Run 4 of MW01 as a data table
MW01sess1run4 <- read.table("MW01/Session1_run4.txt", header = F)

#adding column names 
colnames(MW01sess1run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess1run4$null <- NULL

#labeling each row with subject number, session, and run
MW01sess1run4 <- data.frame(sub = rep("MW01", nrow(MW01sess1run4)),
                            session = rep("1", nrow(MW01sess1run4)),
                            run = rep("4", nrow(MW01sess1run4)),
                            MW01sess1run4) 



###session 1 run 5###

#reading in text file from Session 1 Run 5 of MW01 as a data table
MW01sess1run5 <- read.table("MW01/Session1_run5.txt", header = F)

#adding column names 
colnames(MW01sess1run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess1run5$null <- NULL

#labeling each row with subject number, session, and run
MW01sess1run5 <- data.frame(sub = rep("MW01", nrow(MW01sess1run5)),
                            session = rep("1", nrow(MW01sess1run5)),
                            run = rep("5", nrow(MW01sess1run5)),
                            MW01sess1run5) 




###session 1 run 6###

#reading in text file from Session 1 Run 6 of MW01 as a data table
MW01sess1run6 <- read.table("MW01/Session1_run6.txt", header = F)

#adding column names 
colnames(MW01sess1run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess1run6$null <- NULL

#labeling each row with subject number, session, and run
MW01sess1run6 <- data.frame(sub = rep("MW01", nrow(MW01sess1run6)),
                            session = rep("1", nrow(MW01sess1run6)),
                            run = rep("6", nrow(MW01sess1run6)),
                            MW01sess1run6) 



###session 1 run 7###

#reading in text file from Session 1 Run 7 of MW01 as a data table
MW01sess1run7 <- read.table("MW01/Session1_run7.txt", header = F)

#adding column names 
colnames(MW01sess1run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess1run7$null <- NULL

#labeling each row with subject number, session, and run
MW01sess1run7 <- data.frame(sub = rep("MW01", nrow(MW01sess1run7)),
                            session = rep("1", nrow(MW01sess1run7)),
                            run = rep("7", nrow(MW01sess1run7)),
                            MW01sess1run7) 




###session 2 run 1###

#reading in text file from Session 2 Run 1 of MW01 as a data table
MW01sess2run1 <- read.table("MW01/Session2_run1.txt", header = F)

#adding column names 
colnames(MW01sess2run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run1$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run1 <- data.frame(sub = rep("MW01", nrow(MW01sess2run1)),
                            session = rep("2", nrow(MW01sess2run1)),
                            run = rep("1", nrow(MW01sess2run1)),
                            MW01sess2run1) 



###session 2 run 2###

#reading in text file from Session 2 Run 2 of MW01 as a data table
MW01sess2run2 <- read.table("MW01/Session2_run2.txt", header = F)

#adding column names 
colnames(MW01sess2run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run2$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run2 <- data.frame(sub = rep("MW01", nrow(MW01sess2run2)),
                            session = rep("2", nrow(MW01sess2run2)),
                            run = rep("2", nrow(MW01sess2run2)),
                            MW01sess2run2) 




###session 2 run 3###

#reading in text file from Session 2 run 3 of MW01 as a data table
MW01sess2run3 <- read.table("MW01/Session2_run3.txt", header = F)

#adding column names 
colnames(MW01sess2run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run3$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run3 <- data.frame(sub = rep("MW01", nrow(MW01sess2run3)),
                            session = rep("2", nrow(MW01sess2run3)),
                            run = rep("3", nrow(MW01sess2run3)),
                            MW01sess2run3) 



###session 2 run 4###

#reading in text file from Session 2 run 4 of MW01 as a data table
MW01sess2run4 <- read.table("MW01/Session2_run4.txt", header = F)

#adding column names 
colnames(MW01sess2run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run4$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run4 <- data.frame(sub = rep("MW01", nrow(MW01sess2run4)),
                            session = rep("2", nrow(MW01sess2run4)),
                            run = rep("4", nrow(MW01sess2run4)),
                            MW01sess2run4) 




###session 2 run 5###

#reading in text file from Session 2 run 5 of MW01 as a data table
MW01sess2run5 <- read.table("MW01/Session2_run5.txt", header = F)

#adding column names 
colnames(MW01sess2run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run5$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run5 <- data.frame(sub = rep("MW01", nrow(MW01sess2run5)),
                            session = rep("2", nrow(MW01sess2run5)),
                            run = rep("5", nrow(MW01sess2run5)),
                            MW01sess2run5) 





###session 2 run 6###

#reading in text file from Session 2 run 6 of MW01 as a data table
MW01sess2run6 <- read.table("MW01/Session2_run6.txt", header = F)

#adding column names 
colnames(MW01sess2run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run6$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run6 <- data.frame(sub = rep("MW01", nrow(MW01sess2run6)),
                            session = rep("2", nrow(MW01sess2run6)),
                            run = rep("6", nrow(MW01sess2run6)),
                            MW01sess2run6) 




###session 2 run 7###

#reading in text file from Session 2 run 7 of MW01 as a data table
MW01sess2run7 <- read.table("MW01/Session2_run7.txt", header = F)

#adding column names 
colnames(MW01sess2run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run7$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run7 <- data.frame(sub = rep("MW01", nrow(MW01sess2run7)),
                            session = rep("2", nrow(MW01sess2run7)),
                            run = rep("7", nrow(MW01sess2run7)),
                            MW01sess2run7) 





###session 2 run 8###

#reading in text file from Session 2 run 8 of MW01 as a data table
MW01sess2run8 <- read.table("MW01/Session2_run8.txt", header = F)

#adding column names 
colnames(MW01sess2run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run8$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run8 <- data.frame(sub = rep("MW01", nrow(MW01sess2run8)),
                            session = rep("2", nrow(MW01sess2run8)),
                            run = rep("8", nrow(MW01sess2run8)),
                            MW01sess2run8) 




###session 2 run 9###

#reading in text file from Session 2 run 9 of MW01 as a data table
MW01sess2run9 <- read.table("MW01/Session2_run9.txt", header = F)

#adding column names 
colnames(MW01sess2run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess2run9$null <- NULL

#labeling each row with subject number, session, and run
MW01sess2run9 <- data.frame(sub = rep("MW01", nrow(MW01sess2run9)),
                            session = rep("2", nrow(MW01sess2run9)),
                            run = rep("9", nrow(MW01sess2run9)),
                            MW01sess2run9) 




###session 3 run 1###

#reading in text file from Session 3 run 1 of MW01 as a data table
MW01sess3run1 <- read.table("MW01/Session3_run1.txt", header = F)

#adding column names 
colnames(MW01sess3run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run1$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run1 <- data.frame(sub = rep("MW01", nrow(MW01sess3run1)),
                            session = rep("3", nrow(MW01sess3run1)),
                            run = rep("1", nrow(MW01sess3run1)),
                            MW01sess3run1) 




###session 3 run 2###

#reading in text file from Session 3 run 2 of MW01 as a data table
MW01sess3run2 <- read.table("MW01/Session3_run2.txt", header = F)

#adding column names 
colnames(MW01sess3run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run2$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run2 <- data.frame(sub = rep("MW01", nrow(MW01sess3run2)),
                            session = rep("3", nrow(MW01sess3run2)),
                            run = rep("2", nrow(MW01sess3run2)),
                            MW01sess3run2) 




###session 3 run 3###

#reading in text file from Session 3 run 3 of MW01 as a data table
MW01sess3run3 <- read.table("MW01/Session3_run3.txt", header = F)

#adding column names 
colnames(MW01sess3run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run3$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run3 <- data.frame(sub = rep("MW01", nrow(MW01sess3run3)),
                            session = rep("3", nrow(MW01sess3run3)),
                            run = rep("3", nrow(MW01sess3run3)),
                            MW01sess3run3) 





###session 3 run 4###

#reading in text file from Session 3 run 4 of MW01 as a data table
MW01sess3run4 <- read.table("MW01/Session3_run4.txt", header = F)

#adding column names 
colnames(MW01sess3run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run4$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run4 <- data.frame(sub = rep("MW01", nrow(MW01sess3run4)),
                            session = rep("3", nrow(MW01sess3run4)),
                            run = rep("4", nrow(MW01sess3run4)),
                            MW01sess3run4) 





###session 3 run 5###

#reading in text file from Session 3 run 5 of MW01 as a data table
MW01sess3run5 <- read.table("MW01/Session3_run5.txt", header = F)

#adding column names 
colnames(MW01sess3run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run5$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run5 <- data.frame(sub = rep("MW01", nrow(MW01sess3run5)),
                            session = rep("3", nrow(MW01sess3run5)),
                            run = rep("5", nrow(MW01sess3run5)),
                            MW01sess3run5) 




###session 3 run 6###

#reading in text file from Session 3 run 6 of MW01 as a data table
MW01sess3run6 <- read.table("MW01/Session3_run6.txt", header = F)

#adding column names 
colnames(MW01sess3run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run6$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run6 <- data.frame(sub = rep("MW01", nrow(MW01sess3run6)),
                            session = rep("3", nrow(MW01sess3run6)),
                            run = rep("6", nrow(MW01sess3run6)),
                            MW01sess3run6) 





###session 3 run 7###

#reading in text file from Session 3 run 7 of MW01 as a data table
MW01sess3run7 <- read.table("MW01/Session3_run7.txt", header = F)

#adding column names 
colnames(MW01sess3run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run7$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run7 <- data.frame(sub = rep("MW01", nrow(MW01sess3run7)),
                            session = rep("3", nrow(MW01sess3run7)),
                            run = rep("7", nrow(MW01sess3run7)),
                            MW01sess3run7) 




###session 3 run 8###

#reading in text file from Session 3 run 8 of MW01 as a data table
MW01sess3run8 <- read.table("MW01/Session3_run8.txt", header = F)

#adding column names 
colnames(MW01sess3run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run8$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run8 <- data.frame(sub = rep("MW01", nrow(MW01sess3run8)),
                            session = rep("3", nrow(MW01sess3run8)),
                            run = rep("8", nrow(MW01sess3run8)),
                            MW01sess3run8) 





###session 3 run 9###

#reading in text file from Session 3 run 9 of MW01 as a data table
MW01sess3run9 <- read.table("MW01/Session3_run9.txt", header = F)

#adding column names 
colnames(MW01sess3run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run9$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run9 <- data.frame(sub = rep("MW01", nrow(MW01sess3run9)),
                            session = rep("3", nrow(MW01sess3run9)),
                            run = rep("9", nrow(MW01sess3run9)),
                            MW01sess3run9) 




###session 3 run 10###

#reading in text file from Session 3 run 10 of MW01 as a data table
MW01sess3run10 <- read.table("MW01/Session3_run10.txt", header = F)

#adding column names 
colnames(MW01sess3run10) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess3run10$null <- NULL

#labeling each row with subject number, session, and run
MW01sess3run10 <- data.frame(sub = rep("MW01", nrow(MW01sess3run10)),
                             session = rep("3", nrow(MW01sess3run10)),
                             run = rep("10", nrow(MW01sess3run10)),
                             MW01sess3run10) 





###session 4 run 1###

#reading in text file from Session 4 run 1 of MW01 as a data table
MW01sess4run1 <- read.table("MW01/Session4_run1.txt", header = F)

#adding column names 
colnames(MW01sess4run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run1$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run1 <- data.frame(sub = rep("MW01", nrow(MW01sess4run1)),
                            session = rep("4", nrow(MW01sess4run1)),
                            run = rep("1", nrow(MW01sess4run1)),
                            MW01sess4run1) 




###session 4 run 2###

#reading in text file from Session 4 run 2 of MW01 as a data table
MW01sess4run2 <- read.table("MW01/Session4_run2.txt", header = F)

#adding column names 
colnames(MW01sess4run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run2$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run2 <- data.frame(sub = rep("MW01", nrow(MW01sess4run2)),
                            session = rep("4", nrow(MW01sess4run2)),
                            run = rep("2", nrow(MW01sess4run2)),
                            MW01sess4run2) 



###session 4 run 3###

#reading in text file from Session 4 run 3 of MW01 as a data table
MW01sess4run3 <- read.table("MW01/Session4_run3.txt", header = F)

#adding column names 
colnames(MW01sess4run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run3$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run3 <- data.frame(sub = rep("MW01", nrow(MW01sess4run3)),
                            session = rep("4", nrow(MW01sess4run3)),
                            run = rep("3", nrow(MW01sess4run3)),
                            MW01sess4run3) 




###session 4 run 4###

#reading in text file from Session 4 run 4 of MW01 as a data table
MW01sess4run4 <- read.table("MW01/Session4_run4.txt", header = F)

#adding column names 
colnames(MW01sess4run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run4$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run4 <- data.frame(sub = rep("MW01", nrow(MW01sess4run4)),
                            session = rep("4", nrow(MW01sess4run4)),
                            run = rep("4", nrow(MW01sess4run4)),
                            MW01sess4run4) 




###session 4 run 5###

#reading in text file from Session 4 run 5 of MW01 as a data table
MW01sess4run5 <- read.table("MW01/Session4_run5.txt", header = F)

#adding column names 
colnames(MW01sess4run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run5$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run5 <- data.frame(sub = rep("MW01", nrow(MW01sess4run5)),
                            session = rep("4", nrow(MW01sess4run5)),
                            run = rep("5", nrow(MW01sess4run5)),
                            MW01sess4run5) 




###session 4 run 6###

#reading in text file from Session 4 run 6 of MW01 as a data table
MW01sess4run6 <- read.table("MW01/Session4_run6.txt", header = F)

#adding column names 
colnames(MW01sess4run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run6$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run6 <- data.frame(sub = rep("MW01", nrow(MW01sess4run6)),
                            session = rep("4", nrow(MW01sess4run6)),
                            run = rep("6", nrow(MW01sess4run6)),
                            MW01sess4run6) 




###session 4 run 7###

#reading in text file from Session 4 run 7 of MW01 as a data table
MW01sess4run7 <- read.table("MW01/Session4_run7.txt", header = F)

#adding column names 
colnames(MW01sess4run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run7$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run7 <- data.frame(sub = rep("MW01", nrow(MW01sess4run7)),
                            session = rep("4", nrow(MW01sess4run7)),
                            run = rep("7", nrow(MW01sess4run7)),
                            MW01sess4run7) 




###session 4 run 8###

#reading in text file from Session 4 run 8 of MW01 as a data table
MW01sess4run8 <- read.table("MW01/Session4_run8.txt", header = F)

#adding column names 
colnames(MW01sess4run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run8$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run8 <- data.frame(sub = rep("MW01", nrow(MW01sess4run8)),
                            session = rep("4", nrow(MW01sess4run8)),
                            run = rep("8", nrow(MW01sess4run8)),
                            MW01sess4run8) 




###session 4 run 9###

#reading in text file from Session 4 run 9 of MW01 as a data table
MW01sess4run9 <- read.table("MW01/Session4_run9.txt", header = F)

#adding column names 
colnames(MW01sess4run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run9$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run9 <- data.frame(sub = rep("MW01", nrow(MW01sess4run9)),
                            session = rep("4", nrow(MW01sess4run9)),
                            run = rep("9", nrow(MW01sess4run9)),
                            MW01sess4run9) 





###session 4 run 10###

#reading in text file from Session 4 run 10 of MW01 as a data table
MW01sess4run10 <- read.table("MW01/Session4_run10.txt", header = F)

#adding column names 
colnames(MW01sess4run10) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run10$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run10 <- data.frame(sub = rep("MW01", nrow(MW01sess4run10)),
                             session = rep("4", nrow(MW01sess4run10)),
                             run = rep("10", nrow(MW01sess4run10)),
                             MW01sess4run10) 


###session 4 run 11###

#reading in text file from Session 4 run 11 of MW01 as a data table
MW01sess4run11 <- read.table("MW01/Session4_run11.txt", header = F)

#adding column names 
colnames(MW01sess4run11) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess4run11$null <- NULL

#labeling each row with subject number, session, and run
MW01sess4run11 <- data.frame(sub = rep("MW01", nrow(MW01sess4run11)),
                             session = rep("4", nrow(MW01sess4run11)),
                             run = rep("11", nrow(MW01sess4run11)),
                             MW01sess4run11) 




###session 5 run 1###

#reading in text file from Session 5 run 1 of MW01 as a data table
MW01sess5run1 <- read.table("MW01/Session5_run1.txt", header = F)

#adding column names 
colnames(MW01sess5run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run1$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run1 <- data.frame(sub = rep("MW01", nrow(MW01sess5run1)),
                            session = rep("5", nrow(MW01sess5run1)),
                            run = rep("1", nrow(MW01sess5run1)),
                            MW01sess5run1) 




###session 5 run 2###

#reading in text file from Session 5 run 2 of MW01 as a data table
MW01sess5run2 <- read.table("MW01/Session5_run2.txt", header = F)

#adding column names 
colnames(MW01sess5run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run2$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run2 <- data.frame(sub = rep("MW01", nrow(MW01sess5run2)),
                            session = rep("5", nrow(MW01sess5run2)),
                            run = rep("2", nrow(MW01sess5run2)),
                            MW01sess5run2) 




###session 5 run 3###

#reading in text file from Session 5 run 3 of MW01 as a data table
MW01sess5run3 <- read.table("MW01/Session5_run3.txt", header = F)

#adding column names 
colnames(MW01sess5run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run3$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run3 <- data.frame(sub = rep("MW01", nrow(MW01sess5run3)),
                            session = rep("5", nrow(MW01sess5run3)),
                            run = rep("3", nrow(MW01sess5run3)),
                            MW01sess5run3) 





###session 5 run 4###

#reading in text file from Session 5 run 4 of MW01 as a data table
MW01sess5run4 <- read.table("MW01/Session5_run4.txt", header = F)

#adding column names 
colnames(MW01sess5run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run4$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run4 <- data.frame(sub = rep("MW01", nrow(MW01sess5run4)),
                            session = rep("5", nrow(MW01sess5run4)),
                            run = rep("4", nrow(MW01sess5run4)),
                            MW01sess5run4) 




###session 5 run 5###

#reading in text file from Session 5 run 5 of MW01 as a data table
MW01sess5run5 <- read.table("MW01/Session5_run5.txt", header = F)

#adding column names 
colnames(MW01sess5run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run5$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run5 <- data.frame(sub = rep("MW01", nrow(MW01sess5run5)),
                            session = rep("5", nrow(MW01sess5run5)),
                            run = rep("5", nrow(MW01sess5run5)),
                            MW01sess5run5) 




###session 5 run 6###

#reading in text file from Session 5 run 6 of MW01 as a data table
MW01sess5run6 <- read.table("MW01/Session5_run6.txt", header = F)

#adding column names 
colnames(MW01sess5run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run6$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run6 <- data.frame(sub = rep("MW01", nrow(MW01sess5run6)),
                            session = rep("5", nrow(MW01sess5run6)),
                            run = rep("6", nrow(MW01sess5run6)),
                            MW01sess5run6) 




###session 5 run 7###

#reading in text file from Session 5 run 7 of MW01 as a data table
MW01sess5run7 <- read.table("MW01/Session5_run7.txt", header = F)

#adding column names 
colnames(MW01sess5run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run7$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run7 <- data.frame(sub = rep("MW01", nrow(MW01sess5run7)),
                            session = rep("5", nrow(MW01sess5run7)),
                            run = rep("7", nrow(MW01sess5run7)),
                            MW01sess5run7) 




###session 5 run 8###

#reading in text file from Session 5 run 8 of MW01 as a data table
MW01sess5run8 <- read.table("MW01/Session5_run8.txt", header = F)

#adding column names 
colnames(MW01sess5run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run8$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run8 <- data.frame(sub = rep("MW01", nrow(MW01sess5run8)),
                            session = rep("5", nrow(MW01sess5run8)),
                            run = rep("8", nrow(MW01sess5run8)),
                            MW01sess5run8) 




###session 5 run 9###

#reading in text file from Session 5 run 9 of MW01 as a data table
MW01sess5run9 <- read.table("MW01/Session5_run9.txt", header = F)

#adding column names 
colnames(MW01sess5run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW01sess5run9$null <- NULL

#labeling each row with subject number, session, and run
MW01sess5run9 <- data.frame(sub = rep("MW01", nrow(MW01sess5run9)),
                            session = rep("5", nrow(MW01sess5run9)),
                            run = rep("9", nrow(MW01sess5run9)),
                            MW01sess5run9) 



#####Combine all MW01 dataframes#####

#trying to combine all df using reduce and merge, doesn't work 
MW01_all <- Reduce(function(x, y) merge(x, y, by="sub"), 
       mget(ls(pattern = 'MW01')))

#trying to use reduce to combine all dataframes within MW01_all, doesn't work (vector memory exhausted)
MW01_all <- mget(ls(pattern = 'MW01'))
MW01_all %>% reduce(full_join, by='sub')

#trying out reduce function with a small subset of the data first. not ideal. still shows column names for each df as opposed to merging all dataframes under the same column name header. 
MW01_subset <- list(MW01sess1run1, MW01sess1run2, MW01sess1run3)
MW01_subset %>% reduce(full_join, by='sub')

#doesn't work
MW01_list <-mget(ls(pattern = 'MW01'))
MW01_all <- rbind(MW01_list)


#!! unfortunately the best option right now. use ls() to obtain list of all dataframes in global environment. copy and paste output into VSCode and clean up there (use find and replace to find quotes and replace with spaces) !!#
MW01_all <- rbind(MW01sess1run1, MW01sess1run2, MW01sess1run3, MW01sess1run4, 
                  MW01sess1run5, MW01sess1run6, MW01sess1run7, MW01sess2run1, 
                  MW01sess2run2, MW01sess2run3, MW01sess2run4, MW01sess2run5,  
                  MW01sess2run6, MW01sess2run7, MW01sess2run8, MW01sess2run9, 
                  MW01sess3run1, MW01sess3run10, MW01sess3run2, MW01sess3run3,  
                  MW01sess3run4, MW01sess3run5, MW01sess3run6, MW01sess3run7,  
                  MW01sess3run8, MW01sess3run9,  
                  MW01sess4run1, MW01sess4run10, 
                  MW01sess4run11, MW01sess4run2,  
                  MW01sess4run3, MW01sess4run4,  
                  MW01sess4run5, MW01sess4run6,  
                  MW01sess4run7, MW01sess4run8,  
                  MW01sess4run9, MW01sess5run1,  
                  MW01sess5run2, MW01sess5run3,  
                  MW01sess5run4, MW01sess5run5,  
                  MW01sess5run6, MW01sess5run7,  
                  MW01sess5run8, MW01sess5run9) 


#zero-padding for formatting
MW01_all$run <- str_pad(MW01_all$run, 3, pad= "0")

#Create new categorical variable that labels each rating as a MW event or not
MW01_all <- MW01_all |> mutate(MWLabel = case_when(
  MWRatings > 4 ~ "Not mind wandering",
  MWRatings <= 4 ~ "Mind wandering"
))



#Tip: use class() function to make sure categorical variables are characters and data are integers!



#####Graphs for MW01#####

#practice plot for just session1 run1#
ggplot(data = MW01sess1run1) +
  geom_line(mapping = aes(x = OnsetSeconds, y = MWRatings), colour = "honeydew", size = 3) +
  geom_point(mapping = aes(x=OnsetSeconds, y=MWRatings), colour = "honeydew2", size = 3.5)

#yay!!#
ggplot(data = MW01_all) +
  geom_line(mapping = aes(x = OnsetSeconds, y = MWRatings), colour = 'pink1', size = 1.75) + 
  geom_point(mapping = aes(x = OnsetSeconds, y = MWRatings, colour = MWLabel), size = 1.75) +
  facet_grid(session ~ run) + #facet_grid is the function that divides the data by both session and run
  labs(title = "Subject MW01", subtitle = "Ratings of Focus Overtime by Session / Run") +
  theme(panel.background = element_rect(fill = 'grey98'), #change color of background so it's not dark gray
        panel.spacing.x = unit(0, "lines"), #remove spacing for facet grid between runs
        panel.spacing.y = unit(0.2, "lines"), #make spacing between sessions in facet grid smaller
        strip.background = element_rect(fill = 'mistyrose')) + #changes color of facet grid labels
  geom_hline(yintercept = 4, linetype = 2, colour = 'grey64') #add a dashed "mind-wandering threshold" line 
#this divides the plot by 2 categorical variables: session and run. session is organized by rows while runs are organized by columns. the way this plot is laid out now, it is good for viewing trends in ratings over time for each session. maybe find a function that can divide a continuous graph by categorical variables so we can see trends in ratings over time for the whole length of the experiment. 
#Tip: run grDevices::colors() to get list of colors recognized by R for "colour" argument!


#####MW01 Analysis#####

MW01_summary <- summary(MW01_all$MWRatings)
MW01_summary

length(MW01_all$MWRatings)



length(which(MW01_all$MWLabel=='Mind wandering'))
length(which(MW01_all$MWLabel=='Not mind wandering'))





#####MW02#####

###session 1 run 1 ###
#reading in text file from Session 1 Run 1 of MW02 as a data table
MW02sess1run1 <- read.table("MW02/Session1_run1.txt", header = F)

#adding column names 
colnames(MW02sess1run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run1$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run1 <- data.frame(sub = rep("MW02", nrow(MW02sess1run1)),
                            session = rep("1", nrow(MW02sess1run1)),
                            run = rep("1", nrow(MW02sess1run1)),
                            MW02sess1run1) 

###session 1 run 2 ###
#reading in text file from Session 1 Run 2 of MW02 as a data table
MW02sess1run2 <- read.table("MW02/Session1_run2.txt", header = F)

#adding column names 
colnames(MW02sess1run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run2$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run2 <- data.frame(sub = rep("MW02", nrow(MW02sess1run2)),
                            session = rep("1", nrow(MW02sess1run2)),
                            run = rep("2", nrow(MW02sess1run2)),
                            MW02sess1run2) 

###session 1 run 3 ###
#reading in text file from Session 1 run 3 of MW02 as a data table
MW02sess1run3 <- read.table("MW02/Session1_run3.txt", header = F)

#adding column names 
colnames(MW02sess1run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run3$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run3 <- data.frame(sub = rep("MW02", nrow(MW02sess1run3)),
                            session = rep("1", nrow(MW02sess1run3)),
                            run = rep("3", nrow(MW02sess1run3)),
                            MW02sess1run3) 

###session 1 run 4 ###
#reading in text file from Session 1 run 4 of MW02 as a data table
MW02sess1run4 <- read.table("MW02/Session1_run4.txt", header = F)

#adding column names 
colnames(MW02sess1run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run4$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run4 <- data.frame(sub = rep("MW02", nrow(MW02sess1run4)),
                            session = rep("1", nrow(MW02sess1run4)),
                            run = rep("4", nrow(MW02sess1run4)),
                            MW02sess1run4) 

###session 1 run 5 ###
#reading in text file from Session 1 run 5 of MW02 as a data table
MW02sess1run5 <- read.table("MW02/Session1_run5.txt", header = F)

#adding column names 
colnames(MW02sess1run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run5$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run5 <- data.frame(sub = rep("MW02", nrow(MW02sess1run5)),
                            session = rep("1", nrow(MW02sess1run5)),
                            run = rep("5", nrow(MW02sess1run5)),
                            MW02sess1run5) 

###session 1 run 6 ###
#reading in text file from Session 1 run 6 of MW02 as a data table
MW02sess1run6 <- read.table("MW02/Session1_run6.txt", header = F)

#adding column names 
colnames(MW02sess1run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run6$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run6 <- data.frame(sub = rep("MW02", nrow(MW02sess1run6)),
                            session = rep("1", nrow(MW02sess1run6)),
                            run = rep("6", nrow(MW02sess1run6)),
                            MW02sess1run6) 

###session 1 run 7  ###
#reading in text file from Session 1 run 7  of MW02 as a data table
MW02sess1run7 <- read.table("MW02/Session1_run7.txt", header = F)

#adding column names 
colnames(MW02sess1run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run7$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run7 <- data.frame(sub = rep("MW02", nrow(MW02sess1run7)),
                            session = rep("1", nrow(MW02sess1run7)),
                            run = rep("7", nrow(MW02sess1run7)),
                            MW02sess1run7) 

###session 1 run 8   ###
#reading in text file from Session 1 run 8 of MW02 as a data table
MW02sess1run8 <- read.table("MW02/Session1_run8.txt", header = F)

#adding column names 
colnames(MW02sess1run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run8$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run8 <- data.frame(sub = rep("MW02", nrow(MW02sess1run8)),
                             session = rep("1", nrow(MW02sess1run8)),
                             run = rep("8", nrow(MW02sess1run8)),
                             MW02sess1run8) 



###session 1 run 9###
#reading in text file from Session 1 run 9 of MW02 as a data table
MW02sess1run9 <- read.table("MW02/Session1_run9.txt", header = F)

#adding column names 
colnames(MW02sess1run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess1run9$null <- NULL

#labeling each row with subject number, session, and run
MW02sess1run9  <- data.frame(sub = rep("MW02", nrow(MW02sess1run9)),
                             session = rep("1", nrow(MW02sess1run9)),
                             run = rep("9", nrow(MW02sess1run9)),
                             MW02sess1run9) 


###session 2 run 1###
#reading in text file from Session 2 run 1 of MW02 as a data table
MW02sess2run1 <- read.table("MW02/Session2_run1.txt", header = F)

#adding column names 
colnames(MW02sess2run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run1$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run1  <- data.frame(sub = rep("MW02", nrow(MW02sess2run1)),
                             session = rep("2", nrow(MW02sess2run1)),
                             run = rep("1", nrow(MW02sess2run1)),
                             MW02sess2run1) 


###session 2 run 2###
#reading in text file from Session 2 run 2 of MW02 as a data table
MW02sess2run2 <- read.table("MW02/Session2_run2.txt", header = F)

#adding column names 
colnames(MW02sess2run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run2$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run2  <- data.frame(sub = rep("MW02", nrow(MW02sess2run2)),
                             session = rep("2", nrow(MW02sess2run2)),
                             run = rep("2", nrow(MW02sess2run2)),
                             MW02sess2run2)


###session 2 run 3###
#reading in text file from Session 2 run 3 of MW02 as a data table
MW02sess2run3 <- read.table("MW02/Session2_run3.txt", header = F)

#adding column names 
colnames(MW02sess2run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run3$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run3  <- data.frame(sub = rep("MW02", nrow(MW02sess2run3)),
                             session = rep("2", nrow(MW02sess2run3)),
                             run = rep("3", nrow(MW02sess2run3)),
                             MW02sess2run3) 

###session 2 run 4###
#reading in text file from Session 2 run 4 of MW02 as a data table
MW02sess2run4 <- read.table("MW02/Session2_run4.txt", header = F)

#adding column names 
colnames(MW02sess2run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run4$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run4  <- data.frame(sub = rep("MW02", nrow(MW02sess2run4)),
                             session = rep("2", nrow(MW02sess2run4)),
                             run = rep("4", nrow(MW02sess2run4)),
                             MW02sess2run4) 


###session 2 run 5###
#reading in text file from Session 2 run 5 of MW02 as a data table
MW02sess2run5 <- read.table("MW02/Session2_run5.txt", header = F)

#adding column names 
colnames(MW02sess2run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run5$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run5  <- data.frame(sub = rep("MW02", nrow(MW02sess2run5)),
                             session = rep("2", nrow(MW02sess2run5)),
                             run = rep("5", nrow(MW02sess2run5)),
                             MW02sess2run5)

###session 2 run 6###
#reading in text file from Session 2 run 6 of MW02 as a data table
MW02sess2run6 <- read.table("MW02/Session2_run6.txt", header = F)

#adding column names 
colnames(MW02sess2run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run6$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run6  <- data.frame(sub = rep("MW02", nrow(MW02sess2run6)),
                             session = rep("2", nrow(MW02sess2run6)),
                             run = rep("6", nrow(MW02sess2run6)),
                             MW02sess2run6)

###session 2 run 7###
#reading in text file from Session 2 run 7 of MW02 as a data table
MW02sess2run7 <- read.table("MW02/Session2_run7.txt", header = F)

#adding column names 
colnames(MW02sess2run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run7$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run7  <- data.frame(sub = rep("MW02", nrow(MW02sess2run7)),
                             session = rep("2", nrow(MW02sess2run7)),
                             run = rep("7", nrow(MW02sess2run7)),
                             MW02sess2run7)


###session 2 run 8###
#reading in text file from Session 2 run 8 of MW02 as a data table
MW02sess2run8 <- read.table("MW02/Session2_run8.txt", header = F)

#adding column names 
colnames(MW02sess2run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run8$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run8  <- data.frame(sub = rep("MW02", nrow(MW02sess2run8)),
                             session = rep("2", nrow(MW02sess2run8)),
                             run = rep("8", nrow(MW02sess2run8)),
                             MW02sess2run8)


###session 2 run 9###
#reading in text file from Session 2 run 9 of MW02 as a data table
MW02sess2run9 <- read.table("MW02/Session2_run9.txt", header = F)

#adding column names 
colnames(MW02sess2run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run9$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run9  <- data.frame(sub = rep("MW02", nrow(MW02sess2run9)),
                             session = rep("2", nrow(MW02sess2run9)),
                             run = rep("9", nrow(MW02sess2run9)),
                             MW02sess2run9)


###session 2 run 10###
#reading in text file from Session 2 run 10 of MW02 as a data table
MW02sess2run10 <- read.table("MW02/Session2_run10.txt", header = F)

#adding column names 
colnames(MW02sess2run10) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess2run10$null <- NULL

#labeling each row with subject number, session, and run
MW02sess2run10  <- data.frame(sub = rep("MW02", nrow(MW02sess2run10)),
                              session = rep("2", nrow(MW02sess2run10)),
                              run = rep("10", nrow(MW02sess2run10)),
                              MW02sess2run10) 

###session 3 run 1###
#reading in text file from session 3 run 1 of MW02 as a data table
MW02sess3run1 <- read.table("MW02/Session3_run1.txt", header = F)

#adding column names 
colnames(MW02sess3run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run1$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run1  <- data.frame(sub = rep("MW02", nrow(MW02sess3run1)),
                             session = rep("3", nrow(MW02sess3run1)),
                             run = rep("1", nrow(MW02sess3run1)),
                             MW02sess3run1) 

###session 3 run 2###
#reading in text file from session 3 run 2 of MW02 as a data table
MW02sess3run2 <- read.table("MW02/Session3_run2.txt", header = F)

#adding column names 
colnames(MW02sess3run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run2$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run2  <- data.frame(sub = rep("MW02", nrow(MW02sess3run2)),
                             session = rep("3", nrow(MW02sess3run2)),
                             run = rep("2", nrow(MW02sess3run2)),
                             MW02sess3run2) 

###session 3 run 3###
#reading in text file from session 3 run 3 of MW02 as a data table
MW02sess3run3 <- read.table("MW02/Session3_run3.txt", header = F)

#adding column names 
colnames(MW02sess3run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run3$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run3  <- data.frame(sub = rep("MW02", nrow(MW02sess3run3)),
                             session = rep("3", nrow(MW02sess3run3)),
                             run = rep("3", nrow(MW02sess3run3)),
                             MW02sess3run3) 


###session 3 run 4###
#reading in text file from session 3 run 4 of MW02 as a data table
MW02sess3run4 <- read.table("MW02/Session3_run4.txt", header = F)

#adding column names 
colnames(MW02sess3run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run4$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run4  <- data.frame(sub = rep("MW02", nrow(MW02sess3run4)),
                             session = rep("3", nrow(MW02sess3run4)),
                             run = rep("4", nrow(MW02sess3run4)),
                             MW02sess3run4) 

###session 3 run 5###
#reading in text file from session 3 run 5 of MW02 as a data table
MW02sess3run5 <- read.table("MW02/Session3_run5.txt", header = F)

#adding column names 
colnames(MW02sess3run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run5$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run5  <- data.frame(sub = rep("MW02", nrow(MW02sess3run5)),
                             session = rep("3", nrow(MW02sess3run5)),
                             run = rep("5", nrow(MW02sess3run5)),
                             MW02sess3run5)

###session 3 run 6###
#reading in text file from session 3 run 6 of MW02 as a data table
MW02sess3run6 <- read.table("MW02/Session3_run6.txt", header = F)

#adding column names 
colnames(MW02sess3run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run6$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run6  <- data.frame(sub = rep("MW02", nrow(MW02sess3run6)),
                             session = rep("3", nrow(MW02sess3run6)),
                             run = rep("6", nrow(MW02sess3run6)),
                             MW02sess3run6) 


###session 3 run 7###
#reading in text file from session 3 run 7 of MW02 as a data table
MW02sess3run7 <- read.table("MW02/Session3_run7.txt", header = F)

#adding column names 
colnames(MW02sess3run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run7$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run7  <- data.frame(sub = rep("MW02", nrow(MW02sess3run7)),
                             session = rep("3", nrow(MW02sess3run7)),
                             run = rep("7", nrow(MW02sess3run7)),
                             MW02sess3run7) 

###session 3 run 8###
#reading in text file from session 3 run 8 of MW02 as a data table
MW02sess3run8 <- read.table("MW02/Session3_run8.txt", header = F)

#adding column names 
colnames(MW02sess3run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run8$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run8  <- data.frame(sub = rep("MW02", nrow(MW02sess3run8)),
                             session = rep("3", nrow(MW02sess3run8)),
                             run = rep("8", nrow(MW02sess3run8)),
                             MW02sess3run8) 

###session 3 run 9###
#reading in text file from session 3 run 9 of MW02 as a data table
MW02sess3run9 <- read.table("MW02/Session3_run9.txt", header = F)

#adding column names 
colnames(MW02sess3run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess3run9$null <- NULL

#labeling each row with subject number, session, and run
MW02sess3run9  <- data.frame(sub = rep("MW02", nrow(MW02sess3run9)),
                             session = rep("3", nrow(MW02sess3run9)),
                             run = rep("9", nrow(MW02sess3run9)),
                             MW02sess3run9) 



###session 4 run 1###
#reading in text file from session 4 run 1 of MW02 as a data table
MW02sess4run1 <- read.table("MW02/Session4_run1.txt", header = F)

#adding column names 
colnames(MW02sess4run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run1$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run1  <- data.frame(sub = rep("MW02", nrow(MW02sess4run1)),
                             session = rep("4", nrow(MW02sess4run1)),
                             run = rep("1", nrow(MW02sess4run1)),
                             MW02sess4run1) 

###session 4 run 2###
#reading in text file from session 4 run 2 of MW02 as a data table
MW02sess4run2 <- read.table("MW02/Session4_run2.txt", header = F)

#adding column names 
colnames(MW02sess4run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run2$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run2  <- data.frame(sub = rep("MW02", nrow(MW02sess4run2)),
                             session = rep("4", nrow(MW02sess4run2)),
                             run = rep("2", nrow(MW02sess4run2)),
                             MW02sess4run2) 

###session 4 run 3###
#reading in text file from session 4 run 3 of MW02 as a data table
MW02sess4run3 <- read.table("MW02/Session4_run3.txt", header = F)

#adding column names 
colnames(MW02sess4run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run3$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run3  <- data.frame(sub = rep("MW02", nrow(MW02sess4run3)),
                             session = rep("4", nrow(MW02sess4run3)),
                             run = rep("3", nrow(MW02sess4run3)),
                             MW02sess4run3) 


###session 4 run 4###
#reading in text file from session 4 run 4 of MW02 as a data table
MW02sess4run4 <- read.table("MW02/Session4_run4.txt", header = F)

#adding column names 
colnames(MW02sess4run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run4$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run4  <- data.frame(sub = rep("MW02", nrow(MW02sess4run4)),
                             session = rep("4", nrow(MW02sess4run4)),
                             run = rep("4", nrow(MW02sess4run4)),
                             MW02sess4run4) 

###session 4 run 5###
#reading in text file from session 4 run 5 of MW02 as a data table
MW02sess4run5 <- read.table("MW02/Session4_run5.txt", header = F)

#adding column names 
colnames(MW02sess4run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run5$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run5  <- data.frame(sub = rep("MW02", nrow(MW02sess4run5)),
                             session = rep("4", nrow(MW02sess4run5)),
                             run = rep("5", nrow(MW02sess4run5)),
                             MW02sess4run5) 

###session 4 run 6###
#reading in text file from session 4 run 6 of MW02 as a data table
MW02sess4run6 <- read.table("MW02/Session4_run6.txt", header = F)

#adding column names 
colnames(MW02sess4run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run6$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run6  <- data.frame(sub = rep("MW02", nrow(MW02sess4run6)),
                             session = rep("4", nrow(MW02sess4run6)),
                             run = rep("6", nrow(MW02sess4run6)),
                             MW02sess4run6) 


###session 4 run 7###
#reading in text file from session 4 run 7 of MW02 as a data table
MW02sess4run7 <- read.table("MW02/Session4_run7.txt", header = F)

#adding column names 
colnames(MW02sess4run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run7$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run7  <- data.frame(sub = rep("MW02", nrow(MW02sess4run7)),
                             session = rep("4", nrow(MW02sess4run7)),
                             run = rep("7", nrow(MW02sess4run7)),
                             MW02sess4run7) 

###session 4 run 8###
#reading in text file from session 4 run 8 of MW02 as a data table
MW02sess4run8 <- read.table("MW02/Session4_run8.txt", header = F)

#adding column names 
colnames(MW02sess4run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run8$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run8  <- data.frame(sub = rep("MW02", nrow(MW02sess4run8)),
                             session = rep("4", nrow(MW02sess4run8)),
                             run = rep("8", nrow(MW02sess4run8)),
                             MW02sess4run8) 

###session 4 run 9###
#reading in text file from session 4 run 9 of MW02 as a data table
MW02sess4run9 <- read.table("MW02/Session4_run9.txt", header = F)

#adding column names 
colnames(MW02sess4run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run9$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run9  <- data.frame(sub = rep("MW02", nrow(MW02sess4run9)),
                             session = rep("4", nrow(MW02sess4run9)),
                             run = rep("9", nrow(MW02sess4run9)),
                             MW02sess4run9) 

###session 4 run 10###
#reading in text file from session 4 run 10 of MW02 as a data table
MW02sess4run10 <- read.table("MW02/Session4_run10.txt", header = F)

#adding column names 
colnames(MW02sess4run10) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess4run10$null <- NULL

#labeling each row with subject number, session, and run
MW02sess4run10  <- data.frame(sub = rep("MW02", nrow(MW02sess4run10)),
                              session = rep("4", nrow(MW02sess4run10)),
                              run = rep("10", nrow(MW02sess4run10)),
                              MW02sess4run10) 

###session 6 run 1###
#reading in text file from session 6 run 1 of MW02 as a data table
MW02sess6run1 <- read.table("MW02/Session6_run1.txt", header = F)

#adding column names 
colnames(MW02sess6run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess6run1$null <- NULL

#labeling each row with subject number, session, and run
MW02sess6run1  <- data.frame(sub = rep("MW02", nrow(MW02sess6run1)),
                             session = rep("6", nrow(MW02sess6run1)),
                             run = rep("1", nrow(MW02sess6run1)),
                             MW02sess6run1) 

###session 6 run 2###
#reading in text file from session 6 run 2 of MW02 as a data table
MW02sess6run2 <- read.table("MW02/Session6_run2.txt", header = F)

#adding column names 
colnames(MW02sess6run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess6run2$null <- NULL

#labeling each row with subject number, session, and run
MW02sess6run2  <- data.frame(sub = rep("MW02", nrow(MW02sess6run2)),
                             session = rep("6", nrow(MW02sess6run2)),
                             run = rep("2", nrow(MW02sess6run2)),
                             MW02sess6run2) 


###session 6 run 3###
#reading in text file from session 6 run 3 of MW02 as a data table
MW02sess6run3 <- read.table("MW02/Session6_run3.txt", header = F)

#adding column names 
colnames(MW02sess6run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess6run3$null <- NULL

#labeling each row with subject number, session, and run
MW02sess6run3  <- data.frame(sub = rep("MW02", nrow(MW02sess6run3)),
                             session = rep("6", nrow(MW02sess6run3)),
                             run = rep("3", nrow(MW02sess6run3)),
                             MW02sess6run3) 


###session 6 run 4###
#reading in text file from session 6 run 4 of MW02 as a data table
MW02sess6run4 <- read.table("MW02/Session6_run4.txt", header = F)

#adding column names 
colnames(MW02sess6run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess6run4$null <- NULL

#labeling each row with subject number, session, and run
MW02sess6run4  <- data.frame(sub = rep("MW02", nrow(MW02sess6run4)),
                             session = rep("6", nrow(MW02sess6run4)),
                             run = rep("4", nrow(MW02sess6run4)),
                             MW02sess6run4) 

###session 6 run 5###
#reading in text file from session 6 run 5 of MW02 as a data table
MW02sess6run5 <- read.table("MW02/Session6_run5.txt", header = F)

#adding column names 
colnames(MW02sess6run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess6run5$null <- NULL

#labeling each row with subject number, session, and run
MW02sess6run5  <- data.frame(sub = rep("MW02", nrow(MW02sess6run5)),
                             session = rep("6", nrow(MW02sess6run5)),
                             run = rep("5", nrow(MW02sess6run5)),
                             MW02sess6run5) 

###session 6 run 6###
#reading in text file from session 6 run 6 of MW02 as a data table
MW02sess6run6 <- read.table("MW02/Session6_run6.txt", header = F)

#adding column names 
colnames(MW02sess6run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess6run6$null <- NULL

#labeling each row with subject number, session, and run
MW02sess6run6  <- data.frame(sub = rep("MW02", nrow(MW02sess6run6)),
                             session = rep("6", nrow(MW02sess6run6)),
                             run = rep("6", nrow(MW02sess6run6)),
                             MW02sess6run6) 

###session 6 run 7###
#reading in text file from session 6 run 7 of MW02 as a data table
MW02sess6run7 <- read.table("MW02/Session6_run7.txt", header = F)

#adding column names 
colnames(MW02sess6run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess6run7$null <- NULL

#labeling each row with subject number, session, and run
MW02sess6run7  <- data.frame(sub = rep("MW02", nrow(MW02sess6run7)),
                             session = rep("6", nrow(MW02sess6run7)),
                             run = rep("7", nrow(MW02sess6run7)),
                             MW02sess6run7) 

###session 6 run 8###
#reading in text file from session 6 run 8 of MW02 as a data table
MW02sess6run8 <- read.table("MW02/Session6_run8.txt", header = F)

#adding column names 
colnames(MW02sess6run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW02sess6run8$null <- NULL

#labeling each row with subject number, session, and run
MW02sess6run8  <- data.frame(sub = rep("MW02", nrow(MW02sess6run8)),
                             session = rep("6", nrow(MW02sess6run8)),
                             run = rep("8", nrow(MW02sess6run8)),
                             MW02sess6run8) 



#####Combine all MW02 dataframes#####

MW02_all <- rbind(MW02sess1run1, MW02sess1run2, MW02sess1run3, MW02sess1run4, MW02sess1run5, MW02sess1run6,
                  MW02sess1run7, MW02sess1run8, MW02sess1run9, MW02sess2run1, MW02sess2run10,
                  MW02sess2run2, MW02sess2run3, MW02sess2run4, MW02sess2run5, MW02sess2run6,
                  MW02sess2run7, MW02sess2run8, MW02sess2run9, MW02sess3run1, MW02sess3run2, MW02sess3run3,
                  MW02sess3run4, MW02sess3run5, MW02sess3run6, MW02sess3run7, MW02sess3run8,
                  MW02sess3run9, MW02sess4run1, MW02sess4run10, MW02sess4run2, MW02sess4run3, MW02sess4run4,
                  MW02sess4run5, MW02sess4run6, MW02sess4run7, MW02sess4run8, MW02sess4run9,
                  MW02sess6run1, MW02sess6run2, MW02sess6run3, MW02sess6run4, MW02sess6run5, MW02sess6run6,
                  MW02sess6run7, MW02sess6run8)

#zero-padding for formatting
MW02_all$run <- str_pad(MW02_all$run, 3, pad= "0")


#Create new categorical variable that labels each rating as a MW event or not
MW02_all <- MW02_all |> mutate(MWLabel = case_when(
  MWRatings > 4 ~ "Not mind wandering",
  MWRatings <= 4 ~ "Mind wandering"
))

#Tip: use class() function to make sure categorical variables are characters and data are integers!



#####Graph for MW02#####

ggplot(data = MW02_all) +
  geom_line(mapping = aes(x = OnsetSeconds, y = MWRatings), colour = 'mediumaquamarine', size = 1.75) + 
  geom_point(mapping = aes(x = OnsetSeconds, y = MWRatings, colour = MWLabel), size = 1.75) +
  facet_grid(session ~ run) + #facet_grid is the function that divides the data by both session and run
  labs(title = "Subject MW02", subtitle = "Ratings of Focus Overtime by Session / Run") +
  theme(panel.background = element_rect(fill = 'grey98'), #change color of background so it's not dark gray
        panel.spacing.x = unit(0, "lines"), #remove spacing for facet grid between runs
        panel.spacing.y = unit(0.2, "lines"), #make spacing between sessions in facet grid smaller
        strip.background = element_rect(fill = 'skyblue')) + #changes color of facet grid labels
  geom_hline(yintercept = 4, linetype = 2, colour = 'grey64') #add a dashed "mind-wandering threshold" line

#####MW02 Analysis#####


length(MW02_all$MWRatings)

MW02_summary <- summary(MW02_all$MWRatings)
MW02_summary

length(which(MW02_all$MWLabel=='Mind wandering'))
length(which(MW02_all$MWLabel=='Not mind wandering'))

  
  
  #####MW03#####

###session 1 run 1 ###
#reading in text file from Session 1 Run 1 of MW03 as a data table
MW03sess1run1 <- read.table("MW03/Session1_run1.txt", header = F)

#adding column names 
colnames(MW03sess1run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess1run1$null <- NULL

#labeling each row with subject number, session, and run
MW03sess1run1 <- data.frame(sub = rep("MW03", nrow(MW03sess1run1)),
                            session = rep("1", nrow(MW03sess1run1)),
                            run = rep("1", nrow(MW03sess1run1)),
                            MW03sess1run1) 

###session 1 run 2 ###
#reading in text file from Session 1 run 2 of MW03 as a data table
MW03sess1run2 <- read.table("MW03/Session1_run2.txt", header = F)

#adding column names 
colnames(MW03sess1run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess1run2$null <- NULL

#labeling each row with subject number, session, and run
MW03sess1run2 <- data.frame(sub = rep("MW03", nrow(MW03sess1run2)),
                            session = rep("1", nrow(MW03sess1run2)),
                            run = rep("2", nrow(MW03sess1run2)),
                            MW03sess1run2) 

###session 1 run 3 ###
#reading in text file from Session 1 run 3 of MW03 as a data table
MW03sess1run3 <- read.table("MW03/Session1_run3.txt", header = F)

#adding column names 
colnames(MW03sess1run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess1run3$null <- NULL

#labeling each row with subject number, session, and run
MW03sess1run3 <- data.frame(sub = rep("MW03", nrow(MW03sess1run3)),
                            session = rep("1", nrow(MW03sess1run3)),
                            run = rep("3", nrow(MW03sess1run3)),
                            MW03sess1run3) 

###session 1 run 4 ###
#reading in text file from Session 1 run 4 of MW03 as a data table
MW03sess1run4 <- read.table("MW03/Session1_run4.txt", header = F)

#adding column names 
colnames(MW03sess1run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess1run4$null <- NULL

#labeling each row with subject number, session, and run
MW03sess1run4 <- data.frame(sub = rep("MW03", nrow(MW03sess1run4)),
                            session = rep("1", nrow(MW03sess1run4)),
                            run = rep("4", nrow(MW03sess1run4)),
                            MW03sess1run4) 


###session 1 run 5 ###
#reading in text file from Session 1 run 5 of MW03 as a data table
MW03sess1run5 <- read.table("MW03/Session1_run5.txt", header = F)

#adding column names 
colnames(MW03sess1run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess1run5$null <- NULL

#labeling each row with subject number, session, and run
MW03sess1run5 <- data.frame(sub = rep("MW03", nrow(MW03sess1run5)),
                            session = rep("1", nrow(MW03sess1run5)),
                            run = rep("5", nrow(MW03sess1run5)),
                            MW03sess1run5) 

###session 1 run 6 ###
#reading in text file from Session 1 run 6 of MW03 as a data table
MW03sess1run6 <- read.table("MW03/Session1_run6.txt", header = F)

#adding column names 
colnames(MW03sess1run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess1run6$null <- NULL

#labeling each row with subject number, session, and run
MW03sess1run6 <- data.frame(sub = rep("MW03", nrow(MW03sess1run6)),
                            session = rep("1", nrow(MW03sess1run6)),
                            run = rep("6", nrow(MW03sess1run6)),
                            MW03sess1run6) 

###session 1 run 7 ###
#reading in text file from Session 1 run 7 of MW03 as a data table
MW03sess1run7 <- read.table("MW03/Session1_run7.txt", header = F)

#adding column names 
colnames(MW03sess1run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess1run7$null <- NULL

#labeling each row with subject number, session, and run
MW03sess1run7 <- data.frame(sub = rep("MW03", nrow(MW03sess1run7)),
                            session = rep("1", nrow(MW03sess1run7)),
                            run = rep("7", nrow(MW03sess1run7)),
                            MW03sess1run7) 

###session 1 run 8 ###
#reading in text file from Session 1 run 8 of MW03 as a data table
MW03sess1run8 <- read.table("MW03/Session1_run8.txt", header = F)

#adding column names 
colnames(MW03sess1run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess1run8$null <- NULL

#labeling each row with subject number, session, and run
MW03sess1run8 <- data.frame(sub = rep("MW03", nrow(MW03sess1run8)),
                            session = rep("1", nrow(MW03sess1run8)),
                            run = rep("8", nrow(MW03sess1run8)),
                            MW03sess1run8) 

###session 2 run 1 ###
#reading in text file from Session 2 run 1 of MW03 as a data table
MW03sess2run1 <- read.table("MW03/Session2_run1.txt", header = F)

#adding column names 
colnames(MW03sess2run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run1$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run1 <- data.frame(sub = rep("MW03", nrow(MW03sess2run1)),
                            session = rep("2", nrow(MW03sess2run1)),
                            run = rep("1", nrow(MW03sess2run1)),
                            MW03sess2run1) 

###session 2 run 2 ###
#reading in text file from Session 2 run 2 of MW03 as a data table
MW03sess2run2 <- read.table("MW03/Session2_run2.txt", header = F)

#adding column names 
colnames(MW03sess2run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run2$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run2 <- data.frame(sub = rep("MW03", nrow(MW03sess2run2)),
                            session = rep("2", nrow(MW03sess2run2)),
                            run = rep("2", nrow(MW03sess2run2)),
                            MW03sess2run2) 

###session 2 run 3 ###
#reading in text file from Session 2 run 3 of MW03 as a data table
MW03sess2run3 <- read.table("MW03/Session2_run3.txt", header = F)

#adding column names 
colnames(MW03sess2run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run3$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run3 <- data.frame(sub = rep("MW03", nrow(MW03sess2run3)),
                            session = rep("2", nrow(MW03sess2run3)),
                            run = rep("3", nrow(MW03sess2run3)),
                            MW03sess2run3) 


###session 2 run 4 ###
#reading in text file from Session 2 run 4 of MW03 as a data table
MW03sess2run4 <- read.table("MW03/Session2_run4.txt", header = F)

#adding column names 
colnames(MW03sess2run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run4$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run4 <- data.frame(sub = rep("MW03", nrow(MW03sess2run4)),
                            session = rep("2", nrow(MW03sess2run4)),
                            run = rep("4", nrow(MW03sess2run4)),
                            MW03sess2run4) 

###session 2 run 5 ###
#reading in text file from Session 2 run 5 of MW03 as a data table
MW03sess2run5 <- read.table("MW03/Session2_run5.txt", header = F)

#adding column names 
colnames(MW03sess2run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run5$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run5 <- data.frame(sub = rep("MW03", nrow(MW03sess2run5)),
                            session = rep("2", nrow(MW03sess2run5)),
                            run = rep("5", nrow(MW03sess2run5)),
                            MW03sess2run5) 

###session 2 run 6 ###
#reading in text file from Session 2 run 6 of MW03 as a data table
MW03sess2run6 <- read.table("MW03/Session2_run6.txt", header = F)

#adding column names 
colnames(MW03sess2run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run6$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run6 <- data.frame(sub = rep("MW03", nrow(MW03sess2run6)),
                            session = rep("2", nrow(MW03sess2run6)),
                            run = rep("6", nrow(MW03sess2run6)),
                            MW03sess2run6) 

###session 2 run 7 ###
#reading in text file from Session 2 run 7 of MW03 as a data table
MW03sess2run7 <- read.table("MW03/Session2_run7.txt", header = F)

#adding column names 
colnames(MW03sess2run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run7$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run7 <- data.frame(sub = rep("MW03", nrow(MW03sess2run7)),
                            session = rep("2", nrow(MW03sess2run7)),
                            run = rep("7", nrow(MW03sess2run7)),
                            MW03sess2run7) 

###session 2 run 8 ###
#reading in text file from Session 2 run 8 of MW03 as a data table
MW03sess2run8 <- read.table("MW03/Session2_run8.txt", header = F)

#adding column names 
colnames(MW03sess2run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run8$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run8 <- data.frame(sub = rep("MW03", nrow(MW03sess2run8)),
                            session = rep("2", nrow(MW03sess2run8)),
                            run = rep("8", nrow(MW03sess2run8)),
                            MW03sess2run8) 

###session 2 run 9 ###
#reading in text file from Session 2 run 9 of MW03 as a data table
MW03sess2run9 <- read.table("MW03/Session2_run9.txt", header = F)

#adding column names 
colnames(MW03sess2run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run9$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run9 <- data.frame(sub = rep("MW03", nrow(MW03sess2run9)),
                            session = rep("2", nrow(MW03sess2run9)),
                            run = rep("9", nrow(MW03sess2run9)),
                            MW03sess2run9) 



###session 2 run 10 ###
#reading in text file from Session 2 run 10 of MW03 as a data table
MW03sess2run10 <- read.table("MW03/Session2_run10.txt", header = F)

#adding column names 
colnames(MW03sess2run10) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess2run10$null <- NULL

#labeling each row with subject number, session, and run
MW03sess2run10 <- data.frame(sub = rep("MW03", nrow(MW03sess2run10)),
                             session = rep("2", nrow(MW03sess2run10)),
                             run = rep("10", nrow(MW03sess2run10)),
                             MW03sess2run10) 

###session 3 run 1 ###
#reading in text file from Session 3 run 1 of MW03 as a data table
MW03sess3run1 <- read.table("MW03/Session3_run1.txt", header = F)

#adding column names 
colnames(MW03sess3run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run1$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run1 <- data.frame(sub = rep("MW03", nrow(MW03sess3run1)),
                            session = rep("3", nrow(MW03sess3run1)),
                            run = rep("1", nrow(MW03sess3run1)),
                            MW03sess3run1) 


###session 3 run 2 ###
#reading in text file from Session 3 run 2 of MW03 as a data table
MW03sess3run2 <- read.table("MW03/Session3_run2.txt", header = F)

#adding column names 
colnames(MW03sess3run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run2$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run2 <- data.frame(sub = rep("MW03", nrow(MW03sess3run2)),
                            session = rep("3", nrow(MW03sess3run2)),
                            run = rep("2", nrow(MW03sess3run2)),
                            MW03sess3run2) 


###session 3 run 3 ###
#reading in text file from Session 3 run 3 of MW03 as a data table
MW03sess3run3 <- read.table("MW03/Session3_run3.txt", header = F)

#adding column names 
colnames(MW03sess3run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run3$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run3 <- data.frame(sub = rep("MW03", nrow(MW03sess3run3)),
                            session = rep("3", nrow(MW03sess3run3)),
                            run = rep("3", nrow(MW03sess3run3)),
                            MW03sess3run3) 

###session 3 run 4 ###
#reading in text file from Session 3 run 4 of MW03 as a data table
MW03sess3run4 <- read.table("MW03/Session3_run4.txt", header = F)

#adding column names 
colnames(MW03sess3run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run4$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run4 <- data.frame(sub = rep("MW03", nrow(MW03sess3run4)),
                            session = rep("3", nrow(MW03sess3run4)),
                            run = rep("4", nrow(MW03sess3run4)),
                            MW03sess3run4) 


###session 3 run 5 ###
#reading in text file from Session 3 run 5 of MW03 as a data table
MW03sess3run5 <- read.table("MW03/Session3_run5.txt", header = F)

#adding column names 
colnames(MW03sess3run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run5$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run5 <- data.frame(sub = rep("MW03", nrow(MW03sess3run5)),
                            session = rep("3", nrow(MW03sess3run5)),
                            run = rep("5", nrow(MW03sess3run5)),
                            MW03sess3run5) 


###session 3 run 6 ###
#reading in text file from Session 3 run 6 of MW03 as a data table
MW03sess3run6 <- read.table("MW03/Session3_run6.txt", header = F)

#adding column names 
colnames(MW03sess3run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run6$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run6 <- data.frame(sub = rep("MW03", nrow(MW03sess3run6)),
                            session = rep("3", nrow(MW03sess3run6)),
                            run = rep("6", nrow(MW03sess3run6)),
                            MW03sess3run6) 

###session 3 run 7 ###
#reading in text file from Session 3 run 7 of MW03 as a data table
MW03sess3run7 <- read.table("MW03/Session3_run7.txt", header = F)

#adding column names 
colnames(MW03sess3run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run7$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run7 <- data.frame(sub = rep("MW03", nrow(MW03sess3run7)),
                            session = rep("3", nrow(MW03sess3run7)),
                            run = rep("7", nrow(MW03sess3run7)),
                            MW03sess3run7) 


###session 3 run 8 ###
#reading in text file from Session 3 run 8 of MW03 as a data table
MW03sess3run8 <- read.table("MW03/Session3_run8.txt", header = F)

#adding column names 
colnames(MW03sess3run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run8$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run8 <- data.frame(sub = rep("MW03", nrow(MW03sess3run8)),
                            session = rep("3", nrow(MW03sess3run8)),
                            run = rep("8", nrow(MW03sess3run8)),
                            MW03sess3run8) 


###session 3 run 9 ###
#reading in text file from Session 3 run 9 of MW03 as a data table
MW03sess3run9 <- read.table("MW03/Session3_run9.txt", header = F)

#adding column names 
colnames(MW03sess3run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run9$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run9 <- data.frame(sub = rep("MW03", nrow(MW03sess3run9)),
                            session = rep("3", nrow(MW03sess3run9)),
                            run = rep("9", nrow(MW03sess3run9)),
                            MW03sess3run9) 

###session 3 run 10 ###
#reading in text file from Session 3 run 10 of MW03 as a data table
MW03sess3run10 <- read.table("MW03/Session3_run10.txt", header = F)

#adding column names 
colnames(MW03sess3run10) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess3run10$null <- NULL

#labeling each row with subject number, session, and run
MW03sess3run10 <- data.frame(sub = rep("MW03", nrow(MW03sess3run10)),
                             session = rep("3", nrow(MW03sess3run10)),
                             run = rep("10", nrow(MW03sess3run10)),
                             MW03sess3run10) 

###Session 4 run 1 ###
#reading in text file from Session 4 run 1 of MW03 as a data table
MW03sess4run1 <- read.table("MW03/Session4_run1.txt", header = F)

#adding column names 
colnames(MW03sess4run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run1$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run1 <- data.frame(sub = rep("MW03", nrow(MW03sess4run1)),
                            session = rep("4", nrow(MW03sess4run1)),
                            run = rep("1", nrow(MW03sess4run1)),
                            MW03sess4run1) 


###Session 4 run 2 ###
#reading in text file from Session 4 run 2 of MW03 as a data table
MW03sess4run2 <- read.table("MW03/Session4_run2.txt", header = F)

#adding column names 
colnames(MW03sess4run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run2$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run2 <- data.frame(sub = rep("MW03", nrow(MW03sess4run2)),
                            session = rep("4", nrow(MW03sess4run2)),
                            run = rep("2", nrow(MW03sess4run2)),
                            MW03sess4run2) 


###Session 4 run 3 ###
#reading in text file from Session 4 run 3 of MW03 as a data table
MW03sess4run3 <- read.table("MW03/Session4_run3.txt", header = F)

#adding column names 
colnames(MW03sess4run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run3$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run3 <- data.frame(sub = rep("MW03", nrow(MW03sess4run3)),
                            session = rep("4", nrow(MW03sess4run3)),
                            run = rep("3", nrow(MW03sess4run3)),
                            MW03sess4run3) 


###Session 4 run 4 ###
#reading in text file from Session 4 run 4 of MW03 as a data table
MW03sess4run4 <- read.table("MW03/Session4_run4.txt", header = F)

#adding column names 
colnames(MW03sess4run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run4$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run4 <- data.frame(sub = rep("MW03", nrow(MW03sess4run4)),
                            session = rep("4", nrow(MW03sess4run4)),
                            run = rep("4", nrow(MW03sess4run4)),
                            MW03sess4run4) 


###Session 4 run 5 ###
#reading in text file from Session 4 run 5 of MW03 as a data table
MW03sess4run5 <- read.table("MW03/Session4_run5.txt", header = F)

#adding column names 
colnames(MW03sess4run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run5$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run5 <- data.frame(sub = rep("MW03", nrow(MW03sess4run5)),
                            session = rep("4", nrow(MW03sess4run5)),
                            run = rep("5", nrow(MW03sess4run5)),
                            MW03sess4run5) 

###Session 4 run 6 ###
#reading in text file from Session 4 run 6 of MW03 as a data table
MW03sess4run6 <- read.table("MW03/Session4_run6.txt", header = F)

#adding column names 
colnames(MW03sess4run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run6$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run6 <- data.frame(sub = rep("MW03", nrow(MW03sess4run6)),
                            session = rep("4", nrow(MW03sess4run6)),
                            run = rep("6", nrow(MW03sess4run6)),
                            MW03sess4run6) 



###Session 4 run 7 ###
#reading in text file from Session 4 run 7 of MW03 as a data table
MW03sess4run7 <- read.table("MW03/Session4_run7.txt", header = F)

#adding column names 
colnames(MW03sess4run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run7$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run7 <- data.frame(sub = rep("MW03", nrow(MW03sess4run7)),
                            session = rep("4", nrow(MW03sess4run7)),
                            run = rep("7", nrow(MW03sess4run7)),
                            MW03sess4run7) 

###Session 4 run 8 ###
#reading in text file from Session 4 run 8 of MW03 as a data table
MW03sess4run8 <- read.table("MW03/Session4_run8.txt", header = F)

#adding column names 
colnames(MW03sess4run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run8$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run8 <- data.frame(sub = rep("MW03", nrow(MW03sess4run8)),
                            session = rep("4", nrow(MW03sess4run8)),
                            run = rep("8", nrow(MW03sess4run8)),
                            MW03sess4run8) 

###Session 4 run 9 ###
#reading in text file from Session 4 run 9 of MW03 as a data table
MW03sess4run9 <- read.table("MW03/Session4_run9.txt", header = F)

#adding column names 
colnames(MW03sess4run9) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run9$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run9 <- data.frame(sub = rep("MW03", nrow(MW03sess4run9)),
                            session = rep("4", nrow(MW03sess4run9)),
                            run = rep("9", nrow(MW03sess4run9)),
                            MW03sess4run9) 

###Session 4 run 10 ###
#reading in text file from Session 4 run 10 of MW03 as a data table
MW03sess4run10 <- read.table("MW03/Session4_run10.txt", header = F)

#adding column names 
colnames(MW03sess4run10) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess4run10$null <- NULL

#labeling each row with subject number, session, and run
MW03sess4run10 <- data.frame(sub = rep("MW03", nrow(MW03sess4run10)),
                             session = rep("4", nrow(MW03sess4run10)),
                             run = rep("10", nrow(MW03sess4run10)),
                             MW03sess4run10) 


###Session 5 run 1 ###
#reading in text file from Session 5 run 1 of MW03 as a data table
MW03sess5run1 <- read.table("MW03/Session5_run1.txt", header = F)

#adding column names 
colnames(MW03sess5run1) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess5run1$null <- NULL

#labeling each row with subject number, session, and run
MW03sess5run1 <- data.frame(sub = rep("MW03", nrow(MW03sess5run1)),
                            session = rep("5", nrow(MW03sess5run1)),
                            run = rep("1", nrow(MW03sess5run1)),
                            MW03sess5run1) 


###Session 5 run 2 ###
#reading in text file from Session 5 run 2 of MW03 as a data table
MW03sess5run2 <- read.table("MW03/Session5_run2.txt", header = F)

#adding column names 
colnames(MW03sess5run2) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess5run2$null <- NULL

#labeling each row with subject number, session, and run
MW03sess5run2 <- data.frame(sub = rep("MW03", nrow(MW03sess5run2)),
                            session = rep("5", nrow(MW03sess5run2)),
                            run = rep("2", nrow(MW03sess5run2)),
                            MW03sess5run2) 

###Session 5 run 3 ###
#reading in text file from Session 5 run 3 of MW03 as a data table
MW03sess5run3 <- read.table("MW03/Session5_run3.txt", header = F)

#adding column names 
colnames(MW03sess5run3) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess5run3$null <- NULL

#labeling each row with subject number, session, and run
MW03sess5run3 <- data.frame(sub = rep("MW03", nrow(MW03sess5run3)),
                            session = rep("5", nrow(MW03sess5run3)),
                            run = rep("3", nrow(MW03sess5run3)),
                            MW03sess5run3) 


###Session 5 run 4 ###
#reading in text file from Session 5 run 4 of MW03 as a data table
MW03sess5run4 <- read.table("MW03/Session5_run4.txt", header = F)

#adding column names 
colnames(MW03sess5run4) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess5run4$null <- NULL

#labeling each row with subject number, session, and run
MW03sess5run4 <- data.frame(sub = rep("MW03", nrow(MW03sess5run4)),
                            session = rep("5", nrow(MW03sess5run4)),
                            run = rep("4", nrow(MW03sess5run4)),
                            MW03sess5run4) 


###Session 5 run 5 ###
#reading in text file from Session 5 run 5 of MW03 as a data table
MW03sess5run5 <- read.table("MW03/Session5_run5.txt", header = F)

#adding column names 
colnames(MW03sess5run5) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess5run5$null <- NULL

#labeling each row with subject number, session, and run
MW03sess5run5 <- data.frame(sub = rep("MW03", nrow(MW03sess5run5)),
                            session = rep("5", nrow(MW03sess5run5)),
                            run = rep("5", nrow(MW03sess5run5)),
                            MW03sess5run5) 


###Session 5 run 6 ###
#reading in text file from Session 5 run 6 of MW03 as a data table
MW03sess5run6 <- read.table("MW03/Session5_run6.txt", header = F)

#adding column names 
colnames(MW03sess5run6) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess5run6$null <- NULL

#labeling each row with subject number, session, and run
MW03sess5run6 <- data.frame(sub = rep("MW03", nrow(MW03sess5run6)),
                            session = rep("5", nrow(MW03sess5run6)),
                            run = rep("6", nrow(MW03sess5run6)),
                            MW03sess5run6) 


###Session 5 run 7 ###
#reading in text file from Session 5 run 7 of MW03 as a data table
MW03sess5run7 <- read.table("MW03/Session5_run7.txt", header = F)

#adding column names 
colnames(MW03sess5run7) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess5run7$null <- NULL

#labeling each row with subject number, session, and run
MW03sess5run7 <- data.frame(sub = rep("MW03", nrow(MW03sess5run7)),
                            session = rep("5", nrow(MW03sess5run7)),
                            run = rep("7", nrow(MW03sess5run7)),
                            MW03sess5run7) 

###Session 5 run 8 ###
#reading in text file from Session 5 run 8 of MW03 as a data table
MW03sess5run8 <- read.table("MW03/Session5_run8.txt", header = F)

#adding column names 
colnames(MW03sess5run8) <- c("OnsetSeconds", "null", "MWRatings") 

#removing second column
MW03sess5run8$null <- NULL

#labeling each row with subject number, session, and run
MW03sess5run8 <- data.frame(sub = rep("MW03", nrow(MW03sess5run8)),
                            session = rep("5", nrow(MW03sess5run8)),
                            run = rep("8", nrow(MW03sess5run8)),
                            MW03sess5run8) 


#####Combine all MW03 dataframes#####


MW03_all <- rbind(MW03sess1run1, MW03sess1run2, MW03sess1run3, MW03sess1run4, 
                  MW03sess1run5, MW03sess1run6, MW03sess1run7, MW03sess1run8, 
                  MW03sess2run1, MW03sess2run10, MW03sess2run2, MW03sess2run3, 
                  MW03sess2run4, MW03sess2run5, MW03sess2run6, MW03sess2run7, 
                  MW03sess2run8, MW03sess2run9, MW03sess3run1, MW03sess3run10,
                  MW03sess3run2, MW03sess3run3, MW03sess3run4, MW03sess3run5, 
                  MW03sess3run6, MW03sess3run7, MW03sess3run8, MW03sess3run9, 
                  MW03sess4run1, MW03sess4run10, MW03sess4run2, MW03sess4run3, 
                  MW03sess4run4, MW03sess4run5, MW03sess4run6, MW03sess4run7, 
                  MW03sess4run8, MW03sess4run9, MW03sess5run1, MW03sess5run2, 
                  MW03sess5run3, MW03sess5run4, MW03sess5run5, MW03sess5run6, 
                  MW03sess5run7, MW03sess5run8)


#zero-padding for formatting
MW03_all$run <- str_pad(MW03_all$run, 3, pad= "0")

#Create new categorical variable that labels each rating as a MW event or not
MW03_all <- MW03_all |> mutate(MWLabel = case_when(
  MWRatings > 4 ~ "Not mind wandering",
  MWRatings <= 4 ~ "Mind wandering"
))




#####Graph for MW03#####

ggplot(data = MW03_all) +
  geom_line(mapping = aes(x = OnsetSeconds, y = MWRatings), colour = 'darkorchid4', size = 1.75) + 
  geom_point(mapping = aes(x = OnsetSeconds, y = MWRatings, colour = MWLabel), size = 1.75) + #color code data
  facet_grid(session ~ run) + #facet_grid is the function that divides the data by both session and run
  labs(title = "Subject MW03", subtitle = "Ratings of Focus Overtime by Session / Run") +
  theme(panel.background = element_rect(fill = 'grey98'), #change color of background so it's not dark gray
        panel.spacing.x = unit(0, "lines"), #remove spacing for facet grid between runs
        panel.spacing.y = unit(0.2, "lines"), #make spacing between sessions in facet grid smaller
        strip.background = element_rect(fill = 'lavender')) + #changes color of facet grid labels
  geom_hline(yintercept = 4, linetype = 2, colour = 'grey64')



#####MW03 Analysis#####

length(MW03_all$MWRatings)

MW03_summary <- summary(MW03_all$MWRatings)
MW03_summary


length(which(MW03_all$MWLabel=='Mind wandering'))
length(which(MW03_all$MWLabel=='Not mind wandering'))































