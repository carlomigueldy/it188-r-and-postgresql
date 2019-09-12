# Install the package in R
install.packages("RPostgreSQL")
library(RPostgreSQL)

## Loading required package: DBI
pgdrv <- dbDriver(drvName = "PostgreSQL")

## Setup a Database connection
db <-DBI::dbConnect(pgdrv,
                    dbname="it188",
                    host="localhost", port=5432,
                    user = 'postgres',
                    password = 'password')

## Just run this snippet too
options(sqldf.RPostgreSQL.user ="postgres", 
        sqldf.RPostgreSQL.password ="password",
        sqldf.RPostgreSQL.dbname ="it188",
        sqldf.RPostgreSQL.host ="localhost", 
        sqldf.RPostgreSQL.port =5432)

# See records of a table accordingly
# Variable declaration for SELECT query of each tables
showCustomers <- dbReadTable(db, c("customers"))
showProducts <- dbReadTable(db, c("products"))
showCustomerOrders <- dbReadTable(db, c("customer_orders"))
showOrderLines <- dbReadTable(db, c("order_line"))

# Receive user input and pass them in to a variable
cname <- readline(prompt="Enter name: ")
caddress <- readline(prompt="Enter address: ")
cphone <- readline(prompt="Enter phone: ")

# The INSERT query
dbSendQuery(db,
            paste("INSERT INTO customers (name, address, phone) 
                  VALUES ('", cname, "','", caddress, "',", cphone,");"))

