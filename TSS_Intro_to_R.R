######################## INTRO TO R #########################

############### WOOOOOOOOOOOOOOO!!!!!!!!!!! #################

### Author: Bridget Chalifour, PhD ###
### Date Last Updated: June 10, 2026 ###
### For TSS 2026 ###

# Welcome to your R tutorial! By the end of this, you will be able to do lots of things in R, and better understand its capabilities.
# I have written much of this script for you, but there will be opportunities for you to try coding on your own.
# Do not skip these!! If you need help, first ask your teammates, then you can ask Bridget.

# Anytime you see something in green preceded by a "#", it is a comment!
# I want you to read the comments! They are your instructions.
# If you want R to skip something or not run it, just use a #!

# You can make a nice table of contents for your script to easily skip around! Use #s with text and click on the top button on the right with the lines to display.
# Then click on the text to go where you want! If you want to go back or forward a section, try using the table of contents.

# For Example:
# Big Header ####
## Smaller Header ####
#### Smaller Header ####


# Step 1: Verify your version of R and learn to run commands ####

# Run this command, either by clicking "Run" in top right corner, or CNTRL + ENTER for Windows and see what it returns in your console (below):
# You will need to make sure your cursor is on the command line for it to run!
sessionInfo()

# This will give you your version of R and your platform

# Step 2: Getting familiar with RStudio! ######################

# Right now, we are in the R "script", which is where we write code!
# The console is at the bottom pane of this program, and it is where you can enter commands for R to execute interactively,
# meaning that the command is executed and the result is displayed as soon as you hit the Enter key. 
# For example, at the command prompt ">", type in 2+2 and hit Enter; you will see.... 4!

# I usually run my command directly in the script, either by clicking "Run" with the green arrow in the top right corner, 
# or by using the shortcut "CNTRL + ENTER" on my keyboard. Try it!

2+2

# You should see [1] 4 as your output below. [1] simply refers to line number.

# The results from calculations can be stored in (assigned to) variables. You can assign values to variables in R using the <- operator. For example:

a <- 2+2

# Now, the output of 2+2 is assigned to "a". R automatically creates the variable a and stores the result (4) in it, 
# but by default doesn’t print anything. To ask R to print the value, just type the variable name by itself and run it.

a

# Special note! Note that c, q, t, C, D, F, I, and T, are built-in R functions. Using these are variable names may cause confusion or actual errors. So don't use them!

# Doing math in R!
# R uses +, -, *, /, and ^ for addition, subtraction, multiplication, division and exponentiation, respectively. For example:
  
x <- 5
y <- 2
z1 <- x*y
z2 <- x/y
z3 <- x^y

# We can use semi-colons to print many variables at once. Try it and check that R did the math correctly!

z1; z2; z3

# Your turn. Write code below that will run 54 minus 45, and save this as magic_number, then print the magic_number, and run it:

##### Write your code in here ######




###### yay #########################

# Step 3: Asking for help. #######################

# R has a help system, although it is generally better for reminding you about syntax or details, and for giving cross-references, 
# than for answering basic “how do I …?” questions.

# You can get help on an R function named sin by entering

?sin

# or

help(sin)

# By default, R ’s help system only provides information about functions that are in the base system and packages that you have already loaded.
# Special note: Google is your friend, and Bridget is also your friend. We are here to help you learn, so ask us too!

# Step 4: Wait, what are packages??? Installing and loading packages ########

# Packages are pre-built to help you with specific tasks. 
# One I use a lot is called vegan, it has all the complicated ecology stats equations built into it so I don't have to write the formulas myself. Yay!
# They can also be fun. People build packages for all kinds of stuff, 
# There are endless packages that have been developed for R, since it is an open-source platform. You can even build packages yourself and publish them!
# If you have a specific need in R, changes are there is a package for that!
# Let's install and load some of the basic packages for data cleaning, statistics, and making nice graphs that I tend to use often. 
# It doesn't matter if a package is loaded and you don't use it, but you can't run a function (command, tool, etc) from a specific package if it's not loaded into your R session.

