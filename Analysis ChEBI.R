#Import the libraries
install.packages('dslabs')
install.packages('dyplr')
install.packages('readr')
install.packages('tidyverse')
install.packages('esquisse')
library(dslabs)
library(readr)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(esquisse)
library(tidyr)

#Sets the database to data
data <- read_csv2("data.csv")

#Creates a variable for each column of the database

#Way of representing chemical structures using ASCII characters
Smiles <- data$SMILES

#Indicate the simple numbers of each type of atom in a molecule
MolecularFormula <- data$MolecularFormula

#Number of atoms in the molecule
NumAtoms <- data$NumAtoms

#The exact molecular weight of the molecule
ExactMolWt <- data$ExactMolWt

#Number of Rotatable Bonds
NumRotableBonds <- data$NumRotableBonds

#Atom-based calculation of LogP
MolLogp <- data$MolLogp

#The exact ringcount of the molecule
RingCount <- data$RingCount

#Number of Hydrogen Bond Acceptors
NumHAcceptors <- data$NumHAcceptors

#Topological polar surface area
TPSA <- data$TPSA

#Number of Hydrogen Bond Donors
NumHDonors <- data$NumHDonors

#############################

#Plot NumRotableBonds x NumAtoms, colour = RingCount
ggplot(data) +
  aes(x = NumRotableBonds, y = NumAtoms, colour = RingCount) +
  geom_point(shape = "circle", size = 1.5) +
  scale_color_viridis_c(option = "viridis", direction = 1) +
  labs(title = "NumRotableBonds x NumAtoms") +
  theme_bw()


#Plot RingCount x NumHAcceptors

ggplot(data) +
  aes(x = RingCount, y = NumHAcceptors, colour = NumAtoms) +
  geom_point(shape = "circle", size = 1.5) +
  scale_color_viridis_c(option = "viridis", direction = 1) +
  labs(title = "RingCount x NumHAcceptors") +
  theme_bw()

#Plot ExactmolWt x NumHAcceptors 

ggplot(data) +
  aes(x = ExactMolWt, y = NumHAcceptors, colour = NumHDonors) +
  geom_point(shape = "circle", size = 1.5) +
  scale_color_viridis_c(option = "viridis", direction = 1) +
  labs(title = "ExactMolWt x NumHAcceptors") +
  theme_bw()


#plot NumrotableBonds x NumHAcceptors, colors = NumHDonors

ggplot(data) +
  aes(
    x = NumRotableBonds,
    y = NumHAcceptors,
    colour = NumHDonors
  ) +
  geom_point(shape = "circle", size = 1.5) +
  scale_color_viridis_c(option = "viridis", direction = 1) +
  labs(title = "NumRotableBonds x NumHAcceptors") +
  theme_minimal()

#Plot NumHAcceptors x NumAtoms, colour = ExactMolWt

ggplot(data) +
  aes(x = NumHAcceptors, y = NumAtoms, colour = ExactMolWt) +
  geom_point(shape = "circle", size = 1.5) +
  scale_color_viridis_c(option = "viridis", direction = 1) +
  labs(title = "NumHAcceptors x NumAtoms") +
  theme_bw()



#Max, Mean, min of each descriptor.

Max_Mean_Min <- data.frame(Descriptors = c("NumAtoms", "ExactMolWt", "NumRotableBonds", "RingCount", "NumHAcceptors","NumHDonors"),
                 Max = c(max(NumAtoms),
                         max(ExactMolWt),
                         max(NumRotableBonds),
                         max(RingCount),
                         max(NumHAcceptors),
                         max(NumHDonors)),
                 Mean = c(mean(NumAtoms),
                          mean(ExactMolWt),
                          mean(NumRotableBonds),
                          mean(RingCount),
                          mean(NumHAcceptors),
                          mean(NumHDonors)),
                 Min = c(min(NumAtoms),
                          min(ExactMolWt),
                          min(NumRotableBonds),
                          min(RingCount),
                          min(NumHAcceptors),
                          min(NumHDonors)),
                 stringsAsFactors = FALSE)

Max_Mean_Min

#Histogram NumAtoms
library(ggplot2)

ggplot(data) +
  aes(x = NumAtoms) +
  geom_histogram(bins = 30L, fill = "#112446") +
  labs(title = "Histogram NumAtoms") +
  theme_minimal()

#Histogram ExactMolWt

ggplot(data) +
 aes(x = ExactMolWt) +
 geom_histogram(bins = 30L, fill = "#55082E") +
 labs(title = "Histogram ExactMolWt") +
 theme_bw()

#Histogram RingCount

ggplot(data) +
 aes(x = RingCount) +
 geom_histogram(bins = 30L, fill = "#370542") +
 labs(title = "Histogram RingCount") +
 theme_bw()

#Histogram NumHAcceptors

ggplot(data) +
 aes(x = NumHAcceptors) +
 geom_histogram(bins = 30L, fill = "#11402A") +
 labs(title = "Histogram NumHAcceptors") +
 theme_bw()

#Histogram NumHDonors

ggplot(data) +
  aes(x = NumHDonors) +
  geom_histogram(bins = 30L, fill = "#674004") +
  labs(title = "Histogram NumHDonors") +
  theme_bw()









