import mysql.connector as mysql
from datetime import date
#import boto3 as boto3
#import csv as csv

#client = boto3.client("s3")
try:

 print ( "Start of the program")
 cnx = mysql.connect(user='kavyamark', password='kavyamark24',
         host='terratest-example.ct9w3ysjragu.us-east-2.rds.amazonaws.com',
                              database='TestDB',
                              use_pure=False)
 cursor = cnx.cursor()

 print ( "After DB connect")

 today = date.today()

 add_prod = ("INSERT INTO products "
               "(item_no, item_name, description, active, createdate) "
               "VALUES (%s, %s, %s, %s, %s)")

 data_prod = ('K5434', 'Shirt', 'S size sleeves sweater','1',today)

# Insert new product

 print ( "After cursor")
# Now execute the sqlquery
 cursor.execute(add_prod, data_prod)
 cnx.commit()

 item_no = cursor.lastrowid
 print (item_no)

 #update 
 #upd_sql = "UPDATE products SET description  = 'M size sweater' WHERE item_no = '%(item_no)s'"
 upd_sql = "UPDATE products SET description = %s WHERE item_no = %s"
 val = ("L size sweater", "K5434")
 
 cursor.execute(upd_sql,val)

 cnx.commit()

 print(cursor.rowcount, "record(s) affected")
# Make sure data is committed to the database
 cnx.commit()

except mysql.Error as e:
    print("There is a problem with mysql", e)

# by writing finally if any error occurs
# then also we can close the all database operation
finally:
    if cursor:
        cursor.close()
    if cnx:
        cnx.close()
