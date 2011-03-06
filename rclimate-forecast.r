######### RClimate Script: Arctic Sea Ice Extent Trend & Forecast for Sept, 2011  ##########
##                                                                                        ##                                                                                       ## 
## Original Source data from NSIDC organized into 12 monthly files                        ##
## Sept data file Link: ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/Sep/N_09_area.txt  ##
## I have built and posted a consoldidated monthly csv file available at this link        ##
##     http://processtrends.com/files/RClimate_NSIDC_sea_ice_extent.csv                   ##
## R script & forecast developed by D Kelly O'Day                                         ##
##                   http:chartsgraphs.wordpress.com    2/22/11                           ##
## I got the basic idea of quadratic regression from Tamino, Open Mind Post:              ##
##    http://tamino.wordpress.com/2010/09/14/death-spiral/                                ##
## Updated 2/22/11: Reader Edi noticed that I did not define my predict vector a.         ##
############################################################################################
  
 link_n <- "http://processtrends.com/files/RClimate_NSIDC_sea_ice_extent.csv"
##  Original source data @ 
   link_orig <-  "ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/Sep/N_09_area.txt"
   sie <- read.table(link_n, skip = 1, sep = ",", header = F,
             colClasses = rep("numeric", 5),
             comment.char = "#", na.strings = "NA",
             col.names = c("yr_frac", "yr", "mo", "ext", "area")   )
  sie <- sie[,c(1,2,3,4)]
  sie <- subset(sie, yr_frac >= 1980) # get 1st full year of data

  mn <- 9
  sdf <- subset(sie, sie$mo==mn) ## get Sept data

### Quadratic regression: y = a + bx + cx^2
 ## Center x values # See here for explaination on centering for polynomial regression:
 ##   http://rtutorialseries.blogspot.com/2010/02/r-tutorial-series-basic-polynomial.html
  sdf$yr_c <- sdf$yr - mean(sdf$yr,na.rm=T) 
  sdf$yr_c2 <- sdf$yr_c^2

  q_m <- lm(ext ~ yr_c + yr_c2, data=sdf)
  a <- predict(q_m)
# Predict 2011 value
  future <- data.frame(2011,2011-1994.4, (2011-1994.5)^2)
  names(future) <- c("yr", "yr_c", "yr_c2")
  f <- predict(q_m, future,interval="confidence")
  f_range <- range(f[,2]:f[,3])

###########################################################################
# send to png
png(file = "out-1.png", width = 500, height = 400)

 # Plot annotation strings
   y_lab <- expression(paste("Arctic SIE - millions k",m^2))
   pl_title <- "September Arctic Sea Ice Extent\n 1980-2010 Trend & Forecast for 2011 - on Centaure"
   proj_2011 <- paste("Forecast Sept, 2011 SIE @ ",signif(f[,1],3), " mil km2 ", "(CI: "
     , signif(f[,2],3), " - ", signif(f[,3],3),")",sep="")  

 ## Basic plot
  par(las=1); par(ps=10); par(oma=c(3.5,2,1,1)); par(mar=c(2,5,2,1))
  par(bg="white"); par(mfrow=c(1,1))
 plot(sdf$yr, sdf$ext, type="o",col="grey",pch=16,xlim=c(1980, 2012),  ylim=c(3.7,8),
   xlab="", ylab = y_lab, main=pl_title, cex=0.75, las=1, pty="m")

 # Add quadratic trend line
   points(sdf$yr, a, type="l", pch=16,col="blue",lwd=2)
 # Add forecast points & line
   points(2011, f[,1], type="p", col ="red", pch=16) 
   points(2011, f[,2], type="p", col="red", pch=16, cex=0.75)
   points(2011, f[,3], type="p", col="red", pch=16, cex=0.75)
   lines(x=c(2011,2011), y=c(f[,2], f[,3]), type="l", col="red", lwd=1.5)
   lines(2011,f[,2], 2011, f[,3], col="black", type="l")

 source_note <- paste("Original Data Source: ", link_orig, sep="")
 mtext(source_note, 1,0, outer=T, adj=0.5, cex=0.75)
 legend(1979,4.5, c("September SIE - mil km2:1980-2010", "Quadratic Trend Line (1980-2010)", proj_2011), col = c("grey", "blue","red"),
       text.col = "black",lty = c(1,1,1),lwd=c(1,2,2),pch=c(16,0,16),pt.cex=c(1,0,1),
       merge = F, bg = "white", bty="o", box.col = "white", cex = .7)
 
# Generate and add bottom footer KOD & System data notes
       mtext("D Kelly O'Day - http://chartsgraphs.wordpress.com", 1,1, adj = 0, cex = 0.8, outer=T)
       mtext(format(Sys.time(), "%m/%d/ %Y"), 1, 1, adj = 1, cex = 0.8, outer=T)

# file's end
dev.off()

