# Install the package in R
install.packages("RPostgreSQL")
library(RPostgreSQL)
## Loading required package: DBI
pgdrv <- dbDriver(drvName = "PostgreSQL")

db <-DBI::dbConnect(pgdrv,
                    dbname="it188",
                    host="localhost", port=5432,
                    user = 'postgres',
                    password = 'password')

DBI::dbListTables(db)

