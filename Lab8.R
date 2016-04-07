source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")

str(Admissions)
df <- as.data.frame(Admissions)
head(df)
Admissions.raw <- NULL
for(i in 1:4) {
  Admissions.raw <- cbind(Admissions.raw, rep(as.character(df[,i]), df$Freq))
}
Admissions.raw <- as.data.frame(Admissions.raw)
names(Admissions.raw) <- names(df)[1:4]
dim(Admissions.raw)
str(Admissions.raw)
library(arules)
rules.all <-apriori(Admissions.raw)
inspect(rules.all)

for(i in 1:4){
  Admissions.raw <- cbind(Admissions.raw, rep(as.character(df[,i]), df$rank))
}

Admissions.raw <- NULL
for(i in 1:4){
  Admissions.raw <- cbind(Admissions.raw, rep(as.character(df[,i]), df$gpa))
}

