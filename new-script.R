# Install the package in R
# install.packages("RPostgreSQL")
# library(RPostgreSQL)

## Loading required package: DBI
pgdrv <- dbDriver(drvName = "PostgreSQL")

db <-DBI::dbConnect(pgdrv,
                    dbname="it188",
                    host="localhost", port=5432,
                    user = 'postgres',
                    password = 'password')

options(sqldf.RPostgreSQL.user ="postgres", 
        sqldf.RPostgreSQL.password ="password",
        sqldf.RPostgreSQL.dbname ="it188",
        sqldf.RPostgreSQL.host ="localhost", 
        sqldf.RPostgreSQL.port =5432)

# See records of a table accordingly
showCustomers <- dbReadTable(db, c("customers"))
showProducts <- dbReadTable(db, c("products"))
showProducts_2 <- dbReadTable(db, c("products_2"))
showCustomerOrders <- dbReadTable(db, c("customer_orders"))
showOrderLines <- dbReadTable(db, c("order_line"))

# overwrite=TRUE will change both data and table structure
# When row.name=TRUE then column named row.names will be added to the table
cname <- readline(prompt="Enter name: ")
caddress <- readline(prompt="Enter address: ")
cphone <- readline(prompt="Enter phone: ")

dbSendQuery(db,
            paste("INSERT INTO customers (name, address, phone) 
                  VALUES ('", cname, "','", caddress, "',", cphone,");"))

