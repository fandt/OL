library(RODBC)
library(MASS)

con<- odbcDriverConnect('driver={MySQL ODBC 5.1 Driver};
	server=localhost;database=bottlesareus;uid=root')


#Plot of sales by person on first Saturday in January (1.2.2016)
statementA<-"SELECT DATE_FORMAT(dt_when, '%Y-%m-%d') DATEONLY, 
 	 count(dt_when), s_name,sum(`c_ticketitem_net_price`) 
	 FROM `itemsales` 
	 WHERE month(dt_when)=1 and day(dt_when)<8 
     group by s_name
       order by dt_when;"
queryA<-sqlQuery(con,statementA)

#TEST THAT COUNT(dt_when) AND ASK


odbcClose(con )
