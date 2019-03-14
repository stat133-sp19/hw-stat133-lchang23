#title: Shots Data
#description: Preparing variables and data for visualization of shots.
#input: 5 csv files each corresponding to one player.
#output: csv file combining all the players' shots data

# Specify data types for each column
data_types <- c("character", "character", "integer", "integer", "integer", "integer", "character", "character", "character", "integer", "character", "integer", "integer")

# Iguodala

iguodala <- read.csv("../data/andre-iguodala.csv", colClasses = data_types, stringsAsFactors = FALSE)

## Add column name
iguodala <- cbind(name = "Andre Iguodala", iguodala)

## Change values in column
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"

## Add column minute
iguodala$minute <- 12*iguodala$period - iguodala$minutes_remaining

## Export .txt.file
sink(file = "./output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

# Green
green <- read.csv("../data/draymond-green.csv", colClasses = data_types, stringsAsFactors = FALSE)

## Add column name
green <- cbind(name = "Draymond Green", green)

## Change values in column
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"

green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"

## Add column minute
green$minute <- 12*green$period - green$minutes_remaining

## Export .txt.file
sink("./output/draymond-green-summary.txt")
summary(green)
sink()

# Durant
durant <- read.csv("../data/kevin-durant.csv", colClasses = data_types, stringsAsFactors = FALSE)

## Add column name
durant <- cbind(name = "Kevin Durant", durant)

## Change values in column
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"

durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"

## Add column minute
durant$minute <- 12*durant$period - durant$minutes_remaining

## Export .txt.file
sink("./output/kevin-durant-summary.txt")
summary(durant)
sink()

# Thompson
thompson <- read.csv("../data/klay-thompson.csv", colClasses = data_types, stringsAsFactors = FALSE)

## Add column name
thompson <- cbind(name = "Klay Thompson", thompson)

## Change values in column
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"

thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"

## Add column minute
thompson$minute <- 12*thompson$period - thompson$minutes_remaining

## Export .txt.file
sink("./output/klay-thompson-summary.txt")
summary(thompson)
sink()

# Curry
curry <- read.csv("../data/stephen-curry.csv", colClasses = data_types, stringsAsFactors = FALSE)

## Add column name
curry <- cbind(name = "Stephen Curry", curry)

## Change values in column
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"

curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"

## Add column minute
curry$minute <- 12*curry$period - curry$minutes_remaining

## Export .txt.file
sink("./output/stephen-curry-summary.txt")
summary(curry)
sink() 

# Stack into one data frame

one <- rbind(iguodala, green, durant, thompson, curry)

# Write csv

write.csv(one, "./data/shots-data.csv")

sink("./output/shots-data-summary.txt")
summary(one)
sink()
