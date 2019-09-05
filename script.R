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
dbGetQuery(db, 'SELECT * FROM customers')
dbGetQuery(db, 'SELECT * FROM products')
dbGetQuery(db, 'SELECT * FROM customer_orders')
dbGetQuery(db, 'SELECT * FROM order_line')

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
  