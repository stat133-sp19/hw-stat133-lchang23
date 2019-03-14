#title: Shot Charts
#description: graphic visualization of the shots
#inputs: shots data of each player in csv
#outputs: 5 shot charts pdf files


library(jpeg)

library(grid)

library(ggplot2)

# court image
court_file <- "./images/nba-court.jpg"

# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
  
)

#import shots data
column_types <- c("NULL","character", "character", "character", "integer", "integer", "integer", "integer", "character", "character", "character", "integer", "character", "integer", "integer", "integer")

shots_data <- read.csv("../data/shots-data.csv", colClasses = column_types, stringsAsFactors = FALSE)

# andre shot chart
andre_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()

## andre pdf file
pdf("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
andre_shot_chart
dev.off()

# draymond shot chart
draymond_shot_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()

## draymond pdf file
pdf("../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
draymond_shot_chart
dev.off()

# kevin shot chart
kevin_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()

## kevin pdf file
pdf("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
kevin_shot_chart
dev.off()

# klay shot chart
klay_shot_chart <- ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()

## klay pdf file

pdf("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_shot_chart
dev.off()

# stephen shot chart
stephen_shot_chart <- ggplot(data = curry) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()

## stephen pdf file
pdf("../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
stephen_shot_chart
dev.off()

# Facetting

gsw_shot_chart <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  theme_minimal() + facet_wrap(~ name)

# save in pdf
pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
gsw_shot_chart
dev.off()

# save in png
png("../images/gsw-shot-charts.png", width = 1024, height = 768)
gsw_shot_chart
dev.off()