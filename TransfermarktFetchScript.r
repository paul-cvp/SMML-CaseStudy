library(RCurl)
library(XML)
library(gdata)
buli.url<-"https://www.transfermarkt.com/1-bundesliga/marktwerteverein/wettbewerb/L1/plus/?stichtag=2017-06-19"

parsedHTML <- htmlParse(getURL(buli.url), asText = T)
raw.tab <- xpathSApply(parsedHTML, "//tbody", xmlValue)[2]

cl.tab <- trim(gsub("[\r\n]+", " ", raw.tab))
spl.tab <- trim(strsplit(cl.tab, "-",fixed = TRUE)[[1]])
spl.tab <- spl.tab[spl.tab != ""]
