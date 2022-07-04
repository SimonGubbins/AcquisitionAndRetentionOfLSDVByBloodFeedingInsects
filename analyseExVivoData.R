# R script to analyse level of viral DNA on insect parts after feeding ex vivo

# Load some libraries
library(MASS)
library(multcomp)

# Load the data
ex.vivo<-read.table("ProcessedExVivoDataForR_LogCopiesOnly.txt",header=T)

# Recode some variables as factors
ex.vivo$bodyPart<-factor(ex.vivo$bodyPart)
ex.vivo$source<-factor(ex.vivo$source)
ex.vivo$dpf<-factor(ex.vivo$dpf)

#Summarise the data
summary(ex.vivo)

# Fit a linear model
model<-lm(logCopies~bodyPart*source*dpf,data=ex.vivo,na.action=na.omit)
dropterm(model,test="F")
model<-update(model,~.-bodyPart:source:dpf)
dropterm(model,test="F")

# Check the model
par(mfrow=c(2,2))
plot(model)

# Output the final model
summary(model)

# Create a composite variable for assessing the interactions
ex.vivo$comb.var<-factor(paste(ex.vivo$bodyPart,ex.vivo$source,ex.vivo$dpf,sep="."))

# Fit the model with the composite variable and compare levels
model.too<-lm(logCopies~comb.var,data=ex.vivo,na.action=na.omit)
summary(glht(model.too,linfct=mcp(comb.var="Tukey")))
