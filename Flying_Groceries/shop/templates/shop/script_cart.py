from datetime import datetime
import mysql.connector
import pandas as pd
import csv
import random

# TAKE PRODUCT DATA
filename = "Product.csv"
fields_p=[]
rows_p=[]
with open(filename,'r') as csvfile:
    csvreader=csv.reader(csvfile)
    fields_p=next(csvreader)
    for row in csvreader:
        rows_p.append(row)
ProductData=[]
print(rows_p)
for i in rows_p:
    # print(i)
    i[0]=int(i[0]) #cat id
    i[1]=int(i[1]) # subcat id
    i[2]=int(i[2]) # product id
    i[8]=int(i[8]) # quantity
    ProductData.append(tuple(i))
print(ProductData)

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123456",
    database="flying_groceries"
)

mycursor=mydb.cursor()
cart_entry=[]
for i in range(100):
    l=[]
    l.append(random.randint(1,50)+20)
    n=random.randint(1,99)
    tup=ProductData[n]
    l.append(tup[0])
    l.append(tup[1])
    l.append(tup[2])
    l.append(random.randint(1,tup[8]))
    l=tuple(l)
    cart_entry.append(l)

# print(cart_entry)
sqlFormula = "INSERT INTO Cart (CustomerId,CategoryId,SubCategoryId,ProductId,Quantity) VALUES (%s,%s,%s,%s,%s)"
mycursor.executemany(sqlFormula,cart_entry)
mydb.commit()
