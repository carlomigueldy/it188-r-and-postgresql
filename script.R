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


# See tables in Database
DBI::dbListTables(db)

# See records of a table accordingly
showCustomers <- dbReadTable(db, c("customers"))
showProducts <- dbReadTable(db, c("products"))
showCustomerOrders <- dbReadTable(db, c("customer_orders"))
showOrderLines <- dbReadTable(db, c("order_line"))

# INSERT; A customer orders 2 product
dbSendQuery(db, 
'INSERT INTO order_line (customer_order_id, product_id, qty) 
VALUES (1, 1, 2),  (1, 2, 3)')

# UPDATE;
dbSendQuery(db, 
            'UPDATE order_line 
            SET product_id = 3 
            WHERE product_id = 1')

# DLETE; Deleting order line record
dbSendQuery(db, 'DELETE FROM order_line WHERE customer_order_id = 1')

options(sqldf.RPostgreSQL.user ="postgres", 
        sqldf.RPostgreSQL.password ="password",
        sqldf.RPostgreSQL.dbname ="it188",
        sqldf.RPostgreSQL.host ="localhost", 
        sqldf.RPostgreSQL.port =5432)

dbExistsTable(db, "products")
myTable <- dbReadTable(db, c("customers"))

cname <- readline(prompt="Enter name: ")
caddress <- readline(prompt="Enter address: ")
cphone <- readline(prompt="Enter phone: ")

dbSendQuery(db,
            paste("INSERT INTO customers (name, address, phone) 
                  VALUES ('", cname, "','", caddress, "',", cphone,");"))

