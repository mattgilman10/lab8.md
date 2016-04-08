source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")

col_names <- head(Admissions)


library(arulesViz)

rules = apriori(col_names, parameter=list(support=0.08, confidence=0.9))
inspect(rules)

plot(rules)
plot(rules, method="graph", control=list(type="items"))
plot(rules, method="paracoord", control=list(reorder=TRUE))
