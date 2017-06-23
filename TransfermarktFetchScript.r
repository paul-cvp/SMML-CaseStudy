library(RCurl)
library(XML)
library(gdata)
  for (year in 2011:2016){
    for (month in c(01,02,03,04,05,06,07,08,09,10,11,12)){
      for (date in c(01,15)){
        buli.url<- paste("https://www.transfermarkt.com/1-bundesliga/marktwerteverein/wettbewerb/L1/plus/?stichtag=",year,"-",month,"-",date, sep ="")
        parsedHTML <- htmlParse(getURL(buli.url), asText = T)
        raw.tab <- xpathSApply(parsedHTML, "//tbody", xmlValue)[2]
        cl.tab <- trim(gsub("[\r\n]+", " ", raw.tab))
        spl.tab <- trim(strsplit(cl.tab, "%",fixed = TRUE)[[1]])
        spl.tab <- spl.tab[spl.tab != ""]
        
        assign(paste("table",year,month,date,sep="."),spl.tab)
        
      }
    }
  }
#buli.url<-"https://www.transfermarkt.com/1-bundesliga/marktwerteverein/wettbewerb/L1/plus/?stichtag=2017-06-19"

#parsedHTML <- htmlParse(getURL(buli.url), asText = T)
#raw.tab <- xpathSApply(parsedHTML, "//tbody", xmlValue)[2]

#cl.tab <- trim(gsub("[\r\n]+", " ", raw.tab))
#spl.tab <- trim(strsplit(cl.tab, "-",fixed = TRUE)[[1]])
#spl.tab <- spl.tab[spl.tab != ""]