# Run once on your computer - comment out when done to avoid confusion (on Windows, highlight text and hit CNTRL + SHIFT + C)
install.packages("dplyr") # data organizing/cleaning
install.packages("tidyr") # data organizing/cleaning
install.packages("tidyverse") # data organizing/cleaning
install.packages("ggplot2") # making nice figures/plots/graphs, resource: https://ggplot2.tidyverse.org/
install.packages("RColorBrewer") # color palettes, resource: https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
install.packages("vegan") 

# After we install the packages, we load them using the "library()" command:

library(dplyr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(RColorBrewer)
library(vegan)

# Let's install some fun ones too.

# Install emo(ji), which lets you put emojis in your R script! More info here: https://github.com/hadley/emo
# install.packages("devtools")
devtools::install_github("hadley/emo")
library(emo)

# Give it a whirl.
emo::ji("poop")
emo::ji("bird")
emo::ji("UFO")
emo::ji("yoga")

# You can add your own keywords in the ""s and see what comes up! Try it:
emo::ji("")

# Replace dots with dogs on graphs using ggdog.
install.packages("remotes")
remotes::install_github("R-CoderDotCom/ggdogs@main")
library(ggdogs)
 
# Run this example, you don't need to understand each line. This is just to show you what R can do.

grid <- expand.grid(1:5, 5:1)

df <- data.frame(x = grid[, 1],
                 y = grid[, 2],
                 image = c("doge", "doge_strong", "chihuahua", "eyes", "gabe", "glasses", "tail", "surprised",
                           "thisisfine", "hearing", "pug", "ears", "husky", "husky_2", "chilaquil", "santa", "bryan", "vinny", "jake",
                           "lucy", "puppie", "goofy", "snoopy", "scooby", "suspicious"))

ggplot(df) +
  geom_dog(aes(x, y, dog = image), size = 3) +
  geom_label(aes(x, y - 0.25, label = image), size = 4) +
  xlim(c(0.25, 5.5)) + 
  ylim(c(0.25, 5.5))

# These packages can animate graphs. 

install.packages('gganimate')
install.packages('gapminder')
install.packages("gifski")
library(gganimate)
library(gapminder)
library(gifski)

# Run this example, you don't need to understand each line. This is just to show you what R can do.

animation <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

animate(animation, renderer = gifski_renderer())

# You are doing so well so far! You deserve some praise.

remotes::install_github("rladies/praise")
library(praise)

# Run these!
praise()
praise()
praise()
praise("${EXCLAMATION}! You have gotten this far ${adverb_manner}!")

# Okay back to learning R. 
# Step 5: 1-dimensional data with Vectors #############

# The most basic data-type in R is the vector. A vector is just a 1-dimensional array of values. Several different kinds of vectors are available:
# numerical vectors,
# logical vectors,
# character-string vectors,
# factors,
# ordered factors, and
# lists.

# A vector’s defining attributes are its mode—which kind of vector it is— and its length. Vectors can also have a names attribute, which allows one to refer to elements by name.
# 
# We can create vectors in R using the c function, for example, run:

x <- c(1,3,5,7,9,11)
y <- c(6.5,4.3,9.1,-8.5,0,3.6)
z <- c("dog","cat","dormouse","chinchilla")
w <- c(a=4,b=5.5,c=8.8)
x; y; z; w

# How many numbers are in x? Run:
length(x)

# What kind of vector is y? Run:
mode(y)

# There are some basic stats already built into R. Try these to find average, miniumum, and standard deviation.

mean(y)
min(w)
sd(x)

# Your turn. Write code below that will tell you what kind of vector z is, and how many numbers are in y, then run it:

##### Write your code in here ######




###### yay #########################

# Step 6: Mastering 2-dimensional data with matrices and arrays ########################

# A matrix is a two-dimensional array of items. Most straightforwardly, we can create a matrix by specifying the number of rows and columns, and specifying the entries. For example

X <- matrix(c(1,2,3,4,5,6),nrow=2,ncol=3); X

# takes the values 1 to 6 and reshapes them into a 2 by 3 matrix. Note that the values in the data vector are put into the matrix column-wise, by default. 

# R will re-cycle through entries in the data vector, if need be, to fill a matrix of the specified size. So for example -

matrix(1,nrow=50,ncol=50)

# creates a 50×50 matrix, every entry of which is 1.

# Your turn. Write code below that will make a matrix called "Fred" of the numbers 1-10, split by 1-5, then 6-10, into 5 rows and 2 columns, then run it:

##### Write your code in here ######




###### yay #########################

# Step 7: Factor fun! ###########################

# A factor is a variable that can take one of a finite number of distinct levels. To construct a factor, we can apply the factor function to a vector of any class:
  
x <- rep(c(1,2),each=3); factor(x)

words <- c("jetpack","ferret","pizza","lawyer")
words <- factor(words); words

# Notice how R rearranged the words above in the output? It put them alphabetically. If you want to avoid that, you must set the levels of the factor yourself.

# Let's reorder by how likely you are to see one of these things today:

factor(words,levels=c("pizza","lawyer", "ferret", "jetpack"))

# Your turn. Write code below that will make a factor called "Names" of all of your names, then set levels to them in birthday order (January first, etc), then run it:

##### Write your code in here ######




###### yay #########################

# Step 8: Using Data Frames #############

# Vectors, matrices, and lists of one sort or another are found in just about every programming language. 
# The data frame structure is (or was last time I checked) unique to R , and is central to many of R ’s useful data-analysis features. 
# Data usually comes in many forms, lists, vectors, names, places, numbers. Data frames are designed to accomodate many types of data in one place.

# When data are read into R from an external file using one of the read.xxx commands (read.csv, read.table, read.xls, etc.) 
# [which we will use a lot in ecology], the object that is created is a data frame.
# Let's try downloading some dataframes:

data.url <- "https://kingaa.github.io/R_Tutorial/data/ChlorellaGrowth.csv"
dat <- read.csv(data.url,comment.char='#')
dat

# Quickly look inside a dataframe by running str(), which gives its structure:
str(dat)

# Step 9: Data visualization #############################

# Here, we will go through an extremely condensed introduction to R’s base graphics and —more importantly— the powerful data-visualization package ggplot2.

# Let’s load some data on transgenic mosquito survival time.

dat <- read.csv("https://kingaa.github.io/R_Tutorial/data/mosquitoes.csv")
str(dat)
View(dat)

# Let’s compare the average lifespan of transgenic (genetically modified) vs wildtype mosquitoes from this experiment. The following split the data into two subsets, one for each genetic type.

wt <- subset(dat,type=="wildtype",select=lifespan)
tg <- subset(dat,type=="transgenic",select=-type)

# What do these datasets look like? Run:

View(wt)
View(tg)

# To target specific columns of a dataframe, we use "$". Try this with the dataset. HINT: you can type wt$ and then hit TAB, it will give you autocomplete options!

dat$type
wt$lifespan

# Let’s try and visualize the data. First, make sure that the type of mosquito is a factor. Then make a basic plot using regular base R.

dat$type <- factor(dat$type)
plot(dat)

# We can also make histograms, which show distribution better.

op <- par(mfrow=c(1,2))
hist(tg$lifespan,breaks=seq(0,55,by=5),ylim=c(0,40))
hist(wt$lifespan,breaks=seq(0,55,by=5),ylim=c(0,40))

# Your turn. CHALLENGE: Write code below that will find the average lifespan for transgenic and wildtype mosquitos, then run it. 
# Use the help panel, Google, or your fellow interns for help. Which group's average lifespan is higher? Compare this is the plot you made earlier.

##### Write your code in here ######




###### yay #########################

# Step 10: Using ggplot ##############
# Using ggplot is the best package for data visualization, all you need to get started is a dataframe.
# These plots are super customizable, you can change colors, fonts, point sizes, backgrounds, as much as you want to get exactly what you want.
# Since we've been learning about birds, let's use a bird dataset.

install.packages("palmerpenguins")
library(palmerpenguins)

# Let's look at this penguin data
str(penguins)

# How many species are we working with? Hint: look at the number of levels.

unique(penguins$species) # this gives back all unique values of this column.

# Note there is a mix of continuous (numbers) and categorical (category) data here.

# We can count and make tables in R too. 
# Count penguins for each species / island

penguins %>%
  dplyr::count(species, island, .drop = FALSE)

# The %>% here is pipe, it tells R to take the dataset and then perform the actions after the pipe. In this instance, counting the penguin species on each island.
# This is an example of categorical and numeric data, the numbers are the counts and the categories are island and species.
# We can visualize this in a graph! Make a BARPLOT.
  
ggplot(penguins, aes(x = island, fill = species)) + # use ggplot, then tell it the dataframe you want to use, penguins. 
  geom_bar(alpha = 0.8) + # how big do you want the bars to be? geom_bar tells R you want to make a bar plot.
  scale_fill_manual(values = c("darkorange","purple","cyan4"), # specify the colors you want to use. Try changing these!
                    guide = FALSE) +
  theme_minimal() + # overall look
  facet_wrap(~species, ncol = 1) +
  coord_flip()

# Does every penguin live on every island?
# What about distributions of data? Let's look at bill length of the penguins by species.

# Jitter plot example: bill length by species. You could also make this a BOXPLOT by changing to geom_boxplot

ggplot(data = penguins, aes(x = species, y = bill_length_mm)) +
  geom_jitter(aes(color = species),
              width = 0.1, # try changing these values and see what happens!
              alpha = 0.7, # try changing these values and see what happens!
              show.legend = FALSE) +
  theme_minimal() + 
  scale_color_manual(values = c("darkorange","darkorchid","cyan4"))

# This is a good way to show variation in the data. Let's compare this method to a different kind of plot:

# Histogram example: bill length by species

ggplot(data = penguins, aes(x = bill_length_mm)) +
  geom_histogram(aes(fill = species), alpha = 0.5, position = "identity") +
  theme_minimal() +
  scale_fill_manual(values = c("darkorange","darkorchid","cyan4"))

# Which plot do you prefer? Often, there are no right answers, it is up to the scientist how to present data.

# How is body mass related to flipper length in penguins? Make a SCATTERPLOT.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  theme_minimal() + 
  scale_colour_manual(values = c("darkorange","purple","cyan4")) 

# Using color to communicate data (like which dots belong to which species) can really help simplify things.
# You also need to think about your audience - it is important to make figures colorblindness friendly!
# Let's try some color palettes to show this.

library(RColorBrewer)
head(brewer.pal.info, 18)  # show all 18 palettes

# Run the following lines, changing only the colors. Which one do you think is the easiest to read?

ggplot(data = penguins, aes(x = bill_length_mm)) +
  geom_histogram(aes(fill = species), alpha = 0.5, position = "identity") +
  theme_minimal() +
  scale_fill_manual(values = brewer.pal(3, "Spectral"))

ggplot(data = penguins, aes(x = bill_length_mm)) +
  geom_histogram(aes(fill = species), alpha = 0.5, position = "identity") +
  theme_minimal() +
  scale_fill_manual(values = brewer.pal(3, "Pastel1"))

ggplot(data = penguins, aes(x = bill_length_mm)) +
  geom_histogram(aes(fill = species), alpha = 0.5, position = "identity") +
  theme_minimal() +
  scale_fill_manual(values = brewer.pal(3, "Dark2"))


# FINAL TEST!!! Let's see if you can work with some data on your own and make your own graph. ###############

# Check out these tutorials to help you:
# https://r-statistics.co/Complete-Ggplot2-Tutorial-Part1-With-R-Code.html
# https://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html


# Pick one of these publicly available datasets.
install.packages("readr")

# Dataset #1: Chocolate Bar rankings:

chocolate <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2022/2022-01-18/chocolate.csv')
chocolate <- as.data.frame(chocolate)
View(chocolate)
str(chocolate)

# Make a BOX plot that shows chocolate bar beans by origin country vs. rating. Here's some code to get you started, feel free to customize as much as you want:
# Tip: copy and paste this code into the box below, then adjust as necessary.

# chocolate %>% ggplot(aes(x = "FILL IN", y = "FILL IN)) +
#   geom_FILL_IN(fill = "PICK A COLOR") +
#   labs(title = "GIVE ME A TITLE", x = "Rating", y = NULL) +
#   theme_minimal()

# Once you've made the plot, answer: Which country has the highest average ratings?
         
# Dataset #2: UFO Sightings:

ufo_sightings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2023/2023-06-20/ufo_sightings.csv')
View(ufo_sightings)
str(ufo_sightings)

# Make a BAR plot showing UFO sightings by U.S. State. Here's some code to get you started, feel free to customize as much as you want:
# Tip: copy and paste this code into the box below, then adjust as necessary.

# ufo_sightings %>%
#   dplyr::filter(country_code == "US", !is.na(state)) %>%
#   dplyr::count(state, sort = TRUE) %>%
#   dplyr::mutate(state = reorder(state, n)) %>%
#   ggplot(aes(x = n, y = state)) +
#   geom_FILL_IN(fill = "PICK A COLOR") +
#   labs(title = "GIVE ME A TITLE", x = "Count", y = NULL) +
#   theme_minimal()

# Once you've made the plot, answer: Which state has the highest UFO sightings?

# Dataset #3: Pixar movies:

pixar_films <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-03-11/pixar_films.csv')
View(pixar_films)
str(pixar_films)

# Make a SCATTER plot showing the movie runtime in minutes by release date, and color points by the film's rating. Here's some code to get you started, feel free to customize as much as you want:
# Tip: copy and paste this code into the box below, then adjust as necessary.

# pixar_films %>% ggplot(aes(x = "FILL IN", y = "FILL IN", label = film, color = "FILL IN")) +
#   geom_FILL_IN(size = 4) +
#   geom_text(size = 3, vjust = -0.7, color = "black") +
#   scale_color_brewer(palette = "PICK A PALETTE") +
#   labs(title = "PICK A TITLE", x = NULL, y = "Minutes", color = "Rating") +
#   theme_minimal()

# Once you've made the plot, answer: Which movie has the shortest runtime, and what was it rated?

##### Write your code in here ######
























###### yay #########################

# You did it!!! This is the end of the script!
praise()

# Let Bridget know you've finished, and please ask any questions!

######## THE END ##################
































































































chocolate %>% ggplot(aes(x = rating, y = country_of_bean_origin)) +
  geom_boxplot(fill = "violet") +
  labs(title = "Average Chocolate Rating by Bean Origin Country", x = "Rating", y = NULL) +
  theme_minimal()

ufo_sightings %>%
  dplyr::filter(country_code == "US", !is.na(state)) %>%
  dplyr::count(state, sort = TRUE) %>%
  dplyr::mutate(state = reorder(state, n)) %>%
  ggplot(aes(x = n, y = state)) +
  geom_col(fill = "green") +
  labs(title = "Top 20 US States for UFO Sightings", x = "Count", y = NULL) +
  theme_minimal()

pixar_films %>% ggplot(aes(x = release_date, y = run_time, label = film, color = film_rating)) +
  geom_point(size = 4) +
  geom_text(size = 3, vjust = -0.7, color = "black") +
  scale_color_brewer(palette = "Set2") +
  labs(title = "Pixar Runtimes Over Time", x = NULL, y = "Minutes", color = "Rating") +
  theme_minimal()

